Star sun;
Planet mercury, venus, earth, mars, jupiter, saturn, uranus, neptune;
Satellite moon, fobos, deimos;
SpaceShip ship;

PImage starsTexture;

float rotateCameraY = 0.0;
float camaraY = 0.0;
float distance = -2800;
float momentumF = 0;
float momentumB = 0;
float momentumL = 0;
float momentumR = 0;

boolean down = false;
boolean up = false;
boolean rigth = false;
boolean left = false;
boolean Forward = false;
boolean Backward = false;
boolean rotateR = false;
boolean rotateL = false;

boolean perp = false;

void setup(){
  
  size(1200,600,P3D);
  surface.setResizable(false);
  
  starsTexture = loadImage("./assets/2k_stars.jpg");
  PImage sunTexture = loadImage("./assets/2k_sun.jpg");
  PImage mercuryTexture = loadImage("./assets/2k_mercury.jpg");
  PImage venusTexture = loadImage("./assets/2k_venus.jpg");
  PImage earthTexture = loadImage("./assets/2k_earth.jpg");
  PImage marsTexture = loadImage("./assets/2k_mars.jpg");
  PImage jupiterTexture = loadImage("./assets/2k_jupiter.jpg");
  PImage saturnTexture = loadImage("./assets/2k_saturn.jpg");
  PImage uranusTexture = loadImage("./assets/2k_uranus.jpg");
  PImage neptuneTexture = loadImage("./assets/2k_neptune.jpg");
  PImage moonTexture = loadImage("./assets/2k_moon.jpg");
  PImage fobosTexture = loadImage("./assets/fobos.jpg");
  PImage deimosTexture = loadImage("./assets/deimos.jpg");
  
  moon = new Satellite(10.0, -0.025, new PVector(150, -30, 0),"Moon", moonTexture);
  fobos = new Satellite(10.0, -0.03, new PVector(100, 30, 0),"Phobos", fobosTexture);
  deimos = new Satellite(10.0, -0.025, new PVector(150, -30, 0),"Deimos", deimosTexture);
  
  mercury = new Planet(20.0, 0.01, new PVector(0, 0, 300),"Mercury", mercuryTexture,null);
  venus = new Planet(45.0, 0.0035, new PVector(0, 0, 600),"Venus", venusTexture,null);
  earth = new Planet(40.0, 0.003, new PVector(0, 0, 1100),"The Earth", earthTexture, moon);
  mars = new Planet(30.0, 0.0027, new PVector(0, 0, -1500),"Mars", marsTexture,fobos,deimos);
  jupiter = new Planet(80.0, 0.002, new PVector(0, 0, 1900),"Jupiter", jupiterTexture,null);
  saturn = new Planet(70.0, 0.0015, new PVector(0, 0, -2100),"Saturn", saturnTexture,null);
  uranus = new Planet(40.0, 0.0029, new PVector(0, 0, 2300),"Uranus", uranusTexture,null);
  neptune = new Planet(40.0, 0.0028, new PVector(0, 0, -2500),"Neptune", neptuneTexture,null);
  
  sun = new Star(200.0, 0.001, new PVector(500, 500, -1900),"Sun", sunTexture,mercury, venus, earth, mars, jupiter, saturn, uranus, neptune);
  
  ship = new SpaceShip(0,0,0);
}

void draw(){
  if(width == 1200){
    background(starsTexture);
  }else{
    background(0);
  }
  
  if(perp)cam();
  
  rotateY(radians(rotateCameraY));
  
  sun.show();
  ship.show();
  
  keyEvent();
  
  if(perp){
    perspective();
    pushMatrix();
    translate(0,camaraY,0);
    textAlign(LEFT);
    textSize(16);
    rotateY(PI/2);
    pushMatrix();
    rotateY(-radians(rotateCameraY));
    text("W - Move Forward",-440,-200,-300);
    text("S - Move Backward",-440,-180,-300);
    text("A - Move Right",-440,-160,-300);
    text("D - Move Left",-440,-140,-300);
    text("Q - Rotate Right",-440,-120,-300);
    text("E - Rotate Left",-440,-100,-300);
    text("SPACE - Move Up",-440,-80,-300);
    text("Ctrl - Move Down",-440,-60,-300);
    textAlign(RIGHT);
    text("R - Reset Position",440,-200,-300);
    text("C - Change Perspective",440,-180,-300);
    popMatrix();
    popMatrix();
  }else{
    camera();
    textAlign(LEFT);
    textSize(20);
    text("C - Change Perspective",width-1180,height-60);
    text("ESC - Exit",width-1180,height-20); 
  }
  momentum();
}

void cam(){
    beginCamera();
    camera(100, camaraY, 0, 0, camaraY, 0, 0, 1, 0);
    endCamera();
}

