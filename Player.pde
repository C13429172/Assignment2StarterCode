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
  color colour;
  
  /*--variables for jumping--*/
  //float direction; <- don't think this is necessary 
  PVector velocity;
  float jumpSpeed = 10;
  float walkSpeed = 4;
  //half a pixel per frame gravity
  float gravity = .5;
  float direction = 1;

  
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
    velocity = new PVector (0, 0);
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
    this.gravity = gravity;
    //this.ground = ground;
    this.jumpSpeed = jumpSpeed;
    this.walkSpeed = walkSpeed;
    this.direction = direction;
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
      println("Player " + index + " button 1");
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
      if(pos.y >= ground && (jump != false))
      {
        velocity.y = -jumpSpeed; 
      }
      
      //walk left and right???
      //velocity.x = walkSpeed * (left + right);
      
      //something weh here ble
     PVector nextPosition = new PVector (pos.x, pos.y);
     nextPosition.add(velocity);
     
     //check collision with edge of screen
     float offset = 10;
     if (nextPosition.x > offset && nextPosition.x < (width - offset))
     {
       pos.x = nextPosition.x;
     }
     if (nextPosition.y > offset && nextPosition.y < (height - offset))
     {
       pos.y = nextPosition.y;
     }
   
     //pos.x = nextPosition.x;
     //pos.y = nextPosition.y;
     
      
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
      pos.x -= 1;
      //keys[keyCode] = false;
    }    
    if (checkKey(right))
    {
      pos.x += 1;
      //keys[keyCode] = false;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
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
    fill(colour);    
    rect(pos.x, pos.y, 20, 20);
  }  
}
