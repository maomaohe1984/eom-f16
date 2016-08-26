XML xml;
String movietitles[];

void setup() {
  size(400, 500);
  background(150);
  textLeading(20);
  
  xml = loadXML("http://www.movies.com/rss-feeds/top-ten-box-office-rss");      // loads XML tree
  println(xml);
  
  XML[] movies = xml.getChildren("channel/item");  // put all movies into an array
  println(movies.toString());
  
  movietitles = new String[movies.length];

   // for all the movies in the array
 for (int i=0; i < movies.length; i++) {      // for all the movies in the list
    XML theTitle = movies[i].getChild(1);      // get the title
    movietitles[i] = theTitle.getContent();    // put title in array
  }
  
  println(movietitles.toString());
}

void draw() {
//
  background(90);
  int ycounter=30;

  for (int i=0; i < movietitles.length; i++) {
    text(movietitles[i], 20, ycounter);            // caption
    ycounter +=20;                                 // updates position
  }
 
}