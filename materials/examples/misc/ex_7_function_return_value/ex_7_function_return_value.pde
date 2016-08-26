int circleSize = 100;

/**
 * Function return values
 *
 * draw more circles when the user
 * hovers over a circle
 */
void setup() { // setup has no return value, his value is "void"
  size(800, 800);
}

void draw() { // draw has no return value, his value is "void"
  background(255);

  for (int x=0; x<width; x=x+2*circleSize) {
    for (int y=0; y<height; y=y+2*circleSize) {
      /* draw a new circle at our location
       * and save the return value of that function call
       * to a new variable called hovering */
      boolean hovering = drawHoverCircle(x, y, circleSize);

      if (hovering) {
        /* if we are hovering over a circle
         * half the number of circles */
        circleSize = circleSize / 2;
        
        if(circleSize < 5){
          circleSize = 100;
        }
      }
    }
  }
}



/* drawHoverCircle
 * draw a circle and change his color on hover
 *
 * x: x location of circle
 * y: y location of circle
 * circleSize: diameter of the circle
 *
 * returns true if the mouse is over the circle
 * returns false if the mouse is not over the circle
 */
boolean drawHoverCircle(float x, float y, float circleSize) {
  float circleRadius = circleSize/2;
  noStroke();
  ellipseMode(CORNER);

  // draw the circle
  fill(#3246BF, 20);
  ellipse(x, y, circleSize, circleSize);

  /* test if the mouse is inside our circle
   * IE the distance between the mouse location
   * and the x,y location of the circle is less than the
   * radius of the circle */
  if (dist(mouseX, mouseY, x, y) < circleRadius) {
    return true;
  } else {
    return false;
  }
}

