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

void setup () {
  size(600, 900);
  background (240, 169, 85);
  redMintShape = new TvShape(120, 115, red, color(0), mint);
}
void draw () {
  noStroke();

  redMintShape.drawTvShape();

//  drawTvShape(120, 115, red, color(0), mint);
//  drawTvShape(300, 115, teal, color(0), mint);
//  drawTvShape(120, 300, dyellow, color(0), mint);
//  drawTvShape(300, 300, green, color(0), mint);
//  drawTvShape(120, 415, red, color(0), mint);
//  drawTvShape(300, 415, teal, color(0), mint);
//  drawTvShape(120, 600, dyellow, color(0), mint);
//  drawTvShape(300, 600, green, color(0), mint);
}
