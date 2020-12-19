class World {
  int sizeX;
  int sizeY;
  Tile[][] level;
  World(String levelURL) {
    String lines[] = loadStrings(levelURL);
    for(int i = 0; i<lines.length;i++){
      lines[i]= lines[i].replace(",","");
    }
    sizeX=lines[0].length();
    sizeY=lines.length;
    print(lines);
    level = new Tile[sizeX][sizeY];
    for (int x = 0; x < sizeX; x++) {
      for (int y = 0; y < sizeY; y++) {
        print("Test: " + resources.tileMap.get(""+lines[y].charAt(x)));
        level[x][y] = resources.getTileFromMap(""+(lines[y].charAt(x)));
        
      }
    }
  }

  void initLevel() {
  }
  
  void drawWorld() {
    for (int x = 0; x < sizeX; x++) {
      for (int y = 0; y < sizeY; y++) {
        //print(x,y);
        //print(level[x][y]);
        if(level[x][y]!=null)
        level[x][y].drawTile(x, y); //<>//
      }
    }
  }
}
