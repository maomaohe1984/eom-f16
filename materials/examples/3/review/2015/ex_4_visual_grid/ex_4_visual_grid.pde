// create a visual grid
// with lines for reference

void setup() {
  size(500, 500);
  background(255);
  stroke(200);
  
  for (int i=1; i<100; i++) {
    line(i*10,0,i*10,500); //vertical lines
    line(0,i*10,500,i*10); //horizontal lines
  }
}
