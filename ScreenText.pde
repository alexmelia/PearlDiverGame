class ScreenText
{
  void render()
  {
    PFont f = createFont("Georgia", 64); //Create variable for font 
    
    String timeRemainingText = "Time remaining: " + timer.getRemainingTime(); //Create variable for remaining time
  
    String livesRemainingText = "Lives remaining: " + livesCounter; //Create variable for remaining lives
  
    String scoreText = "Score: " + scoreCounter; //Create variable for the score
    
    String messageText = "To switch between levels, press keys '1', '2' or '3'."; //Create variable for screen message
    
    textFont(f);
    textSize(24);
    text(timeRemainingText,10,30); //Display string on screen
    text(livesRemainingText,280,30);
    text(scoreText,600,30);
    text(messageText,120,80);
  }
  
  
}
