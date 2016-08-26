void setup() {
  size(600, 400);
  background(#90E5D0);
  stroke(3);
  fill(250, 139, 35, 80);
}

void draw() {
  ellipse(mouseX, mouseY, 40, 20);
  fill(#ED1697);
  ellipse(mouseX, mouseY, 10, 5);
  fill(#1A8E20);
  ellipse(mouseX, mouseY, 20, 10);
  
  
}

void mouseClicked() {
  // if mouse click, clear the screen
  background(#90E5D0);
}

