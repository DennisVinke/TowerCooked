class WalkableTile extends Tile{
  
  WalkableTile(int identity, PImage tile, int pixelSize){
    super(identity,tile,pixelSize);
  } 
  
  boolean interactable(){
    return true;
  }
  
  boolean walkable(){
    return true;
  }
}
