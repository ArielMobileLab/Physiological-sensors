from pyOpenBCI import OpenBCICyton
import datetime
import ratelimit


def print_raw(sample):
    
    print(sample.channels_data,datetime.datetime.now())

board = OpenBCICyton(port='COM4', daisy=True)

board.start_stream(print_raw)

