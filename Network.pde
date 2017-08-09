ArrayList<Node> nodes;

float longest = 0;

public void setup() {
  nodes = new ArrayList<Node>();
  
  for(int i = 0; i < 5; i++) {
    nodes.add(new Node((int) random(0, 400), (int) random(0, 300)));
  }
  
  size(400, 300);
}

public void draw() {
  background(51);
  
  for(int i = 0; i < nodes.size(); i++) {
    nodes.get(i).update();
  }
  
  for(int i = 0; i < nodes.size(); i++) {
    for(int k = i + 1; k < nodes.size(); k++) {
      
      if(distance(nodes.get(i).pos.x, nodes.get(i).pos.y, nodes.get(k).pos.x, nodes.get(k).pos.y) > longest)
        longest = distance(nodes.get(i).pos.x, nodes.get(i).pos.y, nodes.get(k).pos.x, nodes.get(k).pos.y);
        
      stroke(255, longest * 50/distance(nodes.get(i).pos.x, nodes.get(i).pos.y, nodes.get(k).pos.x, nodes.get(k).pos.y));
      strokeWeight(1);
      line(nodes.get(i).pos.x, nodes.get(i).pos.y, nodes.get(k).pos.x, nodes.get(k).pos.y);
    }
  }
}

public void mouseClicked() {
  for(int i = 0; i < nodes.size(); i++) {
    if(distance(mouseX, mouseY, nodes.get(i).pos.x, nodes.get(i).pos.y) <= 40) {
      nodes.get(i).vel = new PVector((int) (3 * Math.cos(angle(mouseX, mouseY, (int) nodes.get(i).pos.x, (int) nodes.get(i).pos.y))), 
        (int) (3 * Math.sin(angle(mouseX, mouseY, (int) nodes.get(i).pos.x, (int) nodes.get(i).pos.y))));
      nodes.get(i).lifespan = 2.0;
      nodes.get(i).moving = true;
    }
  }
}

private float distance(float x1, float y1, float x2, float y2) {
  return (float) Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
}

private float angle(int x1, int y1, int x2, int y2) {
  if(x1 == x2 && y1 > y2) {
    return 270;
  } else if(x1 == x2 && y1 < y2) {
    return 90;
  } else if(x1 > x2 && y1 == y2) {
    return 180;
  } else if(x1 < x2 && y1 == y2) {
    return 0;
  } else if(x1 > x2 && y1 > y2) {
    return (float) Math.toDegrees(Math.atan((y2 - y1)/(x2 - x1))) + 180;
  } else if(x1 > x2 && y1 < y2) {
    return (float) Math.toDegrees(Math.atan((y2 - y1)/(x2 - x1))) + 180;
  } else if(x1 < x2 && y1 > y2) {
    return (float) Math.toDegrees(Math.atan((y2 - y1)/(x2 - x1))) + 360;
  } else if(x1 < x2 && y1 < y2) {
    return (float) Math.toDegrees(Math.atan((y2 - y1)/(x2 - x1)));
  } else {
    return -1;
  }
}