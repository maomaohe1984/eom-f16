class UserDrawing {
  Point[] mousePos = new Point[50000];
  int arrayIndex = 0;
  
  UserDrawing() {
  }

  void mouse(int x, int y) {
    mousePos[arrayIndex] = new Point(x, y);
    arrayIndex++;
  }

  void drawPoints() {
    noStroke();
    fill(200, 40);
    for (int i=0; i<arrayIndex; i++) {
      Point p = mousePos[i];
      ellipse(p.x, p.y, 10, 10);
    }
  }
}