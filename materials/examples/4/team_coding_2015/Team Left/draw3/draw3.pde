void setup() {
  size(1000, 1000);
  background(0);
  strokeWeight(10);
  stroke(#ADDFF5);
  fill(#00FF1B);
}

void draw() {
  rect(mouseX, mouseY, 100, 100);
  ellipse(mouseX, mouseY, 30, 50);
}

void keyPressed() {
  // if mouse click, clear the screen
  background(random(0,255), random(0,255), random(0,255));
}

