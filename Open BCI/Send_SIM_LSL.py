"""Example program to show how to read a multi-channel time series from LSL and send it to simulink"""

from pylsl import StreamInlet, resolve_stream
import csv
import pandas as pd
import socket
import struct
import time

def main():
        

    localIP     = "127.0.0.1"

    localPort   = 20001

    bufferSize  = 1024

    UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM) # יצירת סוקט

    UDPServerSocket.bind((localIP, localPort)) # מחברים את הסוקט לאייפי ופורט

    test =('127.0.0.1',49004)

    msgFromServer=[]
    
    # first resolve an EEG stream on the lab network
    print("looking for an EEG stream...")
    streams = resolve_stream('type', 'EEG')

    # create a new inlet to read from the stream
    inlet = StreamInlet(streams[0])

    while True:
        time.sleep(0.001953)
        # get a new sample (you can also omit the timestamp part if you're not
        # interested in it)
        sample, timestamp = inlet.pull_sample() #samle its vector with the chanels

        msgFromServer = [sample[15],sample[0],sample[1],sample[2],sample[3],sample[4],sample[5],sample[6],sample[7],sample[8],sample[9],sample[10],sample[11]] 
        bytesToSend=struct.pack("13d",*msgFromServer)
        UDPServerSocket.sendto(bytesToSend,test)
        print(msgFromServer)

if __name__ == '__main__':

    main()
