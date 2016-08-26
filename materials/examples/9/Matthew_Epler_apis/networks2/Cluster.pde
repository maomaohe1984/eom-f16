class Cluster {
  
 int connections;
 float angle;
 PVector center;
 String name;
 ArrayList<Node> nodes;
 int size;
 int reach;
 
 Cluster(String _name, PVector _center) {
    name = _name;
    center = _center;
    reach = 200;
    size = 150;  
    nodes = new ArrayList<Node>(); 
 }
 
 void addNode(Node n) {
   nodes.add(n); 
   connections = nodes.size();
   angle = TWO_PI / connections;
 }
 
 void display() {  
    
    for(int i=0; i<nodes.size(); i++) {
      Node n = nodes.get(i);
      n.display();
    }
    
    fill(255, 0, 0);
    stroke(255);
    ellipse(center.x, center.y, size, size);
    
    textSize(15);
    fill(255);
    textAlign(CENTER, CENTER);
    text(name, center.x, center.y);
 }
}