class Satellite extends AstronomicalObject {
  
  Satellite(float r, float speed,PVector vector,String nombre,PImage texture){
    super(r,speed,vector,nombre,texture);
    
  }
  
  void show(){
    
    pushMatrix();
    rotateY(this.rotation+=this.speed);
    translate( vector.x, vector.y, vector.z);
    shape(this.obj);
    this.obj.rotateY(this.rotationY);
    popMatrix();
    
    if(perp){
      pushMatrix();
      rotateY(this.rotation);
      translate(vector.x, vector.y + this.radius + (this.radius/4), vector.z);
      rotateY(radians(-this.rotation+PI/2));
      textAlign(CENTER);
      text(this.name,0,-vector.y);
      popMatrix();
    }
    
  }
}
