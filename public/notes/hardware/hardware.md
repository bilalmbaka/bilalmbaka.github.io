# Analog values

__Pulse with modulation__

When you use PWM on the Arduino, the level of
voltage on the PWM pin is switched on and off
at various rates at regular intervals. It is
sometimes 0 volts, and sometimes 5 volts.

__Baud rate__ 

Is the rate of communication that the computer
and Arduino use to talk to each other.
The Arduino and your computer must use the same rate of communication: the value set in 
``` c
Serial.begin().
```


### Potentiometer-Led circuit example

1. 5v to bread-board
2. GND to bread-board
3. Connect potentiometer on board, with one
leg to 5v, one to GND and from A0 to middle
of potentiometer.
4. Connect ~9 to LED and LED to ground.


```c
const int analogInPin = A0;  // Analog input pin that the potentiometer is attached to
const int analogOutPin = 9;  // Analog output pin that the LED is attached to
const int speakerOutPin = 11;

int sensorValue = 0;  // value read from the pot
int outputValue = 0;  // value output to the PWM (analog out)

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600);
}

void loop() {
  // read the analog in value: range from 0
    //to 1023
  sensorValue = analogRead(analogInPin);
  // map it to the range of the analog out:
  // 0 to 255
  outputValue = map(sensorValue, 0, 1023, 0, 255);
  // change the analog out value:
  analogWrite(analogOutPin, outputValue);

  tone(speakerOutPin, sensorValue);


  // print the results to the Serial Monitor:
  Serial.print("sensor = ");
  Serial.print(sensorValue);
  Serial.print("\t output = ");
  Serial.println(outputValue);

  // wait 2 milliseconds before the next loop for the analog-to-digital
  // converter to settle after the last reading:
  delay(2);
}
```


# 27, May, 2026
# Servo Motors

Servo motors are a type of motor that can be easily programmed
to rotate to a precise position. A servo motor contains a set of gears
and a control mechanism that rotates a shaft a specified number
of degrees.

Analog data can refer to any information that has more than the two possible 
values that digital information can hold (described alternately as 1 or 0, 
true or false, HIGH or LOW).

A cable is connected to the front of the case near the bottom.
This has three color-coded wires; the black wire will be attached to
ground, the red wire will be attached to power, and the third wire,
sometimes yellow, sometimes blue, sometimes white, is the control
wire.

Generally the ground
wire is on the right, the power wire in the middle, and the control wire
on the left.



__Turning a servo motor to a specific angle__

```c
#include <Servo.h>

Servo myServo;

int pos = 0;

void setup() {
  myServo.attach(9);
}

void loop() {
  for (pos =0; pos <= 180; pos += 1) {
    myServo.write(pos);
    delay(15);
  }

  for (pos = 180; pos >= 0; pos -= 1) {
    myServo.write(pos);
    delay(15);
  }
}
```

__Turning a servo motor from the values of a potentiometer__

```c

#include <Servo.h>

Servo myServo;
int potPin = 0;
int val;

void setup() {
  myServo.attach(9);
}

void loop() {
  val = analogRead(potPin);
  val = map(val,0,1023,0,180);
  myServo.write(val);
  delay(15);

  Serial.print("sensor value = ");
  Serial.print(val);
  Serial.print("\n");
}

```


# 8, June, 2026
# RESISTOR CODES

__Orienting the resistor__

On one side of the resistor, the band color will be either silver 
or gold. This band should be placed on the right-
hand side of the resistor.

__Resistor Color Chart__

Black 0, 0, 1
Brown 1, 1, 10
Red 2, 2, 100
Orange 3, 3, 1,000
Yellow 4, 4, 10,000
Green 5, 5, 100,000
Blue 6, 6, 1,000,000
Purple 7, 7
Grey 8, 8
White 9, 9

Tolerance
Gold 5%
Silver 10%

Although the four-band resistor is very common, some
resistors have a different number of bands. The colors indicate the
same numbers in the first three bands, but the tolerance values are
calculated differently.


