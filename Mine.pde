class Mine
{
  int x = 800;
  int y;
  
  final PImage img1 = loadImage("mine.png"); //Set variable for image of Mine
  
  Mine(int x, int y)
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
