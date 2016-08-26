class Album {
  
  int index;
  String trackName;
  String artist;
  String imageURL;
  
  int imageheight;
  
  lastFM parent;
  
  PImage theImage;
  
  
  Album(String newTrackName, String newArtist, String newImage, int newindex, lastFM theparent) {
    println("this is a new album instance");
    trackName = newTrackName;
    artist = newArtist;
    imageURL = newImage;
    index = newindex;
    parent = theparent;
    
    if(imageURL.equals("noImage")) {
        theImage = requestImage("http://userserve-ak.last.fm/serve/126/99681261.png");
    } else {
    theImage = requestImage(imageURL);
    }
  }
  
 void display() {
   
   int objectpos = ((imageheight+40) * index);
   if (theImage.width > 0) {
     imageheight = theImage.height;
     image(theImage, 0,objectpos);
     text(trackName + " by " + artist, 0, objectpos + theImage.height + 20);
   }
   
   
 }
  
  
}
