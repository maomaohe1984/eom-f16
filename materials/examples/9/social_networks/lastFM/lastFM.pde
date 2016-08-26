Album[] theAlbums;
String apiKey = "YOUR API KEY HERE";

void setup() {
  size(300, 700);
  loadXML();
}

void draw() {
  background(80);
  for(int j=0; j < theAlbums.length; j++) {
    theAlbums[j].display();
  }
}

void hello() {
  println("an object says hello"); 
}

void loadXML() {
  println("loading xml...");
  XML topTracks = loadXML("http://ws.audioscrobbler.com/2.0/?method=chart.getTopTracks&limit=10&api_key="+apiKey);
  parseXML(topTracks);
}

void parseXML(XML myXML) {
  println("parsing xml");
  //println(myXML); 

  XML[] individualTracks = myXML.getChildren("tracks/track");

  theAlbums = new Album[individualTracks.length];

  for (int i=0; i < individualTracks.length; i++) {
    String theArtist = individualTracks[i].getChild("artist/name").getContent();
    String theTitle = individualTracks[i].getChild("name").getContent();

    XML[] images = individualTracks[i].getChildren("image"); // how many image tags are there?
    String theImage = "noImage";

    for(int j=0; j<images.length; j++){
      theImage = images[j].getContent();
    }

    theAlbums[i] = new Album(theTitle, theArtist, theImage, i, this);
  }
  println(theAlbums[3].imageURL);
}