import serial
import time

PORT = "/dev/ttyUSB1"
BAUD = 9600

ser = serial.Serial(PORT, BAUD)
time.sleep(2)

def send_price(value):
    if not (0 <= value <= 255):
        raise ValueError("Price must be between 0 and 255.")
    ser.write(bytes([value]))
    print(f"Sent price: {value}")

send_price(90)

ser.close()
