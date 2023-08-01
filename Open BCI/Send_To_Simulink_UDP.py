import socket
import struct
import random
from pyOpenBCI import OpenBCICyton
import time

#def print_raw(sample):
#print(sample.channels_data[1])

board = OpenBCICyton(port='COM4', daisy=True)

localIP     = "127.0.0.1"

localPort   = 20001

bufferSize  = 1024
 
# msgFromServer  = [20000,-1,3,5,5]
#msgFromServer  =  random.randint(0, 9) 
# msgFromServer  = 200
# print(struct.calcsize("!5i"))
# bytesToSend         = str.encode(msgFromServer) # udp only bytes so its cast the string into bytes
#bytesToSend=struct.pack('<5i',*msgFromServer) # ממיר לביט

# bytesToSend=struct.pack('<h',msgFromServer)

#bytesToSend=struct.pack("!5q",*msgFromServer)
#bytesToSend=struct.pack(">bhl", 1.1, 3, 4)
# bytesToSend=struct.pack("!>h",30000)

# print(len(bytesToSend))

# Create a datagram socket

UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM) # יצירת סוקט

# Bind to address and ip

UDPServerSocket.bind((localIP, localPort)) # מחברים את הסוקט לאייפי ופורט

 

print("UDP server up and listening")

test =('127.0.0.1',49004)

# Listen for incoming datagrams


while(True):

    #msgFromServer = [board.channels_data[1]]
    #bytesToSend=struct.pack("!1l",*msgFromServer)

    def print_raw(sample):
        
 
        # ch1 = int(sample.channels_data[1]/1000000)
        # print(ch1)
        # msgFromServer = [ch1,1]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ split if its more then 32000
        # SampleString= str(sample.channels_data[1]) 
        # size = len(SampleString)
        # middle = size // 2 
        # first, second = SampleString[:middle], SampleString[middle:] 
        # print(sample.channels_data[1])
        # print(first)
        # print(second)
        # print('hi')
        #intNumber = int(sample.channels_data[1])

        # print(intNumber)
        # print(intNumber / 100)
        # if ((intNumber < -32000) & (32000 < intNumber)):
        #     intNumber = intNumber / 100
            
        #     msgFromServer = [intNumber,1]
        #     bytesToSend=struct.pack("2h",*msgFromServer)
        #     UDPServerSocket.sendto(bytesToSend,test)

        # else:
        #     msgFromServer = [intNumber,1]
        #     bytesToSend=struct.pack("2h",*msgFromServer)
        #     UDPServerSocket.sendto(bytesToSend,test)

        #intNumber=float(sample.channels_data[0])

        # intNumber1=float(sample.channels_data[1] / 1000)
        # intNumber2=float(sample.channels_data[2] / 1000)
        # intNumber3=float(sample.channels_data[3] / 1000)
        # intNumber4=float(sample.channels_data[4] / 1000)
        # intNumber5=float(sample.channels_data[5] / 1000)
        # intNumber6=float(sample.channels_data[6] / 1000)
        # intNumber7=float(sample.channels_data[7] / 1000)
        #intNumber8=float(sample.channels_data[8] / 1000)
        #print(intNumber)
        # print(intNumber)
        #msgFromServer = [intNumber,intNumber1,intNumber2,intNumber3,intNumber4,intNumber5,intNumber6,intNumber7]
        # bytesToSend=struct.pack("8d",*msgFromServer)
        # UDPServerSocket.sendto(bytesToSend,test)
        # msgFromServer=[]
        # for data in sample.channels_data :
        #     msgFromServer.append(data)
        # time.sleep(0.1)
        #msgFromServer = [sample.channels_data[0],sample.channels_data[1],sample.channels_data[2],sample.channels_data[3],sample.channels_data[4],sample.channels_data[5],sample.channels_data[6],sample.channels_data[7],sample.channels_data[8],sample.channels_data[9],sample.channels_data[10],sample.channels_data[11],sample.channels_data[12]]
        msgFromServer = [sample.channels_data[0],sample.channels_data[1],sample.channels_data[2],sample.channels_data[3],sample.channels_data[4],sample.channels_data[5],sample.channels_data[6],sample.channels_data[7],sample.channels_data[8],sample.channels_data[9],sample.channels_data[10],sample.channels_data[11],sample.channels_data[12]]
        bytesToSend=struct.pack("13d",*msgFromServer)
        UDPServerSocket.sendto(bytesToSend,test)
        print(sample.channels_data[0])
     

    board.start_stream(print_raw)

    #bytesToSend=struct.pack('<h',random.randint(0, 9))
    #UDPServerSocket.sendto(bytesToSend,test) # שולח הודעות
    #print(bytesToSend)
    
  
    


