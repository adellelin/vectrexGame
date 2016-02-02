
public class Star {
 float points = 5;
 float circAngle = 360/points * 2;
 float radius;

float collideNet;
 int x = 0;
 int y = 0;
 float vx;
 float vy;
 float sx = 0.1;
 float sy = -1;

 PVector acceleration;
 PVector velocity;         PVector startPos;

  PVector newPos = new PVector(0, 0);
 int age = 0;
 float rotateRate = 0.01;
 float rotateState = 0;
 
 float G = 9.81;
 float dt = 1.0/25;
  
 Star(PVector inCenter, float inRadius) {
   //save star parameters to be accessed locally
   this.startPos = inCenter;
   this.radius = inRadius;
   //(angle, velocity)
   starAngle(random(55,65), random(10, 15));
 }

 void display() {
  
   stroke(255);
  
   rotateState += rotateRate;
   //draw stars
   
   for (float i = 0; i < 720; i+= circAngle) {
     pushMatrix();
     stroke(255);
     translate(startPos.x, startPos.y);
     
     rotate(rotateState);
     PVector point1 = new PVector(cos(radians(i))*(radius), sin(radians(i))*(radius));
     PVector point2 = new PVector(cos(radians(i + circAngle))*(radius), sin(radians(i + circAngle))*(radius));
     //PVector cPoint1 = PVector.add(startPos, point1);
     //PVector cPoint2 = PVector.add(startPos, point2);
     line(point1.x, point1.y, point2.x, point2.y);
     popMatrix();
     
     // shooting star trails
     pushMatrix();
     //randomize stroke brightness so it looks shimmery;
     stroke(random(100));
     // translates the center of trails first before drawing all of them
     translate(startPos.x, startPos.y);
     for (float j = 0; j < 3; j += 1) {
       float angle =  180 - (15 * j); // distance of lines = multiples of 15 degrees, use 180 - to get to opposite side
       float start = radius * 2; // start the line from double the r distance from center of star
       PVector pointA = new PVector(cos(radians(angle)) * start, sin(radians(angle)) * start);
       //PVector cPointA = PVector.add(startPos, pointA);
       PVector pointB = new PVector(cos(radians(angle)) * (radius) * (3 + (0.8 * j)), 
         sin(radians(angle))*(radius) * (3 + (0.8 * j)));
       
       //PVector cPointB = PVector.add(startPos, pointB);
       //line(cPointA.x, cPointA.y, cPointB.x, cPointB.y);
       line(pointA.x, pointA.y, pointB.x, pointB.y);
      }
     popMatrix();
     
   }
   age += 1;
 }

 void update() {
   // add movement to star location
   //velocity = new PVector(.1, .3);//new PVector(random(3), int(random(-4)));  
   //acceleration = new PVector(0.0001, 0.001);
   
   vx = vx;
   vy = vy - G * dt; //gravity pulls down
   // update star position
   sx = sx + vx * dt;
   sy = sy + vy * dt;
   // println(sx + " and " + sy);
   velocity = new PVector(sx, -sy); 
   this.newPos = startPos.add(velocity);
   
 }

// angle that star curve starts with
 void starAngle(float a, float v) {
   vx = cos(a * PI/180) * v;
   vy = sin(a * PI/180) * v;
 //  println(a * PI/180 + "angle " + cos(a * PI/180));
 }
}