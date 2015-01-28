void calcWave() 
{
  // Increment theta
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
  // wave draws with a circle at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height+yvalues[x], 8, 8);
    updateWave(x*xspacing, height+yvalues[x]);
  }
}

//method to check collision with player
void updateWave(float x, float y)
{
  if(players.get(0).pos.x - 20 < x  && players.get(0).pos.x + 20 > x && players.get(0).pos.y - 20 < y  && players.get(0).pos.y + 20 > y)
 {
  rect(x, y, 10, 10);
  
    players.get(0).pos.y++;
 } 

}
