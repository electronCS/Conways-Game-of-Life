grid g;
boolean start = false;
int count = 0;
void setup()
{
  size(750, 750);
  g = new grid(50);
}

void draw()
{
  
  int factor = width/g.len;
  if (mousePressed)
  {
    if(mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0)
      g.grid[mouseX/factor][mouseY/factor] = true;
  }
  if (keyPressed)
  {
    if (key == 'o')
      start = false;
    else if (key == 'p')
      start = true;
  }
    
    
  for (int x = 0; x < g.len; x++)
  {
    for (int y = 0; y < g.len; y++)
    {
      if (g.grid[x][y])
        fill (250);
      else
        fill (50);
      rect(factor*x, factor*y, factor, factor);
    }
  }
  count++;
  if (start && count % 2 == 0)
  {
    int neighbors = 0;
    grid temp = new grid(100);
    for (int x = 1; x < g.len - 1; x++)
    {
      for (int y = 1; y < g.len - 1; y++)
      {
        neighbors = 0;
        if (g.grid[x+1][y+1])
          neighbors++;
        if (g.grid[x+1][y-1])
          neighbors++;
        if (g.grid[x-1][y+1])
          neighbors++;
        if (g.grid[x-1][y-1])
          neighbors++;
        if (g.grid[x+1][y])
          neighbors++;
        if (g.grid[x-1][y])
          neighbors++;
        if (g.grid[x][y+1])
          neighbors++;
        if (g.grid[x][y-1])
          neighbors++;
          
          
        if (g.grid[x][y] && neighbors < 2)
          temp.grid[x][y] = false;
        else if (g.grid[x][y] && (neighbors == 2 || neighbors == 3))
          temp.grid[x][y] = true;
        else if (g.grid[x][y] && neighbors > 3)
          temp.grid[x][y] = false;
        else if (!g.grid[x][y] && neighbors == 3)
          temp.grid[x][y] = true;
        else
          temp.grid[x][y] = g.grid[x][y];
      }
    }
    for (int x = 1; x < g.len - 1; x++)
    {
      for (int y = 1; y < g.len - 1; y++)
      {
        g.grid[x][y] = temp.grid[x][y];
      }
    }
  }
  
}