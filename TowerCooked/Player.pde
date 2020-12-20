class Player extends GameObject {
  final static int xSpeedNormal = 2;
  final static int ySpeedNormal = 2;
  final static int xSpeedFast = 2;
  final static int ySpeedFast = 2;

  Inventory inventory;

  int xSpeed = 1;
  int ySpeed = 1;

  // MOVEMENT KEYS -- [PlayerOne, Player Two]
  int playerNumber;
  char[] runningKey  = {'t', 'p'};
  char[] leftKey     = {'a', 'j'};
  char[] rightKey    = {'d', 'l'};
  char[] upKey       = {'w', 'i'};
  char[] downKey     = {'s', 'k'};
  char[] interactKey = {'q', 'u'};

  // MOVEMENT BOOLEANS
  boolean isRunning   = false;
  boolean moveLeft    = false;
  boolean moveRight   = false;
  boolean moveUp      = false;
  boolean moveDown    = false;

  // CONSTRUCTOR
  Player(int tempX, int tempY, int tempNumber) {
    super(tempX, tempY);
    playerNumber = tempNumber;
    inventory = new Inventory(tempNumber);
  }

  void display() {
    ellipse(xPos, yPos, 10, 10);   
    inventory.display();
  }

  void update(Item item) {
    // MOVEMENT
    if (moveLeft  && checkCollisionStatic(xPos-xSpeed, yPos))  xPos -= xSpeed; 
    if (moveRight && checkCollisionStatic(xPos+xSpeed, yPos))  xPos += xSpeed; 
    if (moveUp    && checkCollisionStatic(xPos, yPos-ySpeed))  yPos -= ySpeed; 
    if (moveDown  && checkCollisionStatic(xPos, yPos+ySpeed))  yPos += ySpeed;

    // TOGGLE RUNNING
    if (isRunning) {
      xSpeed = xSpeedFast;
      ySpeed = ySpeedFast;
    } else {
      xSpeed = xSpeedNormal;
      ySpeed = ySpeedNormal;
    }
    
    if(abs(xPos - item.xPos) <= 3 && abs(yPos - item.yPos) <= 3) pickUp(item);
  }

  void pickUp(Item item) {
    inventory.addItem(item);
    item.setPickedUp();
  }
  
  void interact(Tower tower){
    tower.interact(inventory);  
  }

  void handleCollision(GameObject gb){
    println("Collision with enemy");
  }

  void keyPressEvent(char theKey) {
    // MOVEMENT DIRECTION PRESSED
    if (theKey == Character.toLowerCase(upKey[playerNumber])) moveUp = true;
    if (theKey == Character.toLowerCase(downKey[playerNumber])) moveDown = true;
    if (theKey == Character.toLowerCase(leftKey[playerNumber])) moveLeft = true;
    if (theKey == Character.toLowerCase(rightKey[playerNumber])) moveRight = true;

    // RUNNING TRUE  
    if (theKey == Character.toLowerCase(runningKey[playerNumber])) isRunning = true;

    // INTERACTION -> TODO: REFACTOR
    if (theKey == Character.toLowerCase(interactKey[playerNumber])) interact(tower);
  }

  void keyReleaseEvent(char theKey) {
    // MOVEMENT DIRECTIONS RELEASE
    if (theKey == Character.toLowerCase(upKey[playerNumber])) moveUp = false;
    if (theKey == Character.toLowerCase(downKey[playerNumber])) moveDown = false;
    if (theKey == Character.toLowerCase(leftKey[playerNumber])) moveLeft = false;
    if (theKey == Character.toLowerCase(rightKey[playerNumber])) moveRight = false;

    // RUNNING FALSE
    if (theKey == Character.toLowerCase(runningKey[playerNumber])) isRunning = false;
  }
}
