void setup() {
  size(1000, 1000);
  background(0);
  noStroke();
  fill(#00FF1B);
}

void draw() {
  rect(mouseX, mouseY, 100, 100);
}

void keyPressed() {
  // if mouse click, clear the screen
  background(#4B3749);
}

