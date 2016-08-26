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
    for(int i=0; i<totalCandidates; i++) {
      Candidate thisCandidate = candidates.get(i);
      for(Category cat : thisCandidate.categories) {
        if(cat.title.equals(searchTitle)) {
          float renderValue = start + radians((cat.value/100.0) * 360);
          fill(colors[i]); // the first candidate is always a Democrat
          arc(x, y, renderRadius, renderRadius, start, renderValue);
          start = renderValue;
        }
      } 
    }
    
    // draw the hole
    fill(backgroundCol);
    noStroke();
    ellipse(x, y, hole, hole);
 }

}
