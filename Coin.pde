class Coin
{
  
  int x; //Create Variables
  int y;
  int imgCounter; //Create variable imgCounter to be used when switching images
  
  final PImage img1 = loadImage("coin_01.png"); //Set variables for image animation
  final PImage img2 = loadImage("coin_02.png");
  final PImage img3 = loadImage("coin_03.png");
  final PImage img4 = loadImage("coin_04.png");
  final PImage img5 = loadImage("coin_05.png");
  final PImage img6 = loadImage("coin_06.png");
  final PImage img7 = loadImage("coin_07.png");
  final PImage img8 = loadImage("coin_08.png");
  
  Coin(int x, int y) //Constructor
  {
    this.x = x;
    this.y = y;
  }
  
  void update()
  {
    move();
    render();
  }
  
  void move()
  {
    x = x - 4; //X position decreases by 240px per second
  }
  
  void render()
  {
    if (imgCounter < 7.5) { //If counter is less than 6, display variable img1
      image(img1, x, y);
    } else if (imgCounter < 14) { //If counter is less than 12, display variable img2
      image(img2, x, y);
    } else if (imgCounter < 22.5) { 
      image(img3, x, y);
    } else if (imgCounter < 30) { 
      image(img4, x, y);
    } else if (imgCounter < 37.5) {
      image(img5, x, y);
    } else if (imgCounter < 45) {
      image(img6, x, y);
    } else if (imgCounter < 52.5) {
      image(img7, x, y);
    } else if (imgCounter < 60) {
      image(img8, x, y);
      imgCounter=0; //Reset the counter
    }

    imgCounter++; //Increment the counter after one single loop so infinite loop can resume
  }
  
}
