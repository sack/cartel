float value;
import java.util.Iterator;
String texte="Solution";
boolean consigne;
PImage img,img2;
ArrayList<Particle> particles;

void setup() {
  img = loadImage("cartel2.png");
  img2 = loadImage("cartel2bis.png");
  consigne = true;
  //orientation(LANDSCAPE);
  textAlign(CENTER, CENTER);
  textSize(36);
    particles = new ArrayList<Particle>();

  background(0);
}

void draw() {
  background(0);
  image(img2, 0, 0);
  
  tint(255, 255-value);  // Apply transparency without changing color
  image(img, 0, 0);
  

  if (consigne) {
//    fill(179,181,167, 255-value);
//    rect(0, 0, width, height);
    fill(0);
   // text("Frotter pour découvrir la solution", width/2, height-20);
     text("Frottez l’écran avec le doigt!", width/2, height-20);
  }
//  
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }  
  
}

void mouseDragged() {
  //particles.add(new Particle(new PVector(mouseX,mouseY)));
  consigne=false;
  value = value + 0.2;
  if (value > 254) {
    value = 254;
  }
println (value);  
  

  
  
}

void mouseReleased() {
  consigne=true;
  value = 0;
}

