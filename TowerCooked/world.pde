class World {
  int sizeX;
  int sizeY;
  Tile[][] level;

  World(String levelURL) {
    String lines[] = loadStrings(levelURL);
    sizeX=lines[0].split(",").length;
    sizeY=lines.length;
    level = new Tile[sizeX][sizeY];
    for (int x = 0; x < sizeX; x++) {
      for (int y = 0; y < sizeY; y++) {
        String[] row = lines[y].split(",");
        level[x][y] = resources.getTileFromMap(""+(row[x]));
      }
    }
  }

  void initLevel() {
    
  }
  
  void drawWorld() {
    for (int x = 0; x < sizeX; x++) {
      for (int y = 0; y < sizeY; y++) {
        if(level[x][y]!=null)
        level[x][y].drawTile(x, y); //<>//
      }
    }
  }
}
