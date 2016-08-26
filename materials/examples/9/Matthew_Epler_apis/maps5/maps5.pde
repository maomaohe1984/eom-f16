
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.marker.*;


UnfoldingMap map;
String[] paths;

void setup() {
  size(800, 600, P2D);
  paths = loadStrings("openpaths_mepler.csv");
  processData();
  
}

void draw() {
  background(240);
  map.draw();
}

void processData() {
  String mbTilesString = sketchPath("data/boroughs_ea347b.mbtiles");

  map = new UnfoldingMap(this, new MBTilesMapProvider(mbTilesString));
  Location nycLoc = new Location(40.76857, -73.93967);
  map.zoomAndPanTo(nycLoc, 12); 
  
  for(int i=2; i<paths.length; i++) {
    String[] thisRow = split(paths[i], ",");
    Location thisLocation = new Location(float(thisRow[0]), float(thisRow[1]));
    SimplePointMarker here = new SimplePointMarker(thisLocation);
    color c = color(255, 255, 255, 100);
    here.setColor(c);
    here.setStrokeWeight(0);
    map.addMarkers(here);
  } 
  MapUtils.createDefaultEventDispatcher(this, map);
  
}
