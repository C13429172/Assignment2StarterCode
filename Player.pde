
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
  //float direction; <- don't think this is necessary 
  PVector velocity;
  float jumpSpeed = 10;
  float walkSpeed = 4;
  //half a pixel per frame gravity
  float gravity = .25;
  //PVector gravity;
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
      //println("Player " + index + " button 1");
      //only applies gravity if above ground
      if(pos.y < ground)
      {
        //pos.add(gravity);
        velocity.y += gravity;
        
      }
      else
      {
        velocity.y = 0;
      }
      
      //if on ground
      if(jump && pos.y >=ground)
      {
        //gravity.y = -.5; 
        //pos.sub(gravity);
        velocity.y = -jumpSpeed;
      }
      
      //walk left and right???
      //velocity.x = walkSpeed * (left + right);
     
     //something weh here ble
     PVector nextPosition = new PVector (pos.x, pos.y);
     nextPosition.add(velocity); //velocity
     /*
     //check collision with edge of screen
     float offset = 10;
     if (nextPosition.x > offset && nextPosition.x < (width - offset))
     {
       pos.x = nextPosition.x;
     }
     if (nextPosition.y > offset && nextPosition.y < (height - offset))
     {
       pos.y = nextPosition.y;
     }*/
   
     pos.x = nextPosition.x;
     pos.y = nextPosition.y;
     
      
      pushMatrix();
      
      translate(pos.x, pos.y);
      //display();
      
      
      popMatrix();
      /*if(millis() - currentTime >= cooldown) 
      {
        keys[keyCode] = false;
        currentTime = millis();
      }
      /*while(pos.y == ground)
      {
        keys[keyCode] = false;
        keys[keyCode] = true;
      }*/
    /*if (checkKey(up))
    {
      pos.y -= 1;
    }
    if (checkKey(down))
    {
      pos.y += 1;
    }*/
    
    if (checkKey(left))
    {
      pos.x -= 3;
      //keys[keyCode] = false;
    }    
    if (checkKey(right))
    {
      pos.x += 3;
      //keys[keyCode] = false;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
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
