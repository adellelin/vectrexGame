// vim: set ts=2 expandtab:
// Please don't move or delete the line above!  Thx, Holly

class Flower {
  float xpos;
  float ypos;
  int num_petals;
  float scale_size = 1;
  float rotation_rate; // 0.0 - 0.1 looks nice
  float rotation_state = 0;

  // The constructor should take:
  // xpos, ypos, num_petals, scale, rotation_rate, rotation_dir
  Flower(float tempxpos, float tempypos, int tempnum_petals, float tempscale_size, float temprotation_rate) {
    xpos = tempxpos;
    ypos = tempypos;
    num_petals = tempnum_petals;
    scale_size = tempscale_size;
    rotation_rate = temprotation_rate;
  }
  
  void display() {
    pushMatrix();
    
    background(0);
  
    // move to first flower petal position
    translate(xpos, ypos);
    // Rotate state so next flower drawn will be spun slightly
    rotate(rotation_state += rotation_rate);
    // Scale the flower
    scale(scale_size);

    // draw the flower
    for (int i = 0; i < num_petals; i++) {
      ellipse(0, 15, 20, 80);
      rotate(2*PI/num_petals);  
    }
    
    popMatrix();
  }

}
  