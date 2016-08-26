boolean black = true;

void setup() {
  size(400, 400);
  frameRate(60);
}

void draw() {
  if (black) {
    background(0);
  } else {
    background(255);
  }


  /* a common trick in processing to perform some tasks regularly
   * because the frame rate is 60 frames per second, set in setup
   * frameCount % 60 will equal 0 every 60 frame, or 1 time
   * per second */
  // change to % 120 for once every 2 seconds
  // change to % 30 for twice per second (1x per half second)
  // etc...
  if ((frameCount % 60) == 0) {
    // anything inside this if statement will happen
    // once per second

    // false always changes to true and true to false
    // https://processing.org/reference/logicalNOT.html
    black = !black; // toggle the boolean value of black by setting it to its logical negation
  }

  // % is called modulo  or modulus
}

