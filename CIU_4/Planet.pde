class Planet extends AstronomicalObject {
  
  AstronomicalObject[] sate;
  
  Planet(float r, float speed,PVector vector,String nombre,PImage texture, Satellite... sate){
    super(r,speed,vector,nombre,texture);
    this.sate = sate;
  }
  
  void show(){
    pushMatrix();
    rotateY(this.rotation+=this.speed); //<>//
    translate(vector.x, vector.y, vector.z);
    shape(this.obj);
    this.obj.rotateY(this.rotationY);
    if(this.sate != null){
      for(AstronomicalObject e : sate){
        e.show();
      }
    }
    popMatrix();
    
    pushMatrix();
    rotateY(this.rotation);
    translate(vector.x, vector.y - this.radius - (this.radius/4), vector.z);
    rotateY(-this.rotation+PI/2);
    textAlign(CENTER);
    text(this.name,0,-vector.y);
    popMatrix();
    
    /*
    pushMatrix();
    rotateY(this.rotation);
    translate(vector.x, 0, vector.z);
    rotateY(-this.rotation);
    textSize(this.scale*90);
    textAlign(CENTER);
    text(this.name,0,-vector.y);
    popMatrix();*/
  }
}
