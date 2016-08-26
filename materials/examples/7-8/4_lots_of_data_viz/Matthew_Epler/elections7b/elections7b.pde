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
  for (Election e : allElections) {
    if (e.electionYear == renderYear) {
      e.render(renderCategory);
    }
  }
  drawGUI();
  drawLineGraph();
}

void drawLineGraph() {
  float[] democrats = new float[allElections.size()];
  float[] republicans = new float[allElections.size()];
  int demCounter = 0;
  int repCounter = 0;
  
  for(int i=allElections.size()-1; i>=0; i--) {
    Election thisElection = allElections.get(i);
    for(int j=0; j<thisElection.totalCandidates; j++) {
      if(j==0) {
        Candidate thisCandidate = thisElection.candidates.get(j);
        for(Category cat : thisCandidate.categories) {
          if(cat.title.equals(renderCategory)) {
            democrats[demCounter] = cat.value;
            demCounter++;
          } 
        }
      } else if(j==1) {
        Candidate thisCandidate = thisElection.candidates.get(j);
        for(Category cat : thisCandidate.categories) {
          if(cat.title.equals(renderCategory)) {
            republicans[repCounter] = cat.value;
            repCounter++;
          } 
        }
      }
    } 
  }
  
  ArrayList<Election> others = new ArrayList<Election>();
  for(Election e : allElections) {
     if(e.totalCandidates > 2) {
       others.add(e); 
     }
  }
  
  // draw marker lines
  for(int i=0; i<allElections.size(); i++) {
    Election thisElection = allElections.get(i);
    float maxValue = max(democrats[i], republicans[i]);
    maxValue = map(maxValue, 0, 100, 0, graphHeight);
    stroke(255);
    strokeWeight(1);
    line(secWidth*thisElection.index, graphBottom, secWidth*thisElection.index, graphBottom - maxValue);
  }
  
  // draw line graphs for each category
  strokeWeight(3);
  noFill();
  
  beginShape(); // DEMS
  stroke(#0D3574);
  for(int i=0; i<democrats.length; i++) {
    float thisValue = map(democrats[i], 0, 100, 0, graphHeight);
    vertex(secWidth*(i+1), graphBottom - thisValue);
    ellipse(secWidth*(i+1), graphBottom - thisValue, 5, 5);
  }
  endShape();
  
  beginShape(); // REPUBS
  stroke(#FF3434);
  for(int i=0; i<republicans.length; i++) {
    float thisValue = map(republicans[i], 0, 100, 0, graphHeight);
    vertex(secWidth*(i+1), graphBottom - thisValue);
    ellipse(secWidth*(i+1), graphBottom - thisValue, 5, 5);
  }
  endShape();
  
  // base line
  strokeWeight(5);
  stroke(25);
  line(secWidth, graphBottom, width - secWidth, graphBottom);
  
  // Ellipses only for "Other" candidates
  stroke(#F2F0F0);
  strokeWeight(2);
  fill(#F2F0F0);
  for(int i=0; i<others.size(); i++) {
    Election thisElection = others.get(i);
    Candidate thisCandidate = thisElection.candidates.get(2);
    for(Category cat : thisCandidate.categories) {
      if(cat.title.equals(renderCategory)) {
        float thisValue = map(cat.value, 0, 100, 0, graphHeight);
        ellipse(width - secWidth*thisElection.index - 8, graphBottom - thisValue, 5, 5); 
      }
    } 
  }
  
  
  
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
  for (int column=1; column<years.length; column++) {
    int electionYear = years[column];
    Election thisElection;
    Candidate thisCandidate;

    // if the year is the same as the prev column,
    // add this candidate to the last election object
    if (electionYear == years[column-1]) {
      thisElection = allElections.get(allElections.size()-1);
      thisCandidate = new Candidate(names[column], electionYear, thisElection.totalCandidates +1);
      thisElection.totalCandidates += 1;

      //       println("New Candidate added to" + electionYear);
      //       println(names[column]);
    } 
    else {
      // if the year is NOT the same as the prev column,
      // create a new election and add the first candidate
      thisElection = new Election(electionYear);
      thisCandidate = new Candidate(names[column], electionYear, 1);

      allElections.add(thisElection);
      thisElection.index = allElections.size();

      //       println("New Election Created");
      //       println(electionYear + " : " + names[column]);
    }

    // for every row of data, match the candidate with the value for that row
    for (int i=2; i<allData.length; i++) {
      String[] thisRow = allData[i].split(",");
      String title = thisRow[0];
      int value = int(thisRow[column]);
      Category thisCategory = new Category(title, value);
      thisCandidate.categories.add(thisCategory);
    }


    thisElection.candidates.add(thisCandidate);
    allCandidates.add(thisCandidate);



    //    for(Candidate c : allCandidates) {
    //      if(c.name.contains("Obama")) {
    //        for(Category cat : c.categories) {
    //          println(cat.title + " : " + cat.value); 
    //        }
    //      } 
    //    }
  }
}

