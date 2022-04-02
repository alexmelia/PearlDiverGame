class DeathSplash
{ 
  void shape()
  {
    fill(255,0,0); //Colour red
    rect(0,0,800,500); //Fits size of screen
  }
  
  void render()
  {
    shape(); //Call in member shape
    fill(0,0,0); //Colour black
    PFont f = createFont("Georgia", 64); //Set font to 'Georgia'
    String deathMessage = "YOU DIED!"; //Create variable for message to be displayed
    
    textFont(f); //Set string to be of Font 'f'
    textSize(128); //Set string size to 128
    textAlign(CENTER); //Set string to appear in Center of screen
    text(deathMessage,400,120); //Load string onto screen
  
    String scoreMessage = "You scored: " + scoreCounter; //Create variable for message to be displayed
    
    textSize(48);
    textAlign(CENTER);
    text(scoreMessage,400,240);
  }
}
