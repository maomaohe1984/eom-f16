void setup() {
  size(500, 500);
  background(255);

  // draw 10 random circles in a line
  for (int i=0; i<10; i++) {
    ellipse(random(0,500), 5, 10, 10);
  }
}

