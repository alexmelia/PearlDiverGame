class WinSplash
{ 
  void shape()
  {
    fill(0,255,0);
    rect(0,0,800,500);
  }
  
  void render()
  {
    shape();
    fill(0,0,0);
    PFont f1 = createFont("Georgia", 64);
    String winMessage = "YOU WON!";
    
    textFont(f1);
    textSize(128);
    textAlign(CENTER);
    text(winMessage,400,120);
  
    PFont f2 = createFont("Georgia", 64);
    String scoreMessage = "You scored: " + scoreCounter;
    
    textFont(f2);
    textSize(48);
    textAlign(CENTER);
    text(scoreMessage,400,240);
  }
}
