class Platform
{
  PVector pos;
  color colour;
  float pLength = random(50,70);
  float nextX;
  boolean alive;
  
   Platform()
  {
     pos = new PVector(); // width/2 and height/2
     pos.x = width;
     pos.y = 320;
  }
  
 Platform(float x, float y, float pLength)//, float l)
  {
    pos = new PVector();
    pos.x = x;
    pos.y = y;
    alive = true;
    this.pLength = pLength;
  }
  

  
  void update()
  {
    if(pos.x + pLength > 0)
    {
      pos.x--;
    }
    else
    {
      alive = false;
    }
    
  }
  
  void display()
  {
    stroke(255);
    line(pos.x, pos.y, pos.x + pLength, pos.y);
  }
  
  boolean collisionCheck(Player p)
  {
        if(p.pos.x <= pos.x +pLength && p.pos.x + 20 >= pos.x && p.pos.y <= pos.y && p.pos.y+p.len >= pos.y) 
        {
            //println("line collision");
      
            return true;
        }
        return false;
  }
}
