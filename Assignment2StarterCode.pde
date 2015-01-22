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

void setup()
{
  size(500, 500);
  setUpPlayerControllers();
  
  createPlatform();
  
}

void draw()
{
  background(0);
  for(Player player:players)
  {
    player.update();
    player.display();
  }
  
  //createPlatform();
  for(Platform platform:platforms)
  {
    platform.display();
    platform.update();
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
//     pl.pLength = random(40,300);
     //pl.pos.y = 320;
     //pl.pos.x = 200;
     //float gap = 10;
     //set pLength here and pass it into yoke
     //float pLength = random(40,300);
    //platforms.add(new Platform((width/2), 320));//, pLength)); //pl.pos.x
    platforms.add(new Platform((width/2), 320));//, pLength));
    //platforms.add(new Platform(0, 320));//, pLength));
    //platforms.add(new Platform(0, 320));//, pLength));
    //platforms.add();
   //platforms.add(new Platform(300, 325));
   // platforms.add();
     
  //}

  
}
