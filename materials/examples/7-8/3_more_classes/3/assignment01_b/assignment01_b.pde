// adapted from Ginnie S. Hsu assignment #1

color red = color(193, 23, 49);
color dblue = color(16, 7, 131);
color purple = color(208, 87, 227);
color mint = color(175, 234, 217);
color teal = color(66, 210, 216);
color green = color(142, 34, 108);
color dyellow = color(240, 169, 85);
color lyellow = color(232, 205, 167);
TvShape redMintShape;
TvShape tealMintShape;

void setup () {
  size(600, 900);
  noStroke();
  redMintShape = new TvShape(120, 115, red, color(0), mint);
  tealMintShape = new TvShape(300, 115, teal, color(0), mint);
}
void draw () {
  background (240, 169, 85);

  redMintShape.drawTvShape();
  tealMintShape.drawTvShape();
  
  redMintShape.move(5.5);
  tealMintShape.move(-2.2);
}
