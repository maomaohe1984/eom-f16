int hue = 20;
PImage[] images = new PImage[4];
UserDrawing userDrawing = new UserDrawing();

void setup() {
  size(500, 500);
  colorMode(HSB);
  for (int i=0; i<=3; i++) {
    String imageName = "img" + i + ".jpg";
    images[i] = loadImage(imageName);
  }
  image(images[0], 0, 0, width, height);
}
void draw() {
  userDrawing.drawPoints();
}

void mouseClicked() {
  hue = round(random(0, 255));
  int imageIndex = round(random(0, 3));
  image(images[imageIndex], 0, 0, width, height);
}

void mouseMoved() {
  userDrawing.mouse(mouseX, mouseY);
}

void keyPressed() {
  if (key == 'p') {
    userDrawing.togglePause();
  }
}