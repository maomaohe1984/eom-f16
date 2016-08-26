// Ginnie S. Hsu assignment #1

void setup () {
 size(600,900);
 background (240,169,85);
}
void draw (){
  color red = color(193,23,49);
  color dblue = color(16,7,131);
  color purple = color(208,87,227);
  color mint = color(175,234,217);
  color teal = color(66,210,216);
  color green = color(142,34,108);
  color dyellow = color(240,169,85);
  color lyellow = color(232,205,167);
  noStroke();
  
  

  fill(green);
  rect(40,40,520,820);
  
  fill(dblue);
  rect(40,350,520,200);
  
  


  
 
  //HEADER DESIGN BOTTOM
  strokeWeight(6);
  stroke(red);
  strokeJoin(BEVEL);
  blendMode(SUBTRACT);
  line(260,794,310,850);
  line(310,850,370,850);
  line(370,850,330,825);
  line(330,825,315,840);
  line(315,840,335,840);
  line(335,840,330,835);
  //header part 2
  line(340,794,290,850);
  line(290,850,230,850);
  line(230,850,270,825);
  line(270,825,285,840);
  line(285,840,265,840);
  line(265,840,270,835);
  noStroke();
  blendMode(BLEND);
  //header part 3
  fill(red);
  beginShape();
  vertex(80,850);
  vertex(80,810);
  vertex(120,810);
  vertex(120,827);
  vertex(103,827);
  vertex(103,820);
  vertex(97,820);
  vertex(97,833);
  vertex(200,833);
  vertex(260,790);
  vertex(270,802);
  vertex(200,850);
  endShape(CLOSE);
  //header part 4
  fill(red);
  beginShape();
  vertex(520,850);
  vertex(520,810);
  vertex(480,810);
  vertex(480,827);
  vertex(497,827);
  vertex(497,820);
  vertex(503,820);
  vertex(503,833);
  vertex(400,833);
  vertex(340,790);
  vertex(330,802);
  vertex(400,850);
  endShape(CLOSE);
  
  //left header 1
  //left header 2
  //left header 3
  fill(red);
  beginShape();
  vertex(50,115);
  vertex(90,115);
  vertex(90,155);
  vertex(73,155);
  vertex(73,138);
  vertex(80,138);
  vertex(80,132);
  vertex(67,132);
  vertex(67,300);
  vertex(50,300);
  endShape(CLOSE);
  
  //HEADER DESIGN
  strokeWeight(6);
  stroke(red);
  strokeJoin(BEVEL);
  blendMode(SUBTRACT);
  line(260,106,310,50);
  line(310,50,370,50);
  line(370,50,330,75);
  line(330,75,315,60);
  line(315,60,335,60);
  line(335,60,330,65);
  //header part 2
  line(340,106,290,50);
  line(290,50,230,50);
  line(230,50,270,75);
  line(270,75,285,60);
  line(285,60,265,60);
  line(265,60,270,65);
  noStroke();
  blendMode(BLEND);
  //header part 3
  fill(red);
  beginShape();
  vertex(80,50);
  vertex(80,90);
  vertex(120,90);
  vertex(120,73);
  vertex(103,73);
  vertex(103,80);
  vertex(97,80);
  vertex(97,67);
  vertex(200,67);
  vertex(260,110);
  vertex(270,98);
  vertex(200,50);
  endShape(CLOSE);
  //header part 4
  fill(red);
  beginShape();
  vertex(520,50);
  vertex(520,90);
  vertex(480,90);
  vertex(480,73);
  vertex(497,73);
  vertex(497,80);
  vertex(503,80);
  vertex(503,67);
  vertex(400,67);
  vertex(340,110);
  vertex(330,98);
  vertex(400,50);
  endShape(CLOSE);
  
  //left header 1
   strokeWeight(6);
  stroke(red);
  strokeJoin(BEVEL);
  blendMode(SUBTRACT);
line(106,420,50,460);
line(50,460,50,510);
line(50,510,75,480);
line(75,480,60,465);
line(60,465,60,485);
line(60,485,65,480);
//left header 2
line(106,480,50,440);
line(50,440,50,390);
line(50,390,75,420);
line(75,420,60,435);
line(60,435,60,415);
line(60,415,65,420);
  noStroke();
  
  blendMode(NORMAL);
  //left header 3
  fill(red);
  beginShape();
  vertex(50,115);
  vertex(90,115);
  vertex(90,155);
  vertex(73,155);
  vertex(73,138);
  vertex(80,138);
  vertex(80,132);
  vertex(67,132);
  vertex(67,375);
  vertex(110,420);
  
  vertex(98,430);
  vertex(50,380);
  
  endShape(CLOSE);
  
  //left header 4
  fill(red);
  beginShape();
  vertex(50,785);
  vertex(90,785);
  vertex(90,745);
  vertex(73,745);
  vertex(73,762);
  vertex(80,762);
  vertex(80,768);
  vertex(67,768);
  vertex(67,525);

  
  vertex(110,480);
  vertex(98,470);
  
  vertex(50,520);
  endShape(CLOSE);
  
  blendMode(NORMAL);
  
   //RIGHT header 1
   strokeWeight(6);
  stroke(red);
  strokeJoin(BEVEL);
  blendMode(SUBTRACT);
line(494,420,550,460);
line(550,460,550,510);
line(550,510,525,480);
line(525,480,540,465);
line(540,465,540,485);
line(540,485,535,480);
//RIGHT header 2
line(494,480,550,440);
line(550,440,550,390);
line(550,390,525,420);
line(525,420,540,435);
line(540,435,540,415);
line(540,415,535,420);
  noStroke();
  
  blendMode(NORMAL);
  //RIGHTheader 3
  fill(red);
  beginShape();
  vertex(550,115);
  vertex(510,115);
  vertex(510,155);
  vertex(527,155);
  vertex(527,138);
  vertex(520,138);
  vertex(520,132);
  vertex(533,132);
  vertex(533,375);
  vertex(490,420);
  
  vertex(502,430);
  vertex(550,380);
  
  endShape(CLOSE);
  
  //RIGHT header 4
  fill(red);
  beginShape();
  vertex(550,785);
  vertex(510,785);
  vertex(510,745);
  vertex(527,745);
  vertex(527,762);
  vertex(520,762);
  vertex(520,768);
  vertex(533,768);
  vertex(533,525);

  
  vertex(490,480);
  vertex(502,470);
  
  vertex(550,520);
  endShape(CLOSE);
  
  blendMode(NORMAL);
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  //left header 4
//  fill(red);
//  beginShape();
//  vertex(520,50);
//  vertex(520,90);
//  vertex(480,90);
//  vertex(480,73);
//  vertex(497,73);
//  vertex(497,80);
//  vertex(503,80);
//  vertex(503,67);
//  vertex(400,67);
//  vertex(340,110);
//  vertex(330,98);
//  vertex(400,50);
//  endShape(CLOSE);
  
  
  //01 tv shapes LEFT-TOP
  strokeWeight(5);
  stroke(mint);
  fill(0);
  rect(120,160,80,100);
  //tvline
  //right
  //vertical center top
  line(160,160,160,130);
  //top-right
  line(160,130,190,115);
  line(190,115,200,115);
  line(200,115,200,140);
  line(200,140,180,140);
  line(180,140,180,130);
  //top-left
  line(160,130,130,115);
  line(130,115,120,115);
  line(120,115,120,140);
  line(120,140,140,140);
  line(140,140,140,130);
  //vertical center bottom
  line(160,260,160,290);
  //bottom-right
  line(160,290,190,305);
  line(190,305,200,305);
  line(200,305,200,280);
  line(200,280,180,280);
  line(180,280,180,290);
  //bottom-left
  line(160,290,130,305);
  line(130,305,120,305);
  line(120,305,120,280);
  line(120,280,140,280);
  line(140,280,140,290);
  //cross
  blendMode(SUBTRACT);
  line(160,170,160,250);
  line(130,210,190,210);
  blendMode(NORMAL);
  //circle
  fill(red);
  ellipse(140,185,25,25);
  ellipse(140,235,25,25);
  ellipse(180,185,25,25);
  ellipse(180,235,25,25);
  
  //02 tv shapes right-TOP
  strokeWeight(5);
  stroke(mint);
  fill(dblue);
  rect(400,160,80,100);
  //tvline
  //right
  //vertical center top
  line(440,160,440,130);
  //top-right
  line(440,130,470,115);
  line(470,115,480,115);
  line(480,115,480,140);
  line(480,140,460,140);
  line(460,140,460,130);
  //top-left
  line(440,130,410,115);
  line(410,115,400,115);
  line(400,115,400,140);
  line(400,140,420,140);
  line(420,140,420,130);
  //vertical center bottom
  line(440,260,440,290);
  //bottom-right
  line(440,290,470,305);
  line(470,305,480,305);
  line(480,305,480,280);
  line(480,280,460,280);
  line(460,280,460,290);
  //bottom-left
  line(440,290,410,305);
  line(410,305,400,305);
  line(400,305,400,280);
  line(400,280,420,280);
  line(420,280,420,290);
  //cross
  blendMode(SUBTRACT);
  line(440,170,440,250);
  line(410,210,470,210);
  blendMode(NORMAL);
  //circle
  fill(dyellow);
  ellipse(420,185,25,25);
  ellipse(420,235,25,25);
  ellipse(460,185,25,25);
  ellipse(460,235,25,25);
  
  //03 tv shapes right-bottom
  strokeWeight(5);
  stroke(mint);
  fill(0);
  rect(400,640,80,100);
  //tvline
  //right
  //vertical center top
  line(440,640,440,610);
  //top-right
  line(440,770,470,785);
  line(470,785,480,785);
  line(480,785,480,760);
  line(480,760,460,760);
  line(460,760,460,770);
  //top-left
  line(440,770,410,785);
  line(410,785,400,785);
  line(400,785,400,760);
  line(400,760,420,760);
  line(420,760,420,770);
  //vertical center bottom
  line(440,740,440,770);
  //bottom-right
  line(440,610,470,595);
  line(470,595,480,595);
  line(480,595,480,620);
  line(480,620,460,620);
  line(460,620,460,610);
  //bottom-left
  line(440,610,410,595);
  line(410,595,400,595);
  line(400,595,400,620);
  line(400,620,420,620);
  line(420,620,420,610);
  //cross
  blendMode(SUBTRACT);
  line(440,730,440,650);
  line(410,690,470,690);
  blendMode(NORMAL);
  //circle
  fill(red);
  ellipse(420,715,25,25);
  ellipse(420,665,25,25);
  ellipse(460,715,25,25);
  ellipse(460,665,25,25);
  
  
  //04 tv shapes LEFT-BOTTOM
  strokeWeight(5);
  stroke(mint);
  fill(dblue);
  rect(120,640,80,100);
  //tvline
  //right
  //vertical center top
  line(160,740,160,770);
  //top-right
  line(160,770,190,785);
  line(190,785,200,785);
  line(200,785,200,760);
  line(200,760,180,760);
  line(180,760,180,770);
  //top-left
  line(160,770,130,785);
  line(130,785,120,785);
  line(120,785,120,760);
  line(120,760,140,760);
  line(140,760,140,770);
  //vertical center bottom
  line(160,640,160,610);
  //bottom-right
  line(160,610,190,595);
  line(190,595,200,595);
  line(200,595,200,620);
  line(200,620,180,620);
  line(180,620,180,610);
  //bottom-left
  line(160,610,130,595);
  line(130,595,120,595);
  line(120,595,120,620);
  line(120,620,140,620);
  line(140,620,140,610);
  //cross
  blendMode(SUBTRACT);
  line(160,730,160,650);
  line(130,690,190,690);
  blendMode(NORMAL);
  //circle
  fill(dyellow);
  ellipse(140,715,25,25);
  ellipse(140,665,25,25);
  ellipse(180,715,25,25);
  ellipse(180,665,25,25);
  
  
  
  
  
 
 

  
  
  
 
  
  //diamond shapes
  stroke(lyellow);
  fill(100);
  quad(300,200,500,450,300,700,100,450);
  
  noStroke();
  fill(red);
  quad(300,225,475,450,300,675,125,450);
  
  
  fill(dblue);
  quad(300,250,450,450,300,650,150,450);
  
  
  
  //triangle top and bottom
  fill(mint);
  
  triangle(300,275,425,440,175,440);
  fill(mint);
  triangle(300,625,425,460,175,460);
  
  //line in the middle
  strokeWeight(10);
  strokeJoin(ROUND);
  stroke(lyellow);
  line(175,450,425,450);
  
  strokeWeight(6);
  noFill();
  
  stroke(red);
  rect(25,25,550,850);
  
  stroke(dblue);
  strokeWeight(4);
  noFill();

  
  rect(10,10,580,880);
  stroke(lyellow);
  fill(red);
  ellipse(300,350,50,50);
  
  fill(red);
  ellipse(300,550,50,50);
  
  fill(green);
  rect(200,425,200,50);
  
  fill(dblue);
  rect(275,400,50,100);
  
 
  
  
  
  
  
  
  
}
