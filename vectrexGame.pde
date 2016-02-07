void setup() {
}

void draw() {
}


void mouseNet() {
  for (int i = 1; i < 10; i++) {
    line(0, 10, 0, -25);
    //line(0, -25, 50, 0);
    PVector net = new PVector(0, -i * 2.5);
    PVector net2 = new PVector(i * 6, 0);
    PVector net3 = new PVector(i * 5, .54 * i * 5 -30);
    
    stroke(150);
    line(net2.x, net2.y, net.x, net.y);
    line(net2.x, net2.y, net3.x, net3.y);
  }
}