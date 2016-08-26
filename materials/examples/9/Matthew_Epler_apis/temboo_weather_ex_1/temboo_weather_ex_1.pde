import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;

// Create a session using your Temboo account application details
// if Yahoo account + app info was saved, then you're good to go.
// https://temboo.com/account/applications
TembooSession session = new TembooSession("andrewringler", "myFirstApp", "YOUR API KEY HERE");

// Set up the location
String location = "Brooklyn, NY";

// Set up some global values
int temperature;
XML weatherResults;

void setup() {
  size(350, 350);

  runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
  getTemperatureFromXML(); // Get the temperature from the XML results
  displayColor(); // Set the background color
}

void runGetWeatherByAddressChoreo() {
  // Create the Choreo object using your Temboo session
  GetWeatherByAddress getWeatherByAddressChoreo = new GetWeatherByAddress(session);

  // Set inputs
  getWeatherByAddressChoreo.setAddress(location);

  // Run the Choreo and store the results
  GetWeatherByAddressResultSet getWeatherByAddressResults = getWeatherByAddressChoreo.run();

  // Store results in an XML object
  weatherResults = parseXML(getWeatherByAddressResults.getResponse());
}

void getTemperatureFromXML() {
  // Narrow down to weather condition
  XML condition = weatherResults.getChild("channel/item/yweather:condition");

  // Get the current temperature in Fahrenheit from the conditions
  temperature = condition.getInt("temp");

  // Print temperature value
  println("The current temperature in "+location+" is "+temperature+"ºF");
}

void displayColor() {
  // Set up the temperature range in Fahrenheit
  int minTemp = 0;
  int maxTemp = 100;

  // Convert temperature to a 0-255 color value
  float temperatureColor = map(temperature, minTemp, maxTemp, 0, 255);    

  // Set background color using temperature on a blue to red scale     
  background(color(temperatureColor, 0, 255-temperatureColor));
}