

class Movie {

  int index;
  String movietitle;
  String url;
  String earnings;
  PImage movieImage;

  Boolean showEarnings = false;


  int xpos;
  int ypos;

  // constructor  
  Movie(String newtitle, String newURL, int newx, int newy, int newindex, String newearnings) {

    println("creating a new movie element");
    movietitle = newtitle;
    url = newURL;
    xpos = newx;
    ypos = newy;
    earnings = newearnings;
    index = newindex;

    movieImage = requestImage(url);      // load image
  }

  void display() {
    if (movieImage.width > 0) {
      image(movieImage, xpos, ypos);
    }

    println(movieImage.width + " " + movieImage.height);

    textSize(25);
    text(index + ".", (xpos + movieImage.width + 10), ypos + 20);
    textSize(12);
    text(movietitle, (xpos + movieImage.width + 10), ypos + 35, 200, 200);

    if (showEarnings == true) {                    // will only draw if boolean is set to true
      textSize(18); 
      text(earnings, (xpos + movieImage.width + 10), ypos + 70);
    }
  }


  void mouseCheck() {
    if ((mouseX > xpos) && (mouseX < xpos + 122)) {      // if the mouse is over the image in the x direction
      if ((mouseY > ypos) && (mouseY < ypos + 190)) {    // and its over the mouse in the y direction
        if (showEarnings == false) {                    // check boolean
          showEarnings = true;                          // change boolean
        } 
        else {
          showEarnings = false;
        }
      }
    }
  }
}

