// https://www.solarsystemscope.com/textures/
// http://www.planetaryvisions.com

Star sun;
Planet mercury, venus, earth, mars, jupiter, saturn, uranus, neptune;
Satellite moon, fobos, deimos;
SpaceShip ship;


PImage starsTexture;

float scale = 1.0;
float rotateCameraY = 0.0;
float camaraY = 0.0;
float distance = -2800;

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
  
  sun = new Star(200.0, 0.001, new PVector(-200, 0, -1500),"Sun", sunTexture,mercury, venus, earth, mars, jupiter, saturn, uranus, neptune);
  
  ship = new SpaceShip(+200, 0, -1500);
}

void draw(){
  background(0);
  if(perp)cam();

  rotateY(radians(rotateCameraY));
  
  sun.show();
  ship.show();
  
  keyEvent();
  
  if(perp){
    perspective();
  }else{
    camera();
    textAlign(LEFT);
    textSize(20);
    text("C - Change Perspective",width-1180,height-60);
    text("ESC - Exit",width-1180,height-20);
    textAlign(RIGHT);
    text("SpaceShip Controls",width-10,height-300);
    text("R - Reset Position",width-10,height-270);
    text("W - Move Forward",width-10,height-240);
    text("S - Move Backward",width-10,height-210);
    text("A - Move Right",width-10,height-180);
    text("D - Move Left",width-10,height-150);
    text("Q - Rotate Right",width-10,height-120);
    text("E - Rotate Left",width-10,height-90);
    text("SPACE - Move Up",width-10,height-60);
    text("Ctrl - Move Down",width - 10,height-30);
  }
}

void cam(){
    beginCamera();
    camera(100, camaraY, 0, 0, camaraY, 0, 0, 1, 0);
    endCamera();
  }

void keyEvent(){
  if(down){
    camaraY += 10;
  }
  if(up){
    camaraY -= 10;
  }
  if(rigth){
    if(radians(rotateCameraY) >= 0){
      sun.changeVector(new PVector(sun.vector.x+(10*sin(radians(rotateCameraY))),sun.vector.y,sun.vector.z-(10*cos(radians(rotateCameraY)))));
    }else{
      sun.changeVector(new PVector(sun.vector.x+(10*abs(sin(radians(rotateCameraY)))),sun.vector.y,sun.vector.z+(10*cos(radians(rotateCameraY)))));
    }
    
  }
  if(left){
    if(radians(rotateCameraY) >= 0){
      sun.changeVector(new PVector(sun.vector.x-(10*sin(radians(rotateCameraY))),sun.vector.y,sun.vector.z+(10*cos(radians(rotateCameraY)))));
    }else{
      sun.changeVector(new PVector(sun.vector.x-(10*abs(sin(radians(rotateCameraY)))),sun.vector.y,sun.vector.z-(10*cos(radians(rotateCameraY)))));
    }
  }
  if(rotateR){
    rotateCameraY -= 0.2;
  }
  if(rotateL){
    rotateCameraY += 0.2;
    
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
        break;
      case 'S':
        Backward = true;
        break;
      case 'W':
        Forward = true;
        break;
      case 'D':
        left = true;
        break;
      case 'R':
        sun.changeVector(new PVector(distance,0,0));
        rotateY(-rotateCameraY);
        rotateCameraY = 0;
        camaraY = 0;
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
      break;
    case 'S':
      Backward = false;
      break;
    case 'W':
      Forward = false;
      break;
    case 'D':
      left = false;
      break;
    case 'C':
      perp = !perp;
      if(perp){
        sun.changeVector(new PVector(distance,0,0));
        ship.changeLocation(new PVector(20,150,0));
      }else{
        sun.changeVector(new PVector(-200, 0, -1500));
        ship.changeLocation(new PVector(200, 0, -1500));
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
