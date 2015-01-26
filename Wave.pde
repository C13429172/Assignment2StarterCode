void calcWave() 
{
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.04;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() 
{
  noStroke();
  fill(0,150,255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height+yvalues[x], 8, 8);
    updateWave(x*xspacing, height+yvalues[x]);
  }
}

//method to check collision with player
void updateWave(float x, float y)
{
  
  if(players.get(0).pos.x - 20 < x + 16 && players.get(0).pos.x + 20 > x && players.get(0).pos.y - 20 < y + 16 && players.get(0).pos.y + 20 > y)
 {
  println("collision");
  rect(x, y, 20, 20);
 } 
  
  /*
  for(int i = 0; i < players.size(); i++)
  {
     if(players.get(i).pos.x >  &&  > (players.get(i).pos.x + 20)) //20 is the size of player
    {
      if(players.get(i).pos.y == 350)
      {
        println("collision");
      }
    }
  }
  */
}
