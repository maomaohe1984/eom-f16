/**
 * shows how to delay the start of an animation
 * 	 
 * MOUSE
 * click           : set end position of the animations and trigger new one
 */
 
import de.looksgood.ani.*;

float x = 256;
float y = 256;
float x2 = 256;
float y2 = 256;
float line1Opacity = 0;
float line2Opacity = 0;
float line3Opacity = 0;
float line4Opacity = 0;

void setup() {
  size(512,512);
  smooth();
  noStroke();

  // you have to call always Ani.init() first!
  Ani.init(this);
  
  Ani.to(this, 0.5, 1, "line1Opacity", 255);
  Ani.to(this, 0.5, 2, "line2Opacity", 255);
  Ani.to(this, 0.5, 3, "line3Opacity", 255);
  Ani.to(this, 0.5, 4, "line4Opacity", 255);
}

void draw() {
  background(255);
  fill(0);
  ellipse(x,y,120,120);
  
  fill(200);
  ellipse(x2,y2,110,110);
  
  fill(0, line1Opacity);
  text("line 1", 40, 40);

  fill(0, line2Opacity);
  text("line 2", 40, 60);

  fill(0, line3Opacity);
  text("line 3", 40, 80);

  fill(0, line4Opacity);
  text("line 4", 40, 100);
}

void mouseReleased() {
    // the animation is 1 sec delayed
    Ani.to(this, 0.5, 1, "x", mouseX);
    Ani.to(this, 0.5, 2, "y", mouseY);
    Ani.to(this, 0.5, 4, "x2", mouseX);
    Ani.to(this, 0.5, 5, "y2", mouseY);
}

