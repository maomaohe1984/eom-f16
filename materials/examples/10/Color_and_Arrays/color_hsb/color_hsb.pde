void setup() {
  size(360, 500);
  colorMode(HSB); // 0-360
  noStroke();

  for (int i=0; i<width; i=i+36) {
    fill(i, 360, 360);
    rect(i, 200, 36, 36);
  }
}

