class Tile {
  int id; 
  PImage tileImage;
  int PIXELSIZE;
  boolean showStatWindow = false;
  
  Tile(int identity, PImage tile, int pixelSize){
    id = identity;
    tileImage = tile.copy();
    PIXELSIZE = pixelSize;
  }

  void drawTile() {
    //image(tileImage, (id*16)%GAME_WIDTH, (id*16/GAME_WIDTH)*16); //<>//
    fill(0);
    textSize(8);
    image(tileImage, (id*16)%(PIXELSIZE*40), (id*16/(PIXELSIZE*40))*16);  
    text(id, (id*16)%(PIXELSIZE*40), (id*16/(PIXELSIZE*40))*16 + 16);
    
    if(showStatWindow){
      fill(255,255,255,40);
      rect(200, 200, 50, 200);
    }
  }
  
  boolean interactable(){
    return false;
  }
  
  boolean walkable(){
    return false;
  }
  
  void drawTile(int x, int y) {
    //image(tileImage, (id*16)%GAME_WIDTH, (id*16/GAME_WIDTH)*16);
    image(tileImage, (x*16),(y*16));  
  }
}
