#include <ESP8266WiFi.h>     //Include Esp library
#include <WiFiClient.h> 
#include <ESP8266WebServer.h>
#include <ESP8266HTTPClient.h>
#include <SPI.h>
#include <MFRC522.h>        //include RFID library
#include <LiquidCrystal_I2C.h>
#include <Wire.h>
#include <ArduinoJson.h>

#define SS_PIN 2 //RX slave select
#define RST_PIN 0

#define RedLed 16
#define BlueLed 15
#define Buzzer A0
LiquidCrystal_I2C lcd(0x27, 16, 2);
MFRC522 mfrc522(SS_PIN, RST_PIN); // Create MFRC522 instance.

/* Set these to your desired credentials. */
const char *ssid = "*****";  //ENTER YOUR WIFI SETTINGS
const char *password = "******";

//Web/Server address to read/write from 
const char *host = "192.168.43.231";   //IP address of server

String getData ,Link;
String CardID="";

void setup() {
  delay(1000);
  Serial.begin(115200);
  SPI.begin();  // Init SPI bus
  mfrc522.PCD_Init(); // Init MFRC522 card
  Wire.begin(D2,D1);
  lcd.init();
  lcd.backlight();
  
  WiFi.mode(WIFI_OFF);        //Prevents reconnection issue (taking too long to connect)
  delay(1000);
  WiFi.mode(WIFI_STA);        //This line hides the viewing of ESP as wifi hotspot
  
  WiFi.begin(ssid, password);     //Connect to your WiFi router
  Serial.println("");
  lcd.clear();
  lcd.print("Initializing.");
  delay(1000);
  lcd.clear();
  lcd.print("Initializing..");
  delay(1000);
  lcd.clear();
  lcd.print("Initializing...");
  delay(1000);
  lcd.clear();
  lcd.print("Connecting to");
  lcd.setCursor(0,1);
  lcd.print(ssid);
  
  Serial.print("Connecting to ");
  Serial.print(ssid);
  delay(1000);
  // Wait for connection
  lcd.clear();
  while (WiFi.status() != WL_CONNECTED) {
    lcd.clear();
    //delay(500);
    Serial.print(".");
    lcd.print("Connecting...");
    delay(500);
  }

  //If connection successful show IP address in serial monitor
  Serial.println("");
  lcd.clear();
  lcd.print("Connected");
  lcd.setCursor(0,1);
  lcd.print(WiFi.localIP());
  Serial.println("Connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());  //IP address assigned to your ESP
  delay(1000);
  pinMode(RedLed,OUTPUT);
  pinMode(BlueLed,OUTPUT);
  pinMode(Buzzer,OUTPUT);
  
}

void loop() {
  if(WiFi.status() != WL_CONNECTED){
    WiFi.disconnect();
    WiFi.mode(WIFI_STA);
    lcd.clear();
    lcd.print("Connection Lost");
    delay(1000);
    lcd.clear();
    lcd.print("Reconnecting to");
    lcd.setCursor(0,1);
    lcd.print(ssid);
    delay(1000);
    Serial.print("Reconnecting to ");
    Serial.println(ssid);
    WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    lcd.clear();
    //delay(500);
    Serial.print(".");
    lcd.print("Connecting...");
    delay(500);
  }
    lcd.clear();
    lcd.print("Connected");
    lcd.setCursor(0,1);
    lcd.print(WiFi.localIP());
    delay(1000);
    Serial.println("");
    Serial.println("Connected");
    Serial.print("IP address: ");
    //lcd.clear();
    //lcd.print(WiFi.localIP());
    //Serial.println(WiFi.localIP());  //IP address assigned to your ESP
  }
  lcd.clear();
  lcd.print("Scan your Card");
  delay(1000);
  
  //look for new card
   if ( ! mfrc522.PICC_IsNewCardPresent()) {
  return;//got to start of loop if there is no card present
 }
 // Select one of the cards
 if ( ! mfrc522.PICC_ReadCardSerial()) {
  return;//if read card serial(0) returns 1, the uid struct contians the ID of the read card.
 }

 for (byte i = 0; i < mfrc522.uid.size; i++) {
     CardID += mfrc522.uid.uidByte[i];
}
  
  HTTPClient http;    //Declare object of class HTTPClient
  
  //GET Data
  getData = "?CardID=" + CardID;  //Note "?" added at front
  Link = "http://192.168.43.231/attendance/includes/postdemo.php" + getData;
  http.begin(Link);
  int httpCode = http.GET();            //Send the request
  delay(10);
  //String payload = http.getString();    //Get the response payload
  Serial.println(httpCode);   //Print HTTP return code
  //Serial.println(payload);    //Print request response payload
  Serial.println(CardID);       //Print Card ID
  lcd.clear();
  lcd.print("Card ID");
  lcd.setCursor(0,1);
  lcd.print(CardID);
  delay(1000);
  if(httpCode == 200)
  {

    digitalWrite(RedLed,HIGH);
    lcd.clear();
    lcd.print("CARD ID READ");
    lcd.setCursor(0,1);
    lcd.print("SUCCESSFULLY");
    delay(1000);
    const size_t bufferSize =JSON_OBJECT_SIZE(2)+JSON_OBJECT_SIZE(3)+JSON_OBJECT_SIZE(5)+JSON_OBJECT_SIZE(8)+370;
    DynamicJsonBuffer jsonBuffer(bufferSize);
    JsonObject& root = jsonBuffer.parseObject(http.getString());
    //Parameters
    String user=root["user"];
    String activity=root["activity"];
    lcd.clear();
    //lcd.print("Hello");
    lcd.setCursor(0,1);
    lcd.print(user);
    delay(1000);
    lcd.clear();
    lcd.print(activity);
    delay(1000);
    Serial.print(user);
    Serial.print(activity);
    
  }
  else{
    digitalWrite(BlueLed,HIGH);
    lcd.clear();
    lcd.print("SERVER ERROR");
    lcd.setCursor(0,1);
    lcd.print("CHECK SERVER IP");
    delay(1000);
  }
  
  //lcd.print(CardID);

  
  delay(500);
  
  CardID = "";
  getData = "";
  Link = "";
  http.end();  //Close connection
  
  digitalWrite(RedLed,LOW);
  digitalWrite(BlueLed,LOW);
}
//=======================================================================
