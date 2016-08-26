void setup() {
  size(400, 400);
  background(255);
  noStroke();
}

void draw() {
  /* nested for loop, draw circles in a grid */
  for (int x=20; x<width; x = x+20) {
    for (int y=20; y<height; y = y+20) {
      
      /* if the distance between the center of this circle
       * and the current mouse position is less then the circle
       * radius 8, then the mouse is inside this circle */      
      if (dist(x, y, mouseX, mouseY) < 8) {
        println(x, y);
        fill(#1F3F9B);
      } else {
        /* else mouse is not inside the circle, don't highlight */
        fill(#7FE57B); 
      }

      ellipse(x, y, 16, 16);
    }
  }
}

