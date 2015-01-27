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
int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 200.0;  // Height of wave
float period = 200.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup()
{
  size(500, 500);
  setUpPlayerControllers();
  
  createPlatform();
  
  //variables to create the wave
   w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  
  //setup first few platforms for players to start on
  //platforms.add(new Platform(80,320,60));
  //platforms.add(new Platform(100,320,50));
  platforms.add(new Platform(350,320,100));
  platforms.add(new Platform(150,320,100));
  
}

void draw()
{
  background(0);
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
  renderWave();
  //updateWave();
  createPlatform();
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
  //.. Others to follow
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
    p.pos.x = x;
    p.pos.y = 300;
   players.add(p);         
  }
 /*
  for(int j = 0 ; j < 5 ; j++)
  {
     pl = new Platform(200,320);
     pl.pLength = random(40,300);
     pl.pos.y = 320;
     //pl.pos.x = 200;
     
    //platforms.add(new Platform(200,320)); //pl.pos.x
    platforms.add();
   //platforms.add(new Platform(300, 325));
   // platforms.add();
     
  }
*/
}

void createPlatform()
{
   
  //for(int j = 0 ; j < 5 ; j++)
  //{
//     pl = new Platform();
     //pl.pLength = random(40,300);
     //pl.pos.y = 320;
     //pl.pos.x = 200;
     //float gap = 10;
     //set pLength here and pass it into yoke
     float pLength = random(80,150);
    //platforms.add(new Platform((width/2), 320));//, pLength)); //pl.pos.x
    //float time = random(120,180);
    if(frameCount % 180==0)
    {
      platforms.add(new Platform(width,320,pLength));//, pLength));
    }
    float randLen = random(50,100);
     if(frameCount % 540==0)
    {
      platforms.add(new Platform(width+randLen,270,pLength));//, pLength));
    }
    //platforms.add(new Platform(0, 320));//, pLength));
    //platforms.add(new Platform(0, 320));//, pLength));
    //platforms.add();
   //platforms.add(new Platform(300, 325));
   // platforms.add();
     
  //}

  
}
