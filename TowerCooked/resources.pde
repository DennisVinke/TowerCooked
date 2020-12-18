import java.util.*;

public static final String OVERWORLD_URL = "./data/sprites/Overworld.png";
public static final String A_URL = "";

class Resources {
  Map<String, Tile> tileMap;

  Resources() {
    tileMap = new HashMap<String, Tile>();
    populateTileMap();
  }

  void populateTileMap() {
    PImage overworld = loadImage(OVERWORLD_URL);
    
    image(overworld, 0, 0);
  }
}
