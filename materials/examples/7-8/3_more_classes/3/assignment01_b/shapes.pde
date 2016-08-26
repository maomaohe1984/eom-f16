class TvShape {
  float x;
  float y;
  color a;
  color b;
  color c;
  
  TvShape(float _x, float _y, color _a, color _b, color _c) {
    x = _x;
    y = _y;
    a = _a;
    b = _b;
    c = _c;
    println(x, _x);
  }
 
  void drawTvShape() {
    strokeWeight(5);
    stroke(c);
    fill(b);
    rect(x, y+45, 80, 100);

    fill(a);
    ellipse(x+20, y+70, 25, 25);
    ellipse(x+20, y+120, 25, 25);
    ellipse(x+60, y+70, 25, 25);
    ellipse(x+60, y+120, 25, 25);
  }
  
  void move(float speed) {
    x = x + speed;
    if(x > width){
      x = 0;
    }
    if(x < 0){
      x = width;
    }
  }
}
