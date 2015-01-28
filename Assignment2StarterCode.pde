/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Platform> platforms = new ArrayList<Platform>();
boolean[] keys = new boolean[526];
boolean jump = false;
Platform pl;

//y corodinates of ground for collision
  float ground = 300;
  float cooldown = 800; 
  float currentTime = millis();
  
//global variables for wave
int xspacing = 1;   // spacing between each circle
int w;              // width of wave

float theta = 0.0;  // start angle at 0
float amplitude = 200.0;  // Height of wave
float period = 200.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

//sprites
PImage logo;
PImage saw;
float counter=0.0;

int g = 0;
int h = 0;
int PUlen = 25;

//audio things
import ddf.minim.*;
AudioPlayer track;
Minim minim;
boolean music = false;

boolean startScreen= true;
boolean endScreen=false;


powerUps power = new powerUps();
//speeds for each object
float platSpeed;
float playerSpeed;
float powerSpeed = 2;
int score = 0;

void setup()
{
  size(500, 500);
  setUpPlayerControllers();
  
  //loading and resizing images
  logo = loadImage("startImage.png");
  logo.resize(400, 250);
  
  //loading and resizing saw image
  saw = loadImage("saw.png");
  saw.resize(100,100);

  
  createPlatform();
  
  
  //variables to create the wave
   w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  
  //setup first few platforms for players to start on
  platforms.add(new Platform(350,320,100));
  platforms.add(new Platform(200,320,100));
  
  //reading in the mp3 file
  minim = new Minim(this);
  track = minim.loadFile("wipeOut.mp3");
  
}

void draw()
{
  background(0);
  //loops track 
  if(music == false || track.isPlaying() == false)
  {
    track.rewind();
    track.play();
    music=true;
  }
  
  if(startScreen)
  {
   
    image(logo,75,100);
    text("Press START or Q to play ", 150, 250);
    if(checkKey(players.get(0).start))
    {
       startScreen = false;
    }
    
  }
  else if(endScreen)
  {
    textSize(64);
    text("GAME OVER", 100,height/2);
    textSize(32);
    text("Your score: "+ score, 100, height/2 + 50);
  }
  else 
  {
     pushMatrix();
    counter++;
    translate(0, 270);
    rotate(counter*TWO_PI/360);
    translate(-saw.width/2, -saw.height/2);
    image(saw, 0, 0);
    popMatrix();
    
    if(frameCount % 10 ==0)
    {
      score++;
    }
    
    for(Player player:players)
    {
      player.update();
      player.display();
    }
  
  
    for(int i = 0; i < platforms.size(); i++)
    {
      platforms.get(i).display();
      platforms.get(i).update();
    
      if(!platforms.get(i).alive)
      {
        platforms.remove(i);
      }
    }

    calcWave();
    renderWave();// also calls update wave
    createPlatform();
    
    Player p = players.get(0);
    for(int i=0; i<platforms.size();i++)
    {
      Platform plat = platforms.get(i);
      {
        if(plat.collisionCheck(p))
        {
          players.get(0).pos.x--;
          players.get(0).pos.y = plat.pos.y - players.get(0).len;
          players.get(0).velocity.y =0;
        }
        else
        {
           players.get(0).pos.y++;
        }
      }
    }
    
    power.update();
    if(power.colCheckPower(p))
    {
      score += 10;
    }
    fill(255);
    text("Score: " +score, 250, 20);
    
    //if player falls off screen, game over
    if(players.get(0).pos.y > 400)
    {
      endScreen = true;
    }
    
    if(players.get(0).pos.x < 25)
    {
      endScreen = true;
    }
  }
  
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < 1; i ++)  //i < children.length
  {
    XML playerXML = children[i];
    Player p = new Player(i, color(random(0, 255), random(0, 255), random(0, 255)), playerXML);
    int x = (i + 1) * gap;
    p.pos.x = 250;
    p.pos.y = 300;
     players.add(p); 
  }
}

void createPlatform()
{
     //set pLength here and pass it into platform class
     float pLength = random(80,150);
     
    if(frameCount % 180==0)
    {
      platforms.add(new Platform(width,320,pLength));//, pLength));
    }
    float randLen = random(50,100);
     if(frameCount % 540==0)
    {
      platforms.add(new Platform(width+randLen,270,pLength));//, pLength));
    }
     
  //}

  
}
