/*
Show data turnout over time
 as a bubble chart
 
 Data Source
 http://www.electproject.org/national-1789-present
 
 Google Spreadsheet of Data
 https://docs.google.com/spreadsheets/d/1bH38j6_e8yA9xq8OMlyLOL6h_iTS7ABQMKNxzFgKBDo/edit#gid=435419492
 
 I downloaded the data from the Google Sheet page by
 clicking File -> Download as -> Comma-separated values
 then saving to this Sketch's data directory and renaming to voter_turnout.csv
 
 I then loaded in Excel and deleted the 3rd and 4th columns
 you can also do this in Google Sheets before downloading
 */

Table voterTurnout;
int START_YEAR = 1789;
int END_YEAR = 2012;
float MIN_CIRCLE_SIZE = 1;
float MAX_CIRCLE_SIZE = 18;

void setup() {
  size(1400, 150);
  background(255);
  textAlign(CENTER);
  voterTurnout = loadTable("voter_turnout.csv", "header, csv");

  plotDatapoints();
  drawXAxis();
  drawLegend();
  drawChartTitle();
}

void plotDatapoints() {
  for (TableRow row : voterTurnout.rows()) {    
    float year = row.getFloat("Year");
    float voterTurnoutValue = row.getFloat("United States Presidential VEP Turnout Rate");

    // assume our data is sorted by year 1789 to 2012
    // voter turnout can range from 0 to 100 percent
    float x = map(year, START_YEAR, END_YEAR, 10, width-10);
    float circleSize = map(voterTurnoutValue, 0, 100, MIN_CIRCLE_SIZE, MAX_CIRCLE_SIZE);
    // use point instead of ellipse for more circly looking circles
    strokeWeight(circleSize);
    point(x, height/2.0);
  }
}

void drawXAxis() {
  // Draw x-axis tick labels
  fill(80);
  noStroke();
  for (int x=25; x<width; x+=100) {
    int year = round(map(x, 0, width, START_YEAR, END_YEAR));
    text(year, x, height-30);
  }
  text("Year", width/2.0, height-10); // draw axis title
}

void drawLegend() {
  pushMatrix();
  translate(width-275, 20);
  drawLegendItem(0, 0, 15); // 15%
  drawLegendItem(80, 0, 50); // 50%
  drawLegendItem(160, 0, 100); // 100%
  popMatrix();
}

void drawLegendItem(float x, float y, float pct) {
  float strokeSize = map(pct, 0, 100, MIN_CIRCLE_SIZE, MAX_CIRCLE_SIZE);
  stroke(0);
  strokeWeight(strokeSize);
  point(x, y);
  textAlign(LEFT, CENTER);
  text(pct + " %", x+strokeSize/2.0+5, y);
}

void drawChartTitle() {
  fill(0);
  textAlign(LEFT);
  textSize(16);
  text("United States Presidential VEP Turnout Rate", 10, 20);
}