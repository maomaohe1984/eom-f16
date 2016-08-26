String filename = "US_Races.csv";
String[] allData;

void setup() {
  parseData();
}

void draw() {
  
}

void parseData() {
  allData = loadStrings(filename);
  printArray(allData); 
}
