public class Node {
  
  PVector pos, vel;
  boolean moving = false;
  float lifespan = 10.0;
  
  public Node(int x, int y) {
    pos = new PVector(x, y);
  }
  
  public void update() { 
    if(!moving) {
      if(random(1) >= 0.995) {
        vel = PVector.random2D();
        lifespan = random(1.0, 5.0);
        moving = true;
      }
    }
    
    if(moving && lifespan > 0) {
      pos.add(vel);
      lifespan -= 0.05;
    } else {
      moving = false;
    }
    
    show();
  }
  
  private void show() { 
    stroke(255, 100.0);
    strokeWeight(5);
    point(pos.x, pos.y);
  }
  
}