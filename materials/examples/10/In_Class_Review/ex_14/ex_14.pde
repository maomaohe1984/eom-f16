// https://github.com/MuseumofModernArt/collection
Table artists;
int[] numberOfArtistsByYear = new int[2001];

void setup() {
  size(900, 200);

  artists = loadTable("artists2.csv", "header");
  for (TableRow row : artists.rows()) {
    String name = row.getString("name");
    String nationality = row.getString("nationality");
    String gender = row.getString("gender");
    int birthdate = row.getInt("birthdate");
    numberOfArtistsByYear[birthdate]++;

    println(name, nationality, gender, birthdate);
  }
}
void draw() {
  fill(0);
  background(255);

  // Draw x-tick labels
  textAlign(LEFT);
  text("1730", map(1730, 1730, 2000, 3, width-3), 150); 
  textAlign(CENTER);
  text("1750", map(1750, 1730, 2000, 3, width-3), 150);
  text("1800", map(1800, 1730, 2000, 3, width-3), 150);
  text("1850", map(1850, 1730, 2000, 3, width-3), 150);
  text("1900", map(1900, 1730, 2000, 3, width-3), 150);
  text("1950", map(1950, 1730, 2000, 3, width-3), 150);
  textAlign(RIGHT);
  text("2000", map(2000, 1730, 2000, 3, width-3), 150);

  for (TableRow row : artists.rows()) {
    String name = row.getString("name");
    String nationality = row.getString("nationality");
    String gender = row.getString("gender");
    int birthdate = row.getInt("birthdate");

    float circleX = map(birthdate, 1730, 2000, 3, width-3);
    float circleY = height/2;    

    if (gender.equals("Male")) {
      // Male
      circleY = 50;
      text("Male", 20, 40);
    } else {
      // Female
      circleY = 85;
      text("Female", 20, 90);
    }
    noStroke();
    fill(0);

    float ellipseHeight = map(numberOfArtistsByYear[birthdate],
    1, 200, 2, 50);

    ellipse(circleX, circleY, 2, ellipseHeight);
  }
}