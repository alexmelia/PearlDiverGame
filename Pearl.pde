class Pearl
{
  int x;
  int y;
  
  final PImage img1 = loadImage("pearl.png"); //Set variable for image of Pearl
  
  Pearl(int x, int y)
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
    x = x - 4;
  }
  
  void render()
  {
    image(img1,x,y);
  }
}
