XML xml;
String movietitles[];
String image_urls[];

Movie movieElements[];

PImage images[];
PFont font;

void setup() {
  size(1200, 1200);
  background(150);
  textLeading(20);
  font = loadFont("Rockwell-ExtraBold-48.vlw"); 

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

    String rawTitle = movies[i].getChild(1).getContent();      // get the title
    String theURL = movies[i].getChild(9).getString("url");    // put URL in array

    int p1 = rawTitle.indexOf(".");
    int p2 = rawTitle.indexOf("$");


    String theTitle = rawTitle.substring((p1+1), p2);
    String theMoney = rawTitle.substring(p2);
    //println(theMoney);

    movieElements[i] = new Movie(theTitle, theURL, xcounter, ycounter, i, theMoney);

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
  textFont(font);

  for (int i = 0; i < movieElements.length; i++) {
    movieElements[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < movieElements.length; i++) {
    movieElements[i].mouseCheck();
  }
}

