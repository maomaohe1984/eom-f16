int[] mouseXPos = new int[50000];
int[] mouseYPos = new int[50000];
int arrayIndex = 0;
int hue = 20;

void setup() {
  size(500, 500);
  colorMode(HSB);
}
void draw() {
  background(hue, 200, 200);
  for (int i=0; i<arrayIndex; i++) {
    ellipse(mouseXPos[i], mouseYPos[i], 10, 10);
  }
}

void mouseClicked() {
  hue = round(random(0, 255));
}

void mouseMoved() {
  mouseXPos[arrayIndex] = mouseX;
  mouseYPos[arrayIndex] = mouseY;
  arrayIndex++;
}