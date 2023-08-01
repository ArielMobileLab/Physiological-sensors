import sys
import statistics


# Get the argument from the command line
arg1 = float(sys.argv[1]) 
arg2 = float(sys.argv[2])
arg3 = float(sys.argv[3])

numbers = [arg1, arg2, arg3]

median = statistics.median(numbers)

print(median)