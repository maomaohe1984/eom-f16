// 3D
// https://processing.org/tutorials/p3d/
void setup() {
  size(1000, 1000, P3D);
  noFill();
}
void draw() {
  background(255);
  beginCamera();
  camera();
  float cameraX = map(mouseX, 0, width, 0, PI);
  //rotateX(-PI/6);
  rotateX(cameraX);
  endCamera();

  translate(width/2, height/2, 0);
  rotateY(PI/3);
  box(45);
  translate(200, 0, 0);
  box(20, 20, 10);
}