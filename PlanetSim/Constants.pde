final float UNIVERSAL_GRAVITATIONAL_CONSTANT = 10;
final int SCREENX = 1000;
final int SCREENY = 1000;


PVector calculateGravitationalForce(Planet onp1, Planet p2)
{
  //onp1 refers to the planet we wish to apply the force to
  //When searching for a way to calculate the force between and on these two objects, came across this exact problem explained in Khan academy! Written in processing.js and all! https://www.khanacademy.org/computing/computer-programming/programming-natural-simulations/programming-forces/a/gravitational-attraction
  float mass1 = onp1.mass;
  float mass2 = p2.mass;
  PVector force = PVector.sub(onp1.position, p2.position);
  float distance = force.mag();
  force.normalize(); // Set force vector to 1 to be able to set the force applied easily
  //Technically we shouldn't need to multiply by mass1 as we divide by this in the applyForce function in the Planet class to get acceleration. For ease of understanding, keeping this here
  float lenOfVector = (UNIVERSAL_GRAVITATIONAL_CONSTANT * mass1 * mass2)/sq(distance);
  force.mult(lenOfVector);

  return force;
}


void updatePlanetForces(ArrayList<Planet> planets)
{
  for(int planet1Index = 0; planet1Index < planets.size(); planet1Index++)
  {
    for(int otherPlanetIndex = planet1Index+1; otherPlanetIndex < planets.size(); otherPlanetIndex++) // Force is the same on both planets
    {
      PVector planet1Force = calculateGravitationalForce(planets.get(planet1Index), planets.get(otherPlanetIndex));
      PVector planet2Force = calculateGravitationalForce(planets.get(otherPlanetIndex), planets.get(planet1Index));
      planets.get(planet1Index).applyForce(planet2Force);
      planets.get(otherPlanetIndex).applyForce(planet1Force);
    }
  }
}
