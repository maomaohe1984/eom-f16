void setup() {
  size(400, 400);
  background(255);
  stroke(37, 72, 27);
  strokeWeight(2);
}

void draw() {
  if (dist(200, 200, mouseX, mouseY) < 20) {
    /* if the distance between 200,200 and the current mouse position
     * is less then 20 (circle radius) that means that the mouse is inside
     * the circle, so highlight it */
    fill(37, 72, 27);
  } else {
    fill(129, 242, 95);
  }

  /* draw a circle at 200,200 or the center of the canvas
   * 40 is the width and height, which means 20 is the radius */
  ellipse(200, 200, 40, 40);
}

