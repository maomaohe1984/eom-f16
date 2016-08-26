int x = 0;

void setup() {
  size(500,500); //width=1000, height=500
  noStroke();
  fill(#DCFC0D);
}


void draw() {
  background(255);
  rect(x,250, 50,50);
  x = x + 3;
  
  
  /* once the rectangle reaches the right-hand
   * side of the screen
   * start over at the left */
  if(x > 500){
   x = 0;
  } 
}
