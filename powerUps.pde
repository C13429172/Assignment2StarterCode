class powerUps
{
  float posX = random(0, width - PUlen);
  float posY = random(-height);
  
  void update()
  {
    posY = posY + powerSpeed;
    
    stroke(255,0,0);
    fill(0);
    rect(posX, posY, PUlen, PUlen);
    
    if(posY>height)
    {
      posX = random(width - PUlen);
      posY = random(-height);
      powerSpeed += 0.2;
    }
  }
  
  boolean colCheckPower(Player p)
  {
       if (p.pos.x < posX + PUlen && p.pos.x + p.len > posX && p.pos.y < posY + PUlen && p.pos.y - p.len < posY)
       {
          return true;
       }
      return false; 
     
   }
}
