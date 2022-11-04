Particles[] bob = new Particles[1500];
PImage flower;

void setup()
{
  size(600,600);
  flower = loadImage("lotus.png");

  for(int i = 0; i < 500; i++)
  {
    bob[i] = new Copycat();
  }
  for(int i = 500; i < 1000; i++)
  {
    bob[i] = new OddBallParticles();
  }
  for(int i = 1000; i < bob.length; i++)
  {
    bob[i] = new Particles();
  }
}
void draw()
{
  background(0);
  for(int i = 0; i < bob.length; i++)
  {
    bob[i].show();
    bob[i].move();
  }
  image(flower,280,280,50,50);
}

class Particles
{
  double myX, myY, mySpeed, myAngle;
  int mySize;
  color myColor;
  
  Particles()
  {
    myAngle = Math.random()*(Math.PI*2);
    myX = 300;
    myY = 300;
    mySize = (int)(Math.random()*5)+8;
    mySpeed = ((mySize*2)/2);//2;
   
      myColor = color(#D87FD0);
  }
      
  
  void move()
  {
    myX += Math.sin(myAngle)*mySpeed;
    myY += Math.cos(myAngle)*mySpeed;
    if(myX > 700 || myY > 700 || myX < 0 || myY < 0){
      myX = 300;
      myY = 300;
    }
  }
  
  void show()
  {
    fill(myColor);
    stroke(255, 50);
    strokeWeight(6);
    ellipse((float)myX, (float)myY, mySize,mySize);
    
  }
}

class Copycat extends Particles{
  //int mySpeedd;
  Copycat(){
    super();
    //mySpeedd = 2;
    myColor = color(#9C59B4);//#B1EAF7);
  }
   void move()
  {
    super.move();
    if(myX > 700 || myY > 700 || myX < 0 || myY < 0){
      myX = 300;
      myY = 300;
    }
  }
  void show()
  {
    super.show();
  }
}

class OddBallParticles extends Particles{
  OddBallParticles(){
    super();
    mySize = 15;//(int)(Math.random()*5)+8;
    mySpeed = 3;
    myColor = color(255);
  }
  void move()
  {
    for(int i = 0; i < 97; i++)
    {
      myAngle+=i;
      myX+=Math.cos(myAngle)*mySpeed;
      myY+=Math.sin(myAngle)*mySpeed;
    }
  }
  void show()
  {
    fill(myColor, 50);
    stroke(#5A1A71, 90);
    strokeWeight(5);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}
