class LevelEditor {
  EditorState editorState=EditorState.MENU;
  int tileIndex = 0;
  int tilesToShow = 20;
  Tile[] tiles;
  LevelEditor() {
    drawMenu();
    tiles = new Tile[tilesToShow];
    getTilesFromTileMap();
  }

  void drawLevelEditor() {
    background(255);
    noFill();
    drawGrid(16);
    fill(255);
    drawGridTilesInMenu();
  }
    
  void drawGridTilesInMenu(){
    rect(GAME_WIDTH-200,0,200, GAME_HEIGHT);
    for(int i=0;i<tilesToShow; i++){
      //image(tiles[i]., GAME_WIDTH-200 + ((i*PIXELSIZE)%(PIXELSIZE*3)), 0 + (i*PIXELSIZE/(PIXELSIZE*40))*PIXELSIZE);
      tiles[i].drawTile(GAME_WIDTH-200 + ((i*PIXELSIZE)%(PIXELSIZE*3)) , 0 + (i*PIXELSIZE/(PIXELSIZE*40))*PIXELSIZE);
    }
  }
  
  void getTilesFromTileMap(){
    for(int i = 0; i< tilesToShow; i++){
      tiles[i] = resources.getTileFromMap(""+i);
    }
  }
  
  void drawGrid(int gridSize) {
    for (int i =0; i*gridSize<GAME_WIDTH; i++) {
      for (int j =0; j*gridSize<GAME_HEIGHT; j++) {
        noFill();
        rect(i*gridSize, j*gridSize, gridSize, gridSize);
      }
    }
  }
}
