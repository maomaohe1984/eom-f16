int[] mouseXPos = new int[50000];
int[] mouseYPos = new int[50000];
int arrayIndex = 0;
int hue = 20;
PImage img1;
PImage img2;

void setup() {
  size(500, 500);
  colorMode(HSB);
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
}
void draw() {
  for (int i=0; i<arrayIndex; i++) {
    ellipse(mouseXPos[i], mouseYPos[i], 10, 10);
  }
}

void mouseClicked() {
  hue = round(random(0, 255));
  image(img1, 0, 0, width, height);
}

void mouseMoved() {
  mouseXPos[arrayIndex] = mouseX;
  mouseYPos[arrayIndex] = mouseY;
  arrayIndex++;
}