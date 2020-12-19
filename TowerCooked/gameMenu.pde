class GameMenu {
  ArrayList<Button> buttonArray = new ArrayList<Button>();
  GameState gameState1;

  //This does not give the reference but a value so now its going over global communication
  GameMenu(GameState state) {
    gameState1 = state;
    //make sure button text is part of GameState enum!
    buttonArray.add(new Button(400, 10, 100, 50, "PLAY"));
    buttonArray.add(new Button(400, 70, 100, 50, "LOAD"));
    buttonArray.add(new Button(400, 130, 100, 50, "LEVELEDITOR"));
    buttonArray.add(new Button(400, 190, 100, 50, "TILEMAPDEBUG"));
  }

  void drawMenu() {
    fill(200, 50, 12);
    rect(0, 0, GAME_WIDTH, GAME_HEIGHT);
    for (Button button : buttonArray) {
      button.drawButton();
    }
  }

  void handleButtons(int x, int y) {
    for (Button button : buttonArray) {
      if (button.isOver(x, y)) {  
        gameState = GameState.valueOf(button.text);
      }
    }
  }
}
