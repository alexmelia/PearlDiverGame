Diver diver; //Call in the classes
CountDown timer;
DeathSplash deathSplash;
ScreenText screenText;
WinSplash winSplash;

PImage background; //Define background as a variable
int backgroundX = 0; //Define x position of background as variable and set to 0

final int PLAYING = 0;
final int FINISHED = 1;
int gameMode = PLAYING; //Set mode to playing as default

ArrayList<Pearl> pearlList = new ArrayList(); //Create Array Lists for collectables
ArrayList<Mine> mineList = new ArrayList();
ArrayList<Coin> coinList = new ArrayList();

int spawnTimer = 0; //Set spawn counter to 0
int scoreCounter = 0; //Set score counter to default
int livesCounter = 3; //Set default number of lives to 3
int currentLevel = 1; //Set default level to 1
int winSplashCounter = 0; //Set counter until winSplash screen to 0

void setup()
{
  size(800,500); //Set screen size
  background = loadImage("background.png"); //Load background image from file
  background.resize(width, height); //Resize the background to fit the screen size
  diver = new Diver(50,height/2); //Call a new diver to be controlled by player
  timer = new CountDown(60); //Set variable for CountDown and set constructor to 60 seconds
  deathSplash = new DeathSplash(); //Set variable for DeathSplash
  screenText = new ScreenText(); //Set variable for ScreenText
  winSplash = new WinSplash(); //Set variable for WinSplash
}

void draw()
{
  if (keyPressed) //Set KeyEvent for level selection
   {
     if (key == '1') //If '1' is pressed, change 'currentLevel' to 1
     {
       currentLevel = 1;
     }
     
     else if (key == '2') //If '2' is pressed, change 'currentLevel' to 2
     {
       currentLevel = 2;
     }
     
     else if (key == '3') //If '3' is pressed, change 'currentLevel' to 3
     {
       currentLevel = 3;
     }
  }
  
  if (gameMode == PLAYING) //If 'gameMode' is equal to PLAYING then run the following code
  { 
    image(background, backgroundX, 0); //Call in background image
    image(background, backgroundX+background.width, 0); //Set X position of background image to length of the screen
    backgroundX -=4; //Set background to move by 240px per second.
    if (backgroundX == -background.width) //If backgroundX is equal to -background.width
    {
      backgroundX = 0; //Set backgroundX to 0
    }
  
  diver.render(); //Call in animation sequence for Diver
  screenText.render(); //Call in text for the screen
      
   if (currentLevel == 1) //If currentLevel is equal to '1'
   {
     spawnTimer++; //Increment spawnTimer
     if (spawnTimer % 60 == 0)
     {
       pearlList.add(new Pearl(width,(int)random(500))); //Add new Pearl to pearlList array
       mineList.add(new Mine(width,(int)random(500))); //Add new Mine to mineList array
     }
     
     if (spawnTimer % 240 == 0)
     {
       coinList.add(new Coin(width,(int)random(500))); //Add new Coin to coinList array
     }
   }
   
   if (currentLevel == 2)
   {
     spawnTimer++;
     if (spawnTimer % 45 == 0) //Collectables spawn more frequently as game level increases
     {
       pearlList.add(new Pearl(width,(int)random(500)));
       mineList.add(new Mine(width,(int)random(500)));
     }
     
     if (spawnTimer % 180 == 0)
     {
       coinList.add(new Coin(width,(int)random(500)));
     }
   }
   
   if (currentLevel == 3)
   {
     spawnTimer++;
     if (spawnTimer % 30 == 0) //Fastest possible spawn frequency
     {
       pearlList.add(new Pearl(width,(int)random(500)));
       mineList.add(new Mine(width,(int)random(500)));
     }
     
     if (spawnTimer % 120 == 0)
     {
       coinList.add(new Coin(width,(int)random(500)));
     }
   }
   
   for (int i=0; i<pearlList.size(); i++) //For int i is less than the size of pearlList array
   {
     Pearl currentPearl = pearlList.get(i); //Set currentPearl to the image of collectable
     currentPearl.update(); //Display currentPearl
    
     if (diver.crash(currentPearl)) //If diver crashes with currentPearl
     {
       pearlList.remove(currentPearl); //Remove currentPearl from pearlList array
       scoreCounter = scoreCounter + 10; //Add '10' to the scoreCounter
     }
   }
  
   for (int i=0; i<coinList.size(); i++)
   {
     Coin currentCoin = coinList.get(i);
     currentCoin.update();
    
     if (diver.crash(currentCoin))
     {
       coinList.remove(currentCoin);
       scoreCounter = scoreCounter + 50;
     }
   }
  
   for (int i=0; i<mineList.size(); i++)
   {
     Mine currentMine = mineList.get(i);
     currentMine.update();
    
     if (diver.crash(currentMine))
     {
       mineList.remove(currentMine); //Remove currentMine from mineList array
       livesCounter = livesCounter - 1; //Remove '1' from livesCounter
       if (livesCounter == 0) //If livesCounter is equal to 0
       {
         deathSplash.render(); //Load deathSplash screen
         gameMode = FINISHED; //Set game mode to finished
       }
     }
   }
   
   winSplashCounter++; //Increment winSplashCounter
   if (winSplashCounter == 3600) //If winSplashCounter is equal to 3600
   {
     winSplash.render(); //Load winSplash screen
     gameMode = FINISHED; //Set game mode to finshed
   }
 }
} 

void keyPressed() { //KeyPress event
  if (key == CODED) {
    if (keyCode == UP && diver.y > 0) //If 'UP' is pressed and diver Y position = 0
      diver.y -= 5; //Move Diver y positon -5
    else if (keyCode == DOWN && diver.y < height-80)
      diver.y += 5; //Move Diver y position +5
    else if (keyCode == LEFT && diver.x >0)
      diver.x -= 5; //Move Diver x positon -5
    else if (keyCode == RIGHT && diver.x < width-200)
      diver.x += 5; //Move Diver x positon +5
  }
}
