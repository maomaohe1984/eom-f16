void setup() {
  size(500, 500);
  background(255);

  for (int i=0; i<10; i++) {
    int nextEllipse = i*10;
    println(nextEllipse);
    ellipse(5+nextEllipse, 5, 10, 10);
  }
}
