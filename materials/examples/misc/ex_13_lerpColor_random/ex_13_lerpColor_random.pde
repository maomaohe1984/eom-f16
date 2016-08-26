color from = color(148, 224, 252);
color to = color(227, 220, 149);

void setup() {
  size(400, 400);
  noStroke();
  background(255); // white background
}

void draw() {
  /* interpolate from starting to ending color
   * pick a color randomly between the two colors */
  color randomColor = lerpColor(from, to, random(0, 1));
  fill(randomColor);
  rect(mouseX, mouseY, 20, 20);
}

