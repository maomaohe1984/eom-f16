int[] mouseXPos = new int[50000];
int[] mouseYPos = new int[50000];
int arrayIndex = 0;
int hue = 20;
PImage[] images = new PImage[4];

void setup() {
  size(500, 500);
  colorMode(HSB);
  for(int i=0; i<=3; i++){
    String imageName = "img" + i + ".jpg";
    images[i] = loadImage(imageName);
  }
}
void draw() {
  noStroke();
  fill(200, 40);
  for (int i=0; i<arrayIndex; i++) {
    ellipse(mouseXPos[i], mouseYPos[i], 10, 10);
  }
}

void mouseClicked() {
  hue = round(random(0, 255));
  int imageIndex = round(random(0,3));
  image(images[imageIndex], 0, 0, width, height);
}

void mouseMoved() {
  mouseXPos[arrayIndex] = mouseX;
  mouseYPos[arrayIndex] = mouseY;
  arrayIndex++;
}