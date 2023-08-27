#   Brain Space Real-time EEG Data Server

This Python script sets up a real-time EEG data server that receives EEG data From Brain Space interface and sends EEG data over UDP (User Datagram Protocol) to Moblie lab Interface. It continuously monitors a specified data folder for new EEG files and streams the data to connected clients.

## Features

* Listens for incoming UDP packets from clients and responds with real-time EEG data.
* Automatically detects the latest EEG data file in the specified directory.
* Extracts EEG measurements from the data file and sends a selected subset of measurements to clients.
* Uses the `sh` library to leverage the `tail` utility for continuous data streaming.
* Designed to work with EEG data files in the .eeg format.
    
## Prerequisites
1. Python 3.x
2. sh library: Install it using the following command:   
```bash
pip install sh
```

## Usage  
1. Clone or download this repository to your local machine.

2. Open a terminal and navigate to the directory containing the script.

3. Modify the script variables according to your needs:

    * localIP: Set the IP address to bind the server.
    * localPort: Set the port to listen for incoming UDP packets.
    * bufferSize: Set the buffer size for receiving data.

4. Ensure you have EEG data files stored in a directory. Update the data_folder variable to point to the folder containing your EEG data.

5. Run the script:
```bash
 python server.py
```

6. The server will start listening for incoming UDP packets from clients.

## How it works  

1. The script sets up a UDP socket to listen for incoming data.

2. When a client connects, the server continuously reads the latest EEG data file from the specified directory.

3. It extracts EEG measurements from the file and sends a selected subset of measurements to the client.

4. The sh library is used to call the tail utility, which enables real-time streaming of new data lines from the EEG file.
