#Libraries
import RPi.GPIO as GPIO
import time
 

def init():
    GPIO.setmode(GPIO.BCM)

def setup(gpio_trigger, gpio_echo):
    GPIO.setup(gpio_trigger, GPIO.OUT)
    print("Set GPIO pin {0} to output".format(gpio_trigger))
    GPIO.setup(gpio_echo, GPIO.IN)
    print("Set GPIO pin {0} to input".format(gpio_echo))
    GPIO.output(gpio_trigger, False)
    print("Set GPIO pin {0} to low".format(gpio_trigger))

def distance(gpio_trigger, gpio_echo):
    # set Trigger to HIGH
    GPIO.output(gpio_trigger, True)
 
    # set Trigger after 0.01ms to LOW
    time.sleep(0.00001)
    GPIO.output(gpio_trigger, False)
 
#    StartTime = time.time()
#    StopTime = time.time()
 
    # save StartTime
    while GPIO.input(gpio_echo) == 0:
        pass
    StartTime = time.time()
 
    # save time of arrival
    while GPIO.input(gpio_echo) == 1:
        pass
    StopTime = time.time()
 
    # time difference between start and arrival
    TimeElapsed = StopTime - StartTime
    # multiply with the sonic speed (34300 cm/s)
    # and divide by 2, because there and back
    distance = (TimeElapsed * 34300) / 2
 
    return distance
 
if __name__ == '__main__':
    #GPIO Mode (BOARD / BCM)
    GPIO.setmode(GPIO.BCM)
     
    #set GPIO Pins
    GPIO_TRIGGER = 17 #23
    GPIO_ECHO = 27 #24
     
    #set GPIO direction (IN / OUT)
    GPIO.setup(GPIO_TRIGGER, GPIO.OUT)
    GPIO.setup(GPIO_ECHO, GPIO.IN)

    #set GPIO trigger to off by default just to be sure
    GPIO.output(GPIO_TRIGGER, False)
    print("Allowing sensor to settle")
    #sleep to let the sensor settle)
    time.sleep(2)
    print("Sensor settled")
    try:
        while True:
            dist = distance(GPIO_TRIGGER, GPIO_ECHO)
            print ("Measured Distance = {:1f} cm / {:1f} in".format(dist, (dist * 0.3937)))
            time.sleep(1)
 
        # Reset by pressing CTRL + C
    except KeyboardInterrupt:
        print("Measurement stopped by User")
        GPIO.cleanup()
