class Platform
{
  PVector pos;
  color colour;
  float pLength;
  float nextX;
  
   Platform()
  {
     //pos.x = x;
     //pos.y = y;
     pos = new PVector(width / 2, height / 2);
  }
  
 Platform(float x, float y)
  {
    pos = new PVector();
    pos.x = x;
    pos.y = y;
    //this.colour = colour;
  }
  
  void update()
  {
    pos.x--;
    //pLength--;
    
  }
  
  void display()
  {
    stroke(0,0,255);
    line(pos.x,pos.y,pos.x+pLength,pos.y);
  }
}
