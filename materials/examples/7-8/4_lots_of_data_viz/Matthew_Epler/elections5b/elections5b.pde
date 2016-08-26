String filename = "US_Races.csv";
String[] allData;

ArrayList<Election> allElections = new ArrayList<Election>();
ArrayList<Candidate> allCandidates = new ArrayList<Candidate>();

// Graph margins
int graphTop;
int graphBottom;
int graphHeight;
float margin;
int boxHeight;
float secWidth;

// Color
int backgroundCol = 180;

// Font
PFont nameFont;
PFont yearFont;
int yearFontLarge = 50;
int yearFontSmall = 16;
int nameFontSize = 28;

// Starting Data
int renderYear = 1952;
String renderCategory = "Women";


void setup() {
  size(1000, 800);
  smooth();
  nameFont = loadFont("Arial-Black-48.vlw");
  yearFont = loadFont("AppleGothic-48.vlw");
  graphTop = height - 120;
  graphBottom = height - 50;
  graphHeight = graphBottom - graphTop;
  margin = .04 * width;
  boxHeight = 80;
  
  parseData();
}

void draw() {
  background(backgroundCol);
  for(Election e : allElections) {
    if(e.electionYear == renderYear) {
      e.render(renderCategory);
    } 
  }
  drawGUI();
  
}

void drawGUI() {
  textFont(yearFont, yearFontLarge);
  textAlign(LEFT);
  
  // Category Box
  noStroke();
  fill(255);
  rect(0, margin, textWidth(renderCategory)*1.25 + margin, boxHeight);
  fill(25);
  text("\"" + renderCategory + "\"", margin/2, margin + boxHeight - yearFontLarge/2);
  
  // Year Box
  rect(0, margin+ boxHeight, margin + textWidth("00000"), boxHeight);
  fill(255);
  text(renderYear, margin, margin + boxHeight*2 - yearFontLarge/2);
  
  // Key
  secWidth = width/(allElections.size()+1);
  fill(#0D3574);
  rect(secWidth, height - 230, 20, 20);
  fill(#FF3434);
  rect(secWidth, height - 200, 20, 20);
  fill(#F2F0F0);
  rect(secWidth, height - 170, 20, 20);
  fill(255);
  textSize(yearFontSmall);
  text("Democrat", secWidth + 30, height - 214);
  text("Republican", secWidth + 30, height - 183);
  text("Other", secWidth + 30, height - 153);
  
  
}

void parseData() {
  allData = loadStrings(filename);
  //printArray(allData);
 
  int[] years = int(allData[0].split(","));
  String[] names = allData[1].split(",");
  
  // for each column, compare the year value and create the correct objects
  for(int column=1; column<years.length; column++) {
    int electionYear = years[column];
    Election thisElection;
    Candidate thisCandidate;
   
    // if the year is the same as the prev column,
    // add this candidate to the last election object
    if(electionYear == years[column-1]) {
       thisElection = allElections.get(allElections.size()-1);
       thisCandidate = new Candidate(names[column], electionYear, thisElection.totalCandidates +1);
       thisElection.totalCandidates += 1;
       
       println("New Candidate added to" + electionYear);
       println(names[column]);
    } else {
    // if the year is NOT the same as the prev column,
    // create a new election and add the first candidate
       thisElection = new Election(electionYear);
       thisCandidate = new Candidate(names[column], electionYear, 1);
       
       println("New Election Created");
       println(electionYear + " : " + names[column]);
    }
    
    // for every row of data, match the candidate with the value for that row
    for(int i=2; i<allData.length; i++) {
      String[] thisRow = allData[i].split(",");
      String title = thisRow[0];
      int value = int(thisRow[column]);
      Category thisCategory = new Category(title, value);
      thisCandidate.categories.add(thisCategory);
    }
    
    thisElection.index = allElections.size();
    thisElection.candidates.add(thisCandidate);
    allElections.add(thisElection);
    allCandidates.add(thisCandidate);
    
    for(Candidate c : allCandidates) {
      if(c.name.contains("Obama")) {
        for(Category cat : c.categories) {
          println(cat.title + " : " + cat.value); 
        }
      } 
    }
    
  }
 
}
