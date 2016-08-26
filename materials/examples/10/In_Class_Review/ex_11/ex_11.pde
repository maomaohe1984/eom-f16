// https://github.com/MuseumofModernArt/collection
Table artists;

void setup() {
  size(800, 200);
  
  artists = loadTable("artists2.csv", "header");
  for (TableRow row : artists.rows()) {
    String name = row.getString("name");
    String nationality = row.getString("nationality");
    String gender = row.getString("gender");
    int birthdate = row.getInt("birthdate");

    println(name, nationality, gender, birthdate);
  }
}
void draw() {
  background(255);
  
  for (TableRow row : artists.rows()) {
    String name = row.getString("name");
    String nationality = row.getString("nationality");
    String gender = row.getString("gender");
    int birthdate = row.getInt("birthdate");

    float screenXPos = map(birthdate, 1730, 2000, 3, width-3);
    noStroke();
    fill(0);
    ellipse(screenXPos, height/2, 5, 5);
  }
}