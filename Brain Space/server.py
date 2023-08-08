import socket
import struct
import os
import time
import csv
import glob
from sh import tail  # Import the tail utility from the sh library

MatLabIP = "10.20.0.182"
MatLabPort = 12355

# localIP = "0.0.0.0"
# localPort = 12345
bufferSize = 2048

# Create a datagram socket
UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

# # Bind to address and IP
# UDPServerSocket.bind((localIP, localPort))


def get_latest_eeg_data():
    # Construct the full path to the main data folder
    data_folder = "/home/bsuser/Desktop/sensi/data"

    # Get the latest subfolder based on its creation time
    latest_subfolder = max(os.listdir(data_folder), key=lambda f: os.path.getctime(os.path.join(data_folder, f)))

    # Iterate through files in the latest subfolder and find the EEG file
    eeg_file_path = None
    subfolder_path = os.path.join(data_folder, latest_subfolder)
    for file_name in os.listdir(subfolder_path):
        if file_name.endswith(".eeg"):
            eeg_file_path = os.path.join(subfolder_path, file_name)
            break

    if not eeg_file_path:
        raise FileNotFoundError("No EEG file found in the latest subfolder.")
     
    print("Getting data from file: ",eeg_file_path)

    return eeg_file_path




def extract_measurements(measurements_str):
    # Find the portion within the square brackets
    start_index = measurements_str.index('[')
    end_index = measurements_str.index(']')
    measurements_str = measurements_str[start_index + 1 : end_index]

    # Split the measurements string by ',' to separate individual measurement values
    values = measurements_str.split(',')
    # Convert each value to an integer or float and append to the measurements list
    measurements = [int(value) if value.isdigit() else float(value) for value in values]
    return measurements

def send_realtime_eeg_data():
    eeg_file_path = get_latest_eeg_data()
    for line in tail("-f", eeg_file_path, _iter=True):  # Use tail to continuously read new lines
        measurements_str = line.split('"')[3]  # Extract measurements from the line
        measurements = extract_measurements(measurements_str)
        selected_measurements = measurements[:12]  # Choose the first 12 values
        packed_data = struct.pack(f"{len(selected_measurements)}d", *selected_measurements)
        print("Packed data:", selected_measurements)  # Print packed data for debugging
        UDPServerSocket.sendto(packed_data, (MatLabIP,MatLabPort))


# def main():
#     print("Server is running. Waiting for clients...")
#     while True:
#         bytesAddressPair = UDPServerSocket.recvfrom(bufferSize)
#         client_address = bytesAddressPair[1]
#         print(f"Connected to client: {client_address}")
#         send_realtime_eeg_data(client_address)

def main():
    print("Server is running. Waiting for clients...")
    while True:
        # bytesAddressPair = UDPServerSocket.recvfrom(bufferSize)
        # client_address = bytesAddressPair[1]
        # print(f"Connected to client: {client_address}")
        send_realtime_eeg_data()


if __name__ == "__main__":
    main()
