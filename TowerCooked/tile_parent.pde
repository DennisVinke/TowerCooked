class Tile {
  int id; 
  PImage tileImage;
  int PIXELSIZE;
  Tile(int identity, PImage tile, int pixelSize){
    id = identity;
    tileImage = tile.copy();
    PIXELSIZE = pixelSize;
  }

  void drawTile() {
    //image(tileImage, (id*16)%GAME_WIDTH, (id*16/GAME_WIDTH)*16); //<>//

    image(tileImage, (id*16)%(PIXELSIZE*40), (id*16/(PIXELSIZE*40))*16);  
  }
  
  void drawTile(int x, int y) {
    //image(tileImage, (id*16)%GAME_WIDTH, (id*16/GAME_WIDTH)*16);

    image(tileImage, (x*16),(y*16));  
  }
}
