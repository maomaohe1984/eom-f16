class UserDrawing {
  Point[] mousePos = new Point[50000];
  int arrayIndex = 0;
  boolean pause = false;

  UserDrawing() {
  }

  void mouse(int x, int y) {
    if (!pause) {
      mousePos[arrayIndex] = new Point(x, y);
      arrayIndex++;
    }
  }

  void drawPoints() {
    noStroke();
    fill(200, 40);
    for (int i=0; i<arrayIndex; i++) {
      Point p = mousePos[i];
      rect(p.x, p.y, 15, 15);
    }
  }

  void pause() {
    pause = true;
  }
}