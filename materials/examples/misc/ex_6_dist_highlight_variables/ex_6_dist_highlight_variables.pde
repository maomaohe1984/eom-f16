/* store the circle parameters here so that we can easily change them
 * since the ellipse() function in Processing takes the ellipse width and height
 * we calculate that as the diameter here */
float RADIUS = 40;
float DIAMETER = RADIUS*2.0;

void setup() {
  size(400, 400);
  background(255);
  stroke(25, 64, 14);
  strokeWeight(2);
}

void draw() {
  /* x,y will always be the center of the screen */
  float x = width/2;
  float y = height/2;

  if (dist(x, y, mouseX, mouseY) < RADIUS) {
    /* if the distance between x,y the circle center and the current mouse position
     * is less then the circle radius that means that the mouse is inside
     * the circle, so highlight it */
    fill(37, 72, 27);
  } else {
    fill(63, 155, 36);
  }

  ellipse(x, y, DIAMETER, DIAMETER);
}

