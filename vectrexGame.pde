// declare your vst object
Vst vst;
PVector hello;
int caught = 0;
int level = 1;

ArrayList<Marker> markers = new ArrayList<Marker>();
ArrayList<Star> starries = new ArrayList<Star>();
ArrayList<Flower> garden = new ArrayList<Flower>();

// for end enimation sequence
boolean isAnimatingPostGarden = false;
ArrayList<Flower> postGarden = new ArrayList<Flower>();
int timerStart;
int animationTime = 2000;
int framesLeft;

void setup() {
  vst = new Vst(this, createSerial());
  startScreen();
  // to draw in 2D space
  size(512, 600, P2D);
  fill(0);
  blendMode(ADD); // makes lines brighter when they cross
  frameRate(25);
}

void draw() {
  background(0);
  stroke(255);
  for (Marker tic : markers) {
    tic.display();
  }

  pushMatrix();
  PVector netPos = new PVector(width - 150, mouseY);
  translate(netPos.x, netPos.y);
  scale(1.5);
  mouseNet();
  popMatrix();

  // set starting position of each star
  // Star(PVector inCenter, float inRadius)
  hello = new PVector(-width/8, random(height/2, height/3));
  // set interval of time which the stars are created
  //println(random(20));
  if (floor(random(20)) == 0 && garden.size() < 5) {
    // set the starting location and radius
    starries.add(new Star(hello, random(5, 20)));
  }

  for (int i = 0; i < starries.size(); i++) {
    Star shootingS = starries.get(i);
    float collideNet = dist(shootingS.newPos.x, shootingS.newPos.y, netPos.x, netPos.y);
    if (collideNet < 50) {
      starries.remove(shootingS);
      // add to the caught counter
      caught++;
    }
    // after 150 frames, remove the stars from the loop so
    // it doesn't keep drawing offscreen
    if (shootingS.age > 150) {
      starries.remove(shootingS);
    } else {
      shootingS.display();
      shootingS.update();
    }
  }
  
  // for level 1 - after catching 1 star, turn marker into flower
  // once you have passed through an entire garden, the level increases
  if (caught == 1 * level) {
   if (garden.size() < 5) {
     //remove tic for the marker list
     markers.remove(0);
     //  Flower(float tempxpos, float tempypos, int tempnum_petals, float tempscale_size, 
     //  float temprotation_rate)
     // flower radius gets bigger as the level gets harder
     garden.add(new Flower(random(80, 420), random(450, 540), ceil(random(5.1, 8.9)), 
       random(0.5, 1.5)* level * 0.4, random(-0.2, 0.2)));
    }
    caught = 0;
  }
  
  
  // display flower
  stroke(64);
  for (Flower blossom: garden) {
    blossom.display();
  } 
  
  // once the garden is populated, we reset the screen
  if (garden.size() == 5){
    // for end animation sequence, we copy the contents of garden
    // into postGarden
    postGarden = new ArrayList<Flower> (garden);
    // clear all the original flowers in garden and stars
    garden.clear();
    starries.clear();
    level++;
    framesLeft = 60;
  }
  
  framesLeft --;
  
  if (framesLeft > 0){
    starries.clear();
    for (Flower flower : postGarden) {
      flower.display();
    }
  } else if (framesLeft == 0) {
    isAnimatingPostGarden = false;
    startScreen();
    postGarden.clear();
  }
  vst.display();
}

void mouseNet() {
  for (int i = 1; i < 11; i++) {
    line(0, 10, 0, -28);
    PVector netVert = new PVector(0, -i * 2.8);
    PVector netHor = new PVector(i * 6, 0);
    PVector netSlant = new PVector(i * 6, .46 * i * 6 - 28); 
    // draw the soft net in a thinner strokeweight
    stroke(150);
    line(netHor.x, netHor.y, netVert.x, netVert.y);
    line(netHor.x, netHor.y, netSlant.x, netSlant.y);
  }
}

void startScreen() {
  for (int i = 1; i < 6; i++) {
    markers.add(new Marker(180 + (i*30), 580));
  }
}