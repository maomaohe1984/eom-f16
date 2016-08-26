/*
*    Fetch tweets with hashtag dmi from twitter
*    every 30 seconds and display on screen
*    
*    @author cerenpaydas
*/
ConfigurationBuilder cb = new ConfigurationBuilder();
Twitter twitterInstance;
Query queryForTwitter;

ArrayList tweets;
int UPDATE_DELAY = int(30*6); // 6 seconds
long lastUpdate = 0;

void setup() {
  frameRate(30);
  
  // Create an app, create an access token and fill in keys below, https://apps.twitter.com/
  cb.setOAuthConsumerKey("");
  cb.setOAuthConsumerSecret("");
  cb.setOAuthAccessToken("");
  cb.setOAuthAccessTokenSecret("");

  twitterInstance = new TwitterFactory(cb.build()).getInstance();
  queryForTwitter = new Query("#dmi");

  size (640, 440);
  FetchTweets(); // fetch tweets once initially
}

void draw() {
  background(0);
  DrawTweets();
  
  // wait 30 seconds to update again
  if(lastUpdate >= UPDATE_DELAY){
    FetchTweets();
    lastUpdate = 0; // reset
  }
  lastUpdate++;
}

void DrawTweets() {
  for (int i=0; i<tweets.size(); i++) {
    Status t = (Status) tweets.get(i);
    String user = t.getUser().getName();
    String msg = t.getText();
    text(user + ": " +msg, 20, 15+i*30, width-20, height);
  }
}
void FetchTweets() {
  println("fetching tweets...");
  try {
    QueryResult result = twitterInstance.search(queryForTwitter);  
    tweets = (ArrayList) result.getTweets();
  } 
  catch(TwitterException te) {
    println("Couldn't connect: "+te);
  }
}