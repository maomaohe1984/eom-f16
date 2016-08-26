import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;



UnfoldingMap map;

void setup() {
  size(800, 600, P3D);
  map = new UnfoldingMap(this);
  //map = new UnfoldingMap(this, new GeoMapApp.TopologicalGeoMapProvider());
  //map = new UnfoldingMap(this, new MapBox.ControlRoomProvider());
  //map = new UnfoldingMap(this, new MapBox.WorldLightProvider());
  //map = new UnfoldingMap(this, new Microsoft.AerialProvider());
  //map = new UnfoldingMap(this, new Microsoft.HybridProvider());
  //map = new UnfoldingMap(this, new Microsoft.RoadProvider());
  //map = new UnfoldingMap(this, new OpenStreetMap.OpenStreetMapProvider());
  //map = new UnfoldingMap(this, new OpenStreetMap.OSMGrayProvider());
  //map = new UnfoldingMap(this, new StamenMapProvider.Toner());
  //map = new UnfoldingMap(this, new StamenMapProvider.TonerBackground());
  //map = new UnfoldingMap(this, new StamenMapProvider.TonerLite());
  //map = new UnfoldingMap(this, new StamenMapProvider.WaterColor());

  MapUtils.createDefaultEventDispatcher(this, map); 
}

void draw() {
  map.draw(); 
  Location here = map.getLocation(mouseX, mouseY);
  fill(0);
  text(here.getLat() + ", " + here.getLon(), mouseX, mouseY);
}