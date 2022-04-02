class Diver
{
  int x;
  int y;
  int imgCounter; //Declare variable imgCounter to be used when switching images
  
  PImage img1 = loadImage("diver1.png"); //Declare variables for diver animation
  PImage img2 = loadImage("diver2.png");
  PImage img3 = loadImage("diver3.png");
  PImage img4 = loadImage("diver4.png");
  PImage img5 = loadImage("diver5.png");
  PImage img6 = loadImage("diver6.png");
  PImage img7 = loadImage("diver7.png");
  PImage img8 = loadImage("diver8.png");
  PImage img9 = loadImage("diver9.png");
  PImage img10 = loadImage("diver10.png");
  
  Diver(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void update()
  {
  }
  
  void move()
  {
  }
  
  void render()
  {
    if (imgCounter < 6) { //If counter is less than 6, display variable img1
      image(img1, x, y);
    } else if (imgCounter < 12) { //If counter is less than 12, display variable img2
      image(img2, x, y);
    } else if (imgCounter < 18) { 
      image(img3, x, y);
    } else if (imgCounter < 24) { 
      image(img4, x, y);
    } else if (imgCounter < 30) {
      image(img5, x, y);
    } else if (imgCounter < 36) {
      image(img6, x, y);
    } else if (imgCounter < 42) {
      image(img7, x, y);
    } else if (imgCounter < 48) {
      image(img8, x, y);
    } else if (imgCounter < 54) {
      image(img9, x, y);
    } else if (imgCounter < 60) {
      image(img10, x, y);
    } else { 
      imgCounter=0; //Reset the counter
    }

    imgCounter++; //Increment the counter after one single loop so infinite loop can resume
  }
  
  boolean crash(Pearl pearl) //Crash function for pearl
  {
    return abs (this.x-pearl.x) < 91 && abs (this.y - pearl.y) < 44;
  }
  
  boolean crash(Coin coin)
  {
    return abs (this.x - coin.x) < 91 && abs (this.y - coin.y) < 44;
  }
  
  boolean crash(Mine mine)
  {
    return abs (this.x - mine.x) < 91 && abs (this.y - mine.y) < 44;
  }
}
