class Star extends AstronomicalObject {
  
  Planet[] planets;
  
  Star(float r, float speed,PVector vector,String nombre,PImage texture, Planet... planets){
    super(r,speed,vector,nombre,texture);
    this.planets = planets;
  }
  
  void show(){
    pushMatrix();
    translate(vector.x, vector.y, vector.z);
    shape(this.obj);
    this.obj.rotateY(this.rotationY);
    for(Planet e : this.planets){
      e.show();
    }
    popMatrix();
    
    if(perp){
      pushMatrix();
      translate(vector.x, vector.y, vector.z);
      rotateY(PI/2);
      textAlign(CENTER);
      text(this.name,0,vector.y-this.radius-(this.radius/4));
      popMatrix();
    }
    
  }
}
