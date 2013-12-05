/* For testing the Adafruit 16-Channel 12-bit PWM/Servo Driver interface
found at http://www.adafruit.com/products/815#Learn by using mouse-X location
to control the movement of a standard servo connected through the driver.
You can test either one motor at a time, or a set of motors all hooked up to
the driver. Use Adafruit's tutorial for assmebling and hooking up the driver to
Arduino & servos: http://learn.adafruit.com/16-channel-pwm-servo-driver/overview 
(Much thanks to Tom Igoe for help with this code).
*/

import processing.serial.*;
Serial myPort;

void setup() {
  size(300,720);  
  fill(255);
  println(Serial.list());
  myPort = new Serial(this, "/dev/tty.usbmodem1421", 9600); // Use your active serial port here.
}

void draw() {
  if (myPort.available() > 0 ) {
    print((char)myPort.read());
    
    int angle = mouseX/4; // 720/4 = 180 maximum servo angle. Alter this for 120 degree servos.

// Code for testing one servo mapped to mouseX
    int servoNumber=8;   // testing with one servo at pin 8 on the driver. You can use any pin.
    myPort.write("s" + servoNumber + "," + angle + "\n");  
  
/*
// Code for testing several servos connected to the servo driver interface
    for (int servoNumber = 8; servoNumber < 15; servoNumber++) {  // pins 8 through 14 on the servo driver
      myPort.write("s" + servoNumber + "," + angle + "\n");
      angle = angle + 10;  // 10 degree offset for each additional servo
    }
   delay(130);  // Test different delays. smaller lag makes servos too jumpy. larger numbers add more lag.
  }
  
*/
}

/*
void keyReleased() {
  int angle = mouseX/4;
  int servoNumber=8;
  myPort.write("s" + servoNumber + "," + angle + "\n");

  for (int servoNumber = 8; servoNumber < 9; servoNumber++) {
    myPort.write("s" + servoNumber + "," + angle + "\n");
    angle = angle + 10;
  }
}
*/
