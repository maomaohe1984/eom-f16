

class Movie {

  String movietitle;
  String url;
  PImage movieImage;
  
  int xpos;
  int ypos;

  // constructor  
  Movie(String newtitle, String newURL, int newx, int newy) {
  
    println("creating a new movie element");
    movietitle = newtitle;
    url = newURL;
    xpos = newx;
    ypos = newy; 
    
    movieImage = requestImage(url);      // load image
}

void display() {
  if (movieImage.width > 0) {
      image(movieImage, xpos, ypos);
    }
    
    text(movietitle, (xpos + movieImage.width + 10), ypos + 10, 200, 200);
}
}
