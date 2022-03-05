abstract class AstronomicalObject {
 
  float speed;
  float rotation = 0.01;
  float rotationY = 0.01;
  float radius;
  PVector vector;
  PShape obj;
  float scale = 0.3;
  String name;
  
  AstronomicalObject(float r, float speed,PVector vector,String nombre,PImage texture){
    this.speed = speed;
    this.vector = vector;
    this.name = nombre;
    this.radius = r;
    noStroke();
    noFill();
    obj = createShape(SPHERE, this.radius);
    obj.setTexture(texture);
    endShape();
  }
  
  abstract void show();
  
  void changeVector(PVector n_vec){
    vector = n_vec;
  }
  
}
