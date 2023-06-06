//Aula 13 - 2023_06_06

/*
1 - Ler o sensor de batimentos
2 - Identificar a localizacao do usuärio
3 - Verificar se esta acima ou abaixo os batimentos
4 - Acima vermelho, alerta + localizacao
5 - Abaixo, verde normal
*/

#include <ESP8266WiFi.h>
#include <PubSubClient.h>


//atualize SSID e senha WiFi
const char* ssid = "HackaTruckVisitantes";
const char* password = "";


//D4 only for Lolin board
#define LED_BUILTIN D4


//Atualize os valores de Org, device type, device id e token
#define ORG "lcj8oh"
#define DEVICE_TYPE "sensorGPS"
#define DEVICE_ID "localizacaoGPS"
#define TOKEN "123456789"

//broker messagesight server
char server[] = ORG ".messaging.internetofthings.ibmcloud.com";
char topic[] = "iot-2/evt/status/fmt/json";
char authMethod[] = "use-token-auth";
char token[] = TOKEN;
char clientId[] = "d:" ORG ":" DEVICE_TYPE ":" DEVICE_ID;


WiFiClient wifiClient;
PubSubClient client(server, 1883, NULL, wifiClient);


void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}
