class Planet
{
  //Mass and radius of planet wont change
  final float mass;
  final float radius;
  PVector position = new PVector(); 
  PVector velocity = new PVector(); 
  PVector acceleration = new PVector(); 
  color planetColor; 
  Planet(float r, float m, PVector initialVelocity, PVector initialPosition,  color pColor){ 
    this.radius = r; 
    this.mass = m; 
    this.velocity.set(initialVelocity); 
    this.position.set(initialPosition); 
    this.acceleration.set(0, 0);
    this.planetColor = pColor;
  }

//Apply force to the planet which affects the acceleration
  void applyForce(PVector force) 
  {
    PVector netForce = force.div(mass); //Force is mass * acceleration, so the planet will accelerate relative to the inverse of its mass
    acceleration.add(netForce);
  }

  //Call update function each draw loop/frame to change planet velocity and position
  void update() 
  {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0); //Acceleration will change
    
  }


  void draw()
  {
    stroke(255);
    fill(planetColor);
    circle(position.x, position.y, radius);
  }
}
