XML xml;

Movie movieElements[];

void setup() {
  size(1200, 1200);
  background(150);
  textLeading(20);

  xml = loadXML("http://www.movies.com/rss-feeds/top-ten-box-office-rss");      // loads XML tree
  //println(xml);

  XML[] movies = xml.getChildren("channel/item");  // put all movies into an array
  //println(movies);

  // size the array
  movieElements = new Movie[movies.length-1];  

  // set counters
  int xcounter=30;
  int ycounter=30;


  // for all the movies in the array
  for (int i=0; i < movies.length-1; i++) {      // for all the movies in the list

    String theTitle = movies[i].getChild(1).getContent();      // get the title
    String theURL = movies[i].getChild(9).getString("url");    // put URL in array

    movieElements[i] = new Movie(theTitle, theURL, xcounter, ycounter);

    if (ycounter < 500) {                    // if text is not too low
      ycounter +=220;      // move the ycounter
    } 
    else {    // otherwise move over
      ycounter = 30;
      xcounter += 350;
    }
  }
}




void draw() {

  background(90);

  for (int i = 0; i < movieElements.length; i++) {
    movieElements[i].display();
  }
}

