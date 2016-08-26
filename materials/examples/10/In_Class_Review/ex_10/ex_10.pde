// https://github.com/MuseumofModernArt/collection
Table artists;

void setup() {
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
}