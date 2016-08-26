void setup() {
  size(600, 400);
  background(#90E5D0);
  stroke(3);
  fill(250, 139, 35, 80);
}

void draw() {
  
  rect(mouseX, mouseY, 40, 20);
 
  rect(mouseX, mouseY, 10, 5);
  
  rect(mouseX, mouseY, 20, 10);

  float speed = dist(pmouseX, pmouseY, mouseY, mouseY);
  rect(mouseX, mouseY, speed, speed);
  ellipse(mouseX+40, mouseY+40, 20, 20);
}

void mouseClicked() {
  // if mouse click, clear the screen
  background(#90E5D0);
}

void keyPressed() {
  background(random(0, 255), random(0, 255), random(0, 255));
  
  if (key == '1') {
    fill(#F7F700);
    println("hi");
  }
}


// 

