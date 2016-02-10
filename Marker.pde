class Marker{
 float xpos;
 float ypos;
 
 // Constructor
 Marker(float tempxpos, float tempypos) {
   xpos = tempxpos;
   ypos = tempypos;
 }
  
 void display() {
  pushMatrix();
  stroke(255);
  translate(xpos, ypos);
  for (int i = 0; i < 3; i++) {
  rotate(PI/3);
  line(-5, 0, 5, 0);
  }
  popMatrix();
 }
  
}