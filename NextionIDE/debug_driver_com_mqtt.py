import threading
import time
import serial
import binascii
import struct
import codecs
import random
from paho.mqtt import client as mqtt_client

_comPort = serial.Serial('COM3',timeout=1)
_mqttBroker = '192.168.2.100'
_mqttPort = 1883
_mqttPublishtopic = "tele/tasmota_DEBUG/RESULT"
_mqttSubscribeTopic = "cmnd/tasmota_DEBUG/CzstomSend"
def BuildCRC16(data:bytes, poly:hex=0xA001) -> str:
    crc = 0xFFFF
    for b in data:
        crc ^= b
        for _ in range(8):
            crc = ((crc >> 1) ^ poly
                   if (crc & 0x0001)
                   else crc >> 1)
    return crc
    

def SendToSerial(value):  
    payload = bytes(value, 'utf-8')
    header = binascii.unhexlify('55BB')
    print("length:", len(payload))
    length = len(payload).to_bytes(2, 'little')
    bytes_payload = header + length + payload
    msg_crc = BuildCRC16(bytes_payload)
    crc=struct.pack('H', msg_crc)
    print("\n\n")
    try:
      _comPort.write(bytes_payload + crc)
      _comPort.flush()
    except:
        print("serial com exception")
    #sport.close()

def ConnectToMqtt():   
    client_id = f'python-mqtt-{random.randint(0, 1000)}'
    def on_connect_event_handler(client, userdata, flags, rc):
        if rc == 0:
            print("Connected to MQTT Broker!")
        else:
            print("Failed to connect, return code %d\n", rc)
    # Set Connecting Client ID
    client = mqtt_client.Client(client_id)
    #client.username_pw_set(username, password)
    client.on_connect = on_connect_event_handler
    client.connect(_mqttBroker, _mqttPort)
    return client

def SubscribeToMqtt(client: mqtt_client):    
    def on_message_event_handler(client, userdata, msg):
        print(f"Received `{msg.payload.decode()}` from `{msg.topic}` topic")
        SendToSerial(msg.payload.decode())
    client.subscribe(_mqttSubscribeTopic)
    client.on_message = on_message_event_handler


def PublishToMqtt(client,msg):
    msg_count = 0
    time.sleep(1)
    result = client.publish(_mqttPublishtopic, msg)
    # result: [0, 1]
    status = result[0]
    if status == 0:
        print(f"Send `{msg}` to topic `{_mqttPublishtopic}`")
    else:
        print(f"Failed to send message to topic {_mqttPublishtopic}")
    msg_count += 1

def serial_data_received_handler(data,mqtt):
    if(data[0] == 0x86):
        PublishToMqtt(mqtt,"event,system,autosleep")
    elif(data[0] == 0x87):
        PublishToMqtt(mqtt,"event,system,autowakeup")
    elif(data[0] == 0x55):
        endIndex = len(data)-2
        PublishToMqtt(mqtt,data[4:endIndex])


def ReadFromSerialPort(ser,mqttclient):
    connected = False
    while not connected:        
        connected = True
        while True:           
           reading = ser.read(1000) #quick & dirty !                     
           if(len(reading) > 0):
               print("reading serial... length:"+str(len(reading)))
               serial_data_received_handler(reading,mqttclient)


if __name__ == '__main__':
    mqttclient = ConnectToMqtt()
    SubscribeToMqtt(mqttclient)
    thread = threading.Thread(target=ReadFromSerialPort, args=(_comPort,mqttclient))
    thread.start()
    mqttclient.loop_forever()
