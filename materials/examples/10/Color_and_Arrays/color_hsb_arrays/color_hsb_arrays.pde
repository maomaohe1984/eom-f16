int[] sat = new int[5];

void setup() {
  size(360, 500);
  colorMode(HSB); // 0-360
  noStroke();

  sat[0] = 100;
  sat[1] = 200;
  sat[2] = 300;
  sat[3] = 320;
  sat[4] = 360;

  for (int s=0; s<sat.length; s++) {
    int saturation = sat[s];
    println(saturation);
    for (int i=0; i<width; i=i+36) {
      fill(i, saturation, 360);
      rect(i, s*40, 36, 36);
    }
  }
}

