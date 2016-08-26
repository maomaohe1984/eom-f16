/**
 *
 * Adapted from
 * Loading XML Data
 * by Daniel Shiffman.  
 * 
 * This example demonstrates how to use loadXML()
 * to retrieve data from an XML document via a URL
 */

// We're going to store the temperature
int temperature = 0;
// We're going to store text about the weather
String weather = "";
String zip = "02118";

void setup() {
  size(200, 200);

  // URL updated 2016-08-02, https://developer.yahoo.com/weather/
  String url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22" +zip+ "%22)&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";

  // Load the XML document
  XML xml = loadXML(url);

  // Grab the element we want
  XML forecast = xml.getChild("results/channel/item/yweather:forecast");

  // Get the attributes we want
  temperature = forecast.getInt("high");
  weather = forecast.getString("text");
}

void draw() {
  background(255);
  fill(0);

  // Display all the stuff we want to display
  text("Zip code: " + zip, 10, 50);
  text("Today’s high: " + temperature, 10, 70);
  text("Forecast: " + weather, 10, 90);
}