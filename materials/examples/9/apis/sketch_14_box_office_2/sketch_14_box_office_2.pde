XML xml;
String movietitles[];
String image_urls[];

PImage images[];

void setup() {
  size(800, 800);
  background(150);
  textLeading(20);

  xml = loadXML("http://www.movies.com/rss-feeds/top-ten-box-office-rss");      // loads XML tree
  //println(xml);

  XML[] movies = xml.getChildren("channel/item");  // put all movies into an array
  //println(movies);

  // size the arrays
  movietitles = new String[movies.length-1];
  image_urls = new String[movies.length-1];
  images = new PImage[movies.length-1];

  // for all the movies in the array
  for (int i=0; i < movies.length-1; i++) {                    // for all the movies in the list
    XML theTitle = movies[i].getChild(1);                      // get the title
    movietitles[i] = theTitle.getContent();                    // put title in array
    image_urls[i] = movies[i].getChild(9).getString("url");          // put URL in array
    //println(theTitle);
    //println(movies[i].getChildCount()); // how many fields does the XML entry have?
    //println(movies[i].getChild(6).getString("url"));
  }

  println(movietitles.toString());  // look over arrays
  println(image_urls.toString());

  for (int j=0; j < image_urls.length; j++) {    // for every data element
    images[j] = requestImage(image_urls[j]);    // ask to download the image
 }
}




void draw() {
  //
  background(90);

  int xcounter=30;
  int ycounter=30;


  for (int i=0; i < movietitles.length-1; i++) {      // for each movie

    if (images[i].width > 0) {                          // if image has arrived
      image(images[i], xcounter, ycounter);
    }

    text(movietitles[i], xcounter + images[i].width + 10, ycounter + 10, 200, 200);            // draw text

    if (ycounter < 500) {                    // if text is not too low
      ycounter +=images[i].height + 10;      // move the ycounter
    } 
    else {    // otherwise move over
      ycounter = 30;
      xcounter += 350;
    }
  }
  
}