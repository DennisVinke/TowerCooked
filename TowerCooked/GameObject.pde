class GameObject{

  int xPos;
  int yPos;

  int health = 100;

  GameObject(int tempX, int tempY){
      xPos = tempX;
      yPos = tempY;
  }
    
    void display(){}

    void update() {}

     boolean isDead() {
    return  health <= 0;
  }

  boolean collide(){
  return false;
  }

  boolean checkCollisionGameObject(){
    return false;
  }

  boolean handleCollision(){
    return false;
  }

  boolean checkPlaceInFront(){
    return false;
  }

  boolean checkCollisionStatic(int x, int y){ 
      int tileX, tileY;
        tileX = (x/PIXELSIZE);
        tileY = (y/PIXELSIZE);
      if(!(tileX>=0 && tileY >=0 && tileY<level1.sizeY && tileX < level1.sizeX))
        return false;
      return level1.getTileWalkable(tileX,tileY);
  }
}
