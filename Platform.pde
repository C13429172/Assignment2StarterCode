class Platform
{
  PVector pos;
  color colour;
  float pLength = random(50,70);
  float nextX;
  boolean alive;
  
   Platform()
  {
     //pos.x = x;
     //pos.y = y;
     pos = new PVector(); // width/2 and height/2
     pos.x = width;
     pos.y = 320;
  }
  
 Platform(float x, float y)//, float l)
  {
    pos = new PVector();
    pos.x = x;
    pos.y = y;
    alive = true;
    
    //this.pLength = l;
    float pLength = random(30,60);
    //this.colour = colour;
  }
  
  void update()
  {
    if(pos.x > 0)
    {
      pos.x--;
    }
    else
    {
      alive = false;
    }
    //pLength--;
    
    //nextX = pos.x + pLength + 20;
    
  }
  
  void display()
  {
    //float pLength = random(50,70);
    stroke(255);
    line(pos.x, pos.y, pos.x + pLength, pos.y);
     //pos.x = pos.x + pLength + 10; //10 is gap, make variable
  }
}
