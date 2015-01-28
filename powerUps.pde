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
    
}
