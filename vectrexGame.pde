void setup() {

}

void draw() {

}

void mouseNet() {
  for (int i = 1; i < 11; i++) {
    line(0, 10, 0, -28);
    PVector net = new PVector(0, -i * 2.8);
    PVector net2 = new PVector(i * 6, 0);
    PVector net3 = new PVector(i * 5, .54 * i * 5 -30); 
    // draw the soft net in a thinner strokeweight
    stroke(150);
    line(net2.x, net2.y, net.x, net.y);
    line(net2.x, net2.y, net3.x, net3.y);
  }
}