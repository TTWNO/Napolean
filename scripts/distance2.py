import RPi.GPIO as gpio
from distance import init, setup, distance
import time

GPIO_TRIGGER1 = 17 
GPIO_TRIGGER2 = 23
GPIO_ECHO1 = 27 
GPIO_ECHO2 = 24

print("Initializing gpio pins")
init()
print("Seting up pins")
setup(GPIO_TRIGGER1, GPIO_ECHO1)
setup(GPIO_TRIGGER2, GPIO_ECHO2)
print("Settling sensor")
time.sleep(2)
print("Starting program")

while True:
    try:
        dist1 = distance(GPIO_TRIGGER1, GPIO_ECHO1)
        dist2 = distance(GPIO_TRIGGER2, GPIO_ECHO2)
        print("{:.1f}x{:.1f}".format(dist1, dist2))
        time.sleep(1)
    except KeyboardInterrupt:
        print("Closing GPIO!")
        gpio.cleanup();
