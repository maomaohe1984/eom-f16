float sunHeight = 50;

void setup() {
  size(900,300);
  noStroke();
}

void draw() {
  // sky
  background(#FBFCE3);
  
  // sun
  fill(#ED611A);
  ellipse(450,150+sunHeight,100,100);
  sunHeight = sunHeight - 0.1;
  
  // water
  fill(#178FE8);
  rect(0,150,900,300);
}
