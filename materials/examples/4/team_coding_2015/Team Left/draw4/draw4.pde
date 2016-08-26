void setup() {
  size(1000, 1000);
  strokeWeight(10);
  stroke(#ADDFF5);
  fill(#00FF1B);
}

void draw() {
  fill(#E8DF2F);
  rect(mouseX, mouseY, 100, 100);
  fill(#312FE8);
  fill(#F5ADC3);
  ellipse(mouseX, mouseY, 75, 75);
  fill(55);
  ellipse(mouseX+100, mouseY+100, 75, 75);
}

void keyPressed() {
  // if mouse click, clear the screen
  background(random(0,255), random(0,255), random(0,255));
}

