// 3D
void setup() {
  size(500, 500, P3D);
}

void draw() {
  background(255);
  noFill();

  translate(width/2, height/2, 300);
  float horizontalRotation = map(mouseX, 0, width, 0, PI);
  rotateY(horizontalRotation);
  float verticalRotation = map(mouseY, 0, height, 0, PI);
  rotateX(verticalRotation);
  box(40, 40, 10);
}