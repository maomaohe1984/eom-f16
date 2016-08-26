// Cinema Redux by Brendan Dawes
// www.brendandawes.com
// Cinema Redux  is licensed under a Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// This code was created with Processing V.67
// It may not run on other versions of the software

import processing.video.*;

int xpos = 0;
int ypos = 0;
int VWIDTH = 8; // width of capture
int VHEIGHT = 6; // height of capture
int MOVIEWIDTH = VWIDTH * 60; // width is equivalent to 1 minute of film time
int MOVIEHEIGHT = VHEIGHT * 130; // 130 minutes
int MAXWIDTH = MOVIEWIDTH - VWIDTH;
int MAXHEIGHT = MOVIEHEIGHT - VHEIGHT;
boolean capture = false;
Capture cam;

void setup() {
  size(500, 500);
  surface.setResizable(true);
  surface.setSize(MOVIEWIDTH, MOVIEHEIGHT);
  background(0);
  
  /* look for available webcams
   * quit the sketch if no webcams
   * are available */
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    /* start a new Capture the width and height of the sketch */
    cam = new Capture(this, 640, 480);
    cam.start();
  }
}

void mousePressed() {
  // click screen to start capture
  // click again to take screengrab if required
  if (capture == false) {
    capture = true;
  } else {
    saveFrame();
  }
}

void draw() {
  if (cam.available() == true && capture==true) {
    cam.read();
    
    image(cam, xpos, ypos, VWIDTH, VHEIGHT);
    xpos += VWIDTH;
    if (xpos > MAXWIDTH) {
      xpos = 0;
      ypos += VHEIGHT;
    }
    if (ypos > MAXHEIGHT) {
      saveFrame();
      ypos = 0;
      background(0);
    }
  }
}