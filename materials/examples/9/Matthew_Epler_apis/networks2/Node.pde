class Node {

  String name;
  int index;
  int nSize;
  PVector nPos, tPos;
  boolean hover, selected;


  Node(String _name, int _i) {
    name = _name; 

    index = _i;
    nSize = c.size / 2; 

    nPos = new PVector(); 
    tPos = new PVector(width/2, height/2);

  } 
  
  void calcPos() {
    nPos.x = c.center.x + c.reach * cos(c.angle * index);
    nPos.y = c.center.y + c.reach * sin(c.angle * index);
  }

  void display() {
 
    checkMouse();

    if (hover) {
      stroke(255, 0, 0);
    } 
    else {
      stroke(255);
    }

    fill(255, 0, 0);
    line(c.center.x, c.center.y, nPos.x, nPos.y);
    ellipse(nPos.x, nPos.y, nSize, nSize);

    fill(255);
    textAlign(CENTER, CENTER);
    if (name.contains(" ")) {
      String[] splitName = split(name, " ");
      text(splitName[0], nPos.x, nPos.y - 6);
      text(splitName[1], nPos.x, nPos.y + 6);
    } 
    else {
      text(name, nPos.x, nPos.y);
    }
  }

  void checkMouse() {
    if (dist(mouseX, mouseY, nPos.x, nPos.y) < nSize/2) {
      hover = true;
    } 
    else {
      hover = false;
    }

    if (hover && mousePressed) {
      selected = true;
    }
  }
}