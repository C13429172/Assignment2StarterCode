
class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  int len=20;
  color colour;
  
  /*--variables for jumping--*/
  PVector velocity;
  float jumpSpeed = 10;
  float walkSpeed = 4;
  //half a pixel per frame gravity
  float gravity = .25;
  float direction = 1;

  
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
    velocity = new PVector (0, 0);                                                                      
    //gravity = new PVector (0, .5);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
      //only applies gravity if above ground
      if(pos.y < ground)
      {
        velocity.y += gravity;
        
      }
      else
      {
        velocity.y = 0;
      }
      
      //if on ground
      if(jump && pos.y >=ground)
      {
        velocity.y = -jumpSpeed;
      }
    
     pos.add(velocity);
      
      pushMatrix();
      
      translate(pos.x, pos.y);
      
      
      popMatrix();
    
    if (checkKey(left))
    {
      pos.x -= 3;
    }    
    if (checkKey(right))
    {
      pos.x += 3;
    }
    if (checkKey(start))
    {
      startScreen = false;
    }
    if (checkKey(button1))
    {
      jump = false;
      if(millis() - currentTime >= cooldown) 
      {
        jump = true;
        currentTime = millis();
      }
      
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }    
  }
  
  void display()
  {    
    stroke(colour);
    fill(0);    
    rect(pos.x, pos.y, len, len);
  }  
}
