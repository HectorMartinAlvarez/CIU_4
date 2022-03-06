class SpaceShip {
 
  float x;
  float y;
  float z;
  float an;
  PShape ship;
  
  SpaceShip(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
    ship = loadShape("./assets/spaceship/spaceship.obj");
  }
  
  void show(){
    pushMatrix();
    translate(x, y, z);
    rotateX(PI);
    rotateY(-PI/2);
    shape(ship);
    popMatrix();
  }
  
  void changeLocation(PVector vec) {
    this.x = vec.x;
    this.y = vec.y;
    this.z = vec.z;
  }
  
  void rotateShip(float angle){
    an += angle;
    pushMatrix();
    ship.rotateY(radians(angle));
    popMatrix();
  }
  
}
