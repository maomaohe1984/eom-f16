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
  }
}

