import java.util.*;

public static final String OVERWORLD_URL = "./data/sprites/Overworld.png";
public static final String A_URL = "";

class Resources {  
  Map<String, Tile> tileMap;

  Resources() {
    tileMap = new HashMap<String, Tile>();
    populateTileMap();
  }

  void populateTileMap2() {
    PImage overworld = loadImage(OVERWORLD_URL);
    int PIXELSIZE = 32;
    overworld.loadPixels();
    for (int i = 0; i<overworld.pixels.length; i+=PIXELSIZE) {
      //for (int j = 0; j<overworld.height; j+=PIXELSIZE) {
      PImage test = createImage(PIXELSIZE, PIXELSIZE, ARGB);
      test.loadPixels();
      test.pixels = subset(overworld.pixels, i, PIXELSIZE);// 5, 5, 0, 0, PIXELSIZE, PIXELSIZE); //<>// //<>//
      test.updatePixels();
      tileMap.put("tile"+i, new Tile(i, test, PIXELSIZE));
      //image(test,0,0);
      //break;
      //}
      break;
    }
  }

  void populateTileMap() {
    PImage overworld = loadImage(OVERWORLD_URL);
    int PIXELSIZE = 16;
    int counter = 0; 

    for (int j = 0; j<overworld.height; j+=PIXELSIZE) {
      for (int i = 0; i<overworld.width; i+=PIXELSIZE) {
        PImage test = createImage(PIXELSIZE, PIXELSIZE, ARGB);
        test.copy(overworld, i, j, PIXELSIZE, PIXELSIZE, 0, 0, PIXELSIZE, PIXELSIZE);
        if (tileInWalkable(counter)) {
          if (counter==GRASS_INDEX)
            tileMap.put(/*"tile"*/ ""+ counter, new GrassTile(counter, test, PIXELSIZE)); 
          else
            tileMap.put(/*"tile"*/ ""+ counter, new RoadTile(counter, test, PIXELSIZE));
        }
        tileMap.put(/*"tile"*/ ""+ counter, new Tile(counter, test, PIXELSIZE)); 
        counter += 1;
      }
    }
    println("Items: "+ counter);
  }

  boolean tileInWalkable(int index) {
    for (int i : walkableArray) {
      if (i==index)
        return true;
    }
    return false;
  }

  void drawAllResources() {
    for (Map.Entry<String, Tile> entry : tileMap.entrySet()) {
      //println(entry.getKey());
      entry.getValue().drawTile();
    }
  }

  Tile getTileFromMap(String inputKey) {
    return tileMap.get(inputKey);
  }
}
