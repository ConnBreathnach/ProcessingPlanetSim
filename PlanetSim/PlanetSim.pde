ArrayList<Planet> thePlanets;
void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  thePlanets = new ArrayList<Planet>();
  thePlanets.add(new Planet(50, 100, new PVector(0, 0), new PVector(SCREENX/4, SCREENY/4), color(170, 0, 170)));
  thePlanets.add(new Planet(5, 7.5, new PVector(1, 0), new PVector(SCREENX/2, SCREENY/2), color(220, 220, 235)));
}

void draw() //<>//
{
  background(0, 0, 0);
  updateAndDrawPlanets(thePlanets);
}


void updateAndDrawPlanets(ArrayList<Planet> planets)
{
  updatePlanetForces(planets);
  for(int i = 0; i < planets.size(); i++)
  {
    planets.get(i).update();
    planets.get(i).draw();
  }
}
