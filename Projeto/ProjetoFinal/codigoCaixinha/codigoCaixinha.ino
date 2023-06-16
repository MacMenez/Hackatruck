#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h>



const char* ssid = "HackaTruckVisitantes";
const char* password = "";


#define ORG "tuzgwy"
#define DEVICE_TYPE "farmaciakit"
#define DEVICE_ID "123321"
#define TOKEN "123456789"

//broker messagesight server
char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
char topic[] = "iot-2/evt/status/fmt/json";
char authMethod[] = "use-token-auth";
char token[] = TOKEN;
char clientId[] = "d:" ORG ":" DEVICE_TYPE ":" DEVICE_ID;
int led5=5;
int led4= 4;
int led0 =12;
int ledum =13;
int leddois =15;
int led3 =14;
int ledultimo=16;

const unsigned char Passive_buzzer = 00;

//botao
int botao=2;
int pos_bot=0;
int inicial=0;
int controle =0;
int botao2=1;
int pos2=0;


// Inicia variáveis de tempo
unsigned long millis1 = millis();
unsigned long millis2 = millis();


WiFiClient wifiClient;
PubSubClient client(server, 1883, NULL, wifiClient);


void setup () {  Serial.begin(115200);
  Serial.println();
  Serial.println("Iniciando...");

  Serial.print("Conectando na rede WiFi "); Serial.print(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("[INFO] Conectado WiFi IP: ");
  Serial.println(WiFi.localIP());
pinMode (led0,OUTPUT) ;
pinMode (ledum,OUTPUT) ;
pinMode (leddois,OUTPUT) ;
pinMode (led3,OUTPUT) ;

pinMode (led5,OUTPUT) ;
pinMode(ledultimo,OUTPUT);
pinMode (led4,OUTPUT) ;
// buzzer
pinMode (Passive_buzzer,OUTPUT) ;
//botao
 pinMode(botao, INPUT);
  pinMode(botao2, INPUT);
}

void loop () {
pos_bot=digitalRead(botao);
pos2=digitalRead(botao2);

 if(pos_bot ==HIGH) {
digitalWrite(ledum,HIGH); 
 
  tone(Passive_buzzer, 5003) ; }

 if(pos_bot ==LOW) {
 
  digitalWrite(ledum,LOW); 

  noTone(Passive_buzzer);
  delay (30000);
}




 }




