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
boolean buttonHover, displayMenu;


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
  
  checkMouse();
  
  for (Election e : allElections) {
    if (e.electionYear == renderYear) {
      e.render(renderCategory);
    }
  }
  
  if(displayMenu) {
    displayMenu(); 
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
    thisElection.renderFlag(i);  
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
  if(buttonHover) {
   stroke(0, 100); 
  } else {
   noStroke();
  }
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
  }
}

void checkMouse() {
  if(mouseY > margin && mouseY< margin+boxHeight && mouseX < renderCategory.length()*55) {
    buttonHover = true; 
  } else {
    buttonHover = false; 
  }
}
  
void mouseClicked() {
  if(buttonHover) {
    displayMenu = !displayMenu;
  } 
  
  for(int i=1; i<allElections.size()+1; i++) {
    if(mouseX > secWidth*i - secWidth/2 && mouseX < secWidth*i + secWidth/2 &&
    mouseY > graphTop && !displayMenu) {
      Election thisElection = allElections.get(allElections.size() - i);
      renderYear = thisElection.electionYear; 
    }
  }
}

void displayMenu() {
  textFont(yearFont);
  textAlign(LEFT);
  stroke(255, 20);
  
  float heightTracker = margin + boxHeight;
  int bHeight = 20;
  int boxWidth = 220;
  int colCounter = 0;
  
  for(int i=2; i<allData.length; i++) {
    String[] thisRow = allData[i].split(",");
    textSize(yearFontLarge);
    float boxX = margin + textWidth("00000") + (colCounter * boxWidth);
    textSize(yearFontSmall);
     
    // if I'm in a box, make it white with black text
    if(mouseX > boxX && mouseX < boxX + boxWidth && mouseY > heightTracker 
    && mouseY < heightTracker + bHeight) {
     fill(255);
     rect(boxX, heightTracker, boxWidth, bHeight);
     fill(25);
     text(thisRow[0], boxX+5, heightTracker + 16);
     if(mousePressed) {
       renderCategory = thisRow[0];
       displayMenu = false; 
     }
    } else { // make the box black with white text (normal) 
      fill(25);
      rect(boxX, heightTracker, boxWidth, bHeight);
      fill(255);
      text(thisRow[0], boxX + 5, heightTracker + 16);
    }
    
    heightTracker += bHeight;
    
    if(heightTracker > height - 160) {
      heightTracker = margin + boxHeight;
      colCounter++; 
    }
  }
}






class Candidate {
  
  String name;
  int elecYear;
  int index;
  ArrayList<Category> categories = new ArrayList<Category>();
  
  Candidate(String _name, int _year, int _index) {
    name = _name;
    elecYear = _year;
    index = _index; 
  }
  
}
class Category {
  
  String title;
  int value;
 
  Category(String _title, int _value) {
    title = _title;
    value = _value;
  } 
  
}
class Election {

  int electionYear;
  int totalCandidates;
  int index;
  ArrayList<Candidate> candidates = new ArrayList<Candidate>(); 

  Election(int _year) {
    electionYear = _year;
    totalCandidates = 1;
  }

  void render(String _category) {
    String searchTitle = _category;
    color[] colors = {
      color(#0D3574), color(#FF3434), color(#F2F0F0)
    };
    noStroke();

    float x = width/2 + margin;
    float y = height/2 - 50;
    float renderRadius = 600;
    float hole = 0.55*renderRadius;
    float start = radians(90);

    // draw the pie chart
    for (int i=0; i<totalCandidates; i++) {
      Candidate thisCandidate = candidates.get(i);
      for (Category cat : thisCandidate.categories) {
        if (cat.title.equals(searchTitle)) {
          float renderValue = start + radians((cat.value/100.0) * 360);
          fill(colors[i]); // the first candidate is always a Democrat
          arc(x, y, renderRadius, renderRadius, start, renderValue);
          start = renderValue;
        }
      }
    }
    
    // draw the segment line
    stroke(backgroundCol);
    strokeWeight(2);
//    find a point on the circum. of a circle    
//    x = cx + radius * cos(angle);
//    y = cy + radius * sin(angle); 
    for(int angle=0; angle<360; angle+=2) {
      float outerX = x + ((renderRadius/2)*cos(radians(angle)));
      float outerY = y + ((renderRadius/2)*sin(radians(angle)));
      line(x, y, outerX, outerY);
    }

    // draw the hole
    fill(backgroundCol);
    noStroke();
    ellipse(x, y, hole, hole);

    // fill the hole with data
    for (Candidate c : candidates) {
      int startY;
      float spacing;
      
      if(candidates.size() > 2) {
        startY = 180;
        spacing = 80*c.index; 
      }
      else {
        startY = 235;
        spacing = 80*c.index; 
      }
      
      textFont(nameFont, nameFontSize);
      fill(colors[c.index-1]);
      textAlign(CENTER);
      strokeWeight(1);
      text(c.name, x, startY + spacing);
      for(Category cat : c.categories) {
        if(cat.title.equals(searchTitle)) {
          text(int(cat.value) + "%", x, startY + 30 + spacing);
        } 
      }
    }
  
  stroke(25);
  strokeWeight(3);
  line(width - (secWidth*index) - 8, height-10, width - (secWidth*index) - 8, graphBottom);
  fill(25);
  stroke(25);
  rect(width - (secWidth*index) - 8, height-30, secWidth, 20);
  textFont(yearFont, yearFontSmall);
  fill(255);
  textAlign(LEFT);
  text(electionYear, width - (secWidth*index), height -14);
  
}

  void renderFlag(int _i) {
    _i = _i + 1;
    float sectionWidth = secWidth*_i;
    
    if(mouseY > graphTop && mouseX > sectionWidth - secWidth/2 &&
    mouseX < sectionWidth + secWidth/2) {
     strokeWeight(3);
     line(sectionWidth, graphBottom, sectionWidth, graphTop);
     fill(255);
     rect(sectionWidth, graphTop - 20, secWidth, 20);
     textFont(yearFont, yearFontSmall);
     fill(25);
     text(1952 + (_i-1)*4, sectionWidth + 6, graphTop - 4);
    }
  }

}


