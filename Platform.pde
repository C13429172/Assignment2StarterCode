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
  
 Platform(float x, float y, float pLength)//, float l)
  {
    pos = new PVector();
    pos.x = x;
    pos.y = y;
    alive = true;
    this.pLength = pLength;
    
    //this.pLength = l;
    //float pLength = random(30,60);
    //this.colour = colour;
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
    
   if(players.get(0).pos.x < pos.x +pLength && players.get(0).pos.x - 20 > pos.x && players.get(0).pos.y == 300)// && players.get(0).pos.y + 20 ==340)
    {
      println("line collision");
      players.get(0).pos.x--;
    }
    else
    {
      //players.get(0).velocity.y += players.get(0).gravity;
      //println("fall");
      //players.get(0).pos.y++;
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