void momentum(){
  
  sun.changeVector(new PVector(sun.vector.x+(momentumF*cos(radians(rotateCameraY))),sun.vector.y,sun.vector.z+(momentumF*sin(radians(rotateCameraY)))));
  sun.changeVector(new PVector(sun.vector.x-(momentumB*cos(radians(rotateCameraY))),sun.vector.y,sun.vector.z-(momentumB*sin(radians(rotateCameraY)))));
  if(radians(rotateCameraY) >= 0){
    sun.changeVector(new PVector(sun.vector.x+(momentumR*sin(radians(rotateCameraY))),sun.vector.y,sun.vector.z-(momentumR*cos(radians(rotateCameraY)))));
  }else{
    sun.changeVector(new PVector(sun.vector.x-(momentumR*abs(sin(radians(rotateCameraY)))),sun.vector.y,sun.vector.z-(momentumR*cos(radians(rotateCameraY)))));
  }
  if(radians(rotateCameraY) >= 0){
    sun.changeVector(new PVector(sun.vector.x-(momentumL*sin(radians(rotateCameraY))),sun.vector.y,sun.vector.z+(momentumL*cos(radians(rotateCameraY)))));
  }else{
    sun.changeVector(new PVector(sun.vector.x+(momentumL*abs(sin(radians(rotateCameraY)))),sun.vector.y,sun.vector.z+(momentumL*cos(radians(rotateCameraY)))));
  }
}

void keyEvent(){
  if(down){
    camaraY += 10;
    ship.changeLocation(new PVector(0,ship.y+10,0));
  }
  if(up){
    camaraY -= 10;
    ship.changeLocation(new PVector(0,ship.y-10,0));
  }
  if(rigth){
    if(radians(rotateCameraY) >= 0){
      sun.changeVector(new PVector(sun.vector.x+(10*sin(radians(rotateCameraY))),sun.vector.y,sun.vector.z-(10*cos(radians(rotateCameraY)))));
    }else{
      sun.changeVector(new PVector(sun.vector.x-(10*abs(sin(radians(rotateCameraY)))),sun.vector.y,sun.vector.z-(10*cos(radians(rotateCameraY)))));
    }
    
  }
  if(left){
    if(radians(rotateCameraY) >= 0){
      sun.changeVector(new PVector(sun.vector.x-(10*sin(radians(rotateCameraY))),sun.vector.y,sun.vector.z+(10*cos(radians(rotateCameraY)))));
    }else{
      sun.changeVector(new PVector(sun.vector.x+(10*abs(sin(radians(rotateCameraY)))),sun.vector.y,sun.vector.z+(10*cos(radians(rotateCameraY)))));
    }
  }
  if(rotateR){
    rotateCameraY -= 0.5;
    ship.rotateShip(-0.5);
  }
  if(rotateL){
    rotateCameraY += 0.5;
    ship.rotateShip(0.5);
    
  }
  if(Backward){
    sun.changeVector(new PVector(sun.vector.x-(10*cos(radians(rotateCameraY))),sun.vector.y,sun.vector.z-(10*sin(radians(rotateCameraY)))));
  }
  if(Forward){
    sun.changeVector(new PVector(sun.vector.x+(10*cos(radians(rotateCameraY))),sun.vector.y,sun.vector.z+(10*sin(radians(rotateCameraY)))));
  }
}

void keyPressed(){
  if(perp){
    switch(keyCode){
      case 'A':
        rigth = true;
        momentumF = 0;
        momentumB = 0;  
        momentumL = 0;  
        break;
      case 'S':
        Backward = true;
        momentumF = 0;
        momentumR = 0;  
        momentumL = 0;  
        break;
      case 'W':
        Forward = true;
        momentumB = 0;
        momentumR = 0;  
        momentumL = 0;  
        break;
      case 'D':
        left = true;
        momentumF = 0;
        momentumR = 0;  
        momentumB = 0;  
        break;
      case 'R':
        sun.changeVector(new PVector(distance,0,0));
        rotateY(-rotateCameraY);
        ship.rotateShip(-rotateCameraY);
        ship.changeLocation(new PVector(0,160,0));
        rotateCameraY = 0;
        camaraY = 0;
        momentumF = 0;
        momentumB = 0;  
        momentumL = 0;
        momentumR = 0;  
        break;
      case 'E':
        rotateL = true;
        break;
      case 'Q':
        rotateR = true;
        break;
      case 32:
        up = true;
        break;
      case 17:
        down = true;
        break;
    }
  }
}

void keyReleased(){
  switch(keyCode){
    case 'A':
      rigth = false;
      momentumR = 2;
      break;
    case 'S':
      Backward = false;
      momentumB = 2;
      break;
    case 'W':
      Forward = false;
      momentumF = 2;
      break;
    case 'D':
      left = false;
      momentumL = 2;
      break;
    case 'C':
      perp = !perp;
      if(perp){
        sun.changeVector(new PVector(distance,0,0));
        rotateY(-rotateCameraY);
        ship.rotateShip(-rotateCameraY);
        ship.changeLocation(new PVector(0,160,0));
        rotateCameraY = 0;
        camaraY = 0;
        momentumF = 0;
        momentumB = 0;  
        momentumL = 0;
        momentumR = 0;  
      }else{
        sun.changeVector(new PVector(500, 500, -1900));
        ship.changeLocation(new PVector(0,0,0));
        ship.rotateShip(-rotateCameraY);
        rotateY(-rotateCameraY);
        rotateCameraY = 0;
        momentumF = 0;
        momentumB = 0;  
        momentumL = 0;
        momentumR = 0;  
      }
      break;
    case 'E':
      rotateL = false;
      break;
    case 'Q':
      rotateR = false;
      break;  
    case 32:
      up = false;
      break;
    case 17:
      down = false;
      break;
  }
}
