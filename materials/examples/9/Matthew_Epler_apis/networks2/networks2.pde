import com.temboo.core.*;
import com.temboo.Library.LastFm.Artist.*;

String searchText = "The Rolling Stones";
/* NOTE
add your own Temboo credentials below
*/
TembooSession session = new TembooSession("matthewepler", "myFirstApp", "8972a60f56074815873d8e6d1e3dd091");

XML searchResults;
Cluster c;


void setup() {
  size(500, 500);
  smooth();
  runGetSimilarChoreo();
}

void draw() {
  background(40);
  fill(255, 0, 0);
  c.display();
}

void createCluster() {
  c = new Cluster(searchText, new PVector(width/2, height/2));
  
  XML similarArtists = searchResults.getChild("similarartists");
  //println(similarArtists);
  XML[] artists = similarArtists.getChildren("artist");
  for(int i=0; i<artists.length; i++) {
    XML artistName = artists[i].getChild("name");
    String name = artistName.getContent();
    Node n = new Node(name, i);
    c.addNode(n);
    //println(artistName.getContent()); 
  }
  for(Node n : c.nodes) {
    n.calcPos(); 
  }
}


void runGetSimilarChoreo() {
  GetSimilar getSimilarChoreo = new GetSimilar(session);
  getSimilarChoreo.setCredential("lastFMEplerParsons");
  getSimilarChoreo.setArtist(searchText);
  getSimilarChoreo.setLimit("12");
  GetSimilarResultSet getSimilarResults = getSimilarChoreo.run();
  
  searchResults = parseXML(getSimilarResults.getResponse());
  //println(searchResults);
  
  createCluster();
}