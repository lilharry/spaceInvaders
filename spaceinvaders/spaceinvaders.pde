import java.util.ArrayList;

//bullets
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Bullet> toRemove = new ArrayList<Bullet>();
int power;
int aliensPerRow;
int currentCount;

ArrayList<Alien> aliens = new ArrayList<Alien>();
ArrayList<Alien> dead = new ArrayList<Alien>();


boolean left, right, shoot;

int shipX, shipY;

int shipL, shipW;
int alienL, alienW;
int level;
int shipMoveSpeed;

void setup() {
  size(800, 900);
  background(0, 0, 0);

  shipL = 50; 
  shipW = 50;

  shipX = width/2 - shipW / 2;
  shipY = int(0.9 * height);

  alienL = 50; 
  alienW = 50;

  aliensPerRow = 10;
  shipMoveSpeed = 10;

  power = 1;
  level = 1;
  currentCount =0;

}

void draw() {  
  clear();
  if (aliens.isEmpty()) {
    generateAliens();
  }

  rect(shipX, shipY, shipL, shipW);
  if (left && shipX > 0) {
    shipX-=shipMoveSpeed;
  }
  
  if (right && shipX < width - 50) {
    shipX+=shipMoveSpeed;
  }
  
  if (shoot) {
    if (frameCount - currentCount > 40){
      currentCount = frameCount;
      bullets.add(new Bullet(shipX + shipL/2, shipY, power));
    }

  }
  
  updateAliens();
  updateBullets();
}


void generateAliens() {
  int alienS = 65;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 10; j++) { 
      aliens.add(new Alien(-50 + -alienS*j, 10 + alienS*i, width/aliensPerRow + alienS*(aliensPerRow-j) - alienS, 10 + alienS*i, level));
      System.out.printf("x = %d\tshouldBe = %d\ny=%d\tshouldBe=%d\n",-50 + -alienS*j,10 + alienS*i, width/10 + alienS*(j),10 + alienS*i, level);
    }
  }
}


void updateAliens() {
  for (Alien a : aliens){
    rect(a.getX(),a.getY(),alienL,alienW);
    a.move(2);
    if (a.getHealth() <= 0){
      dead.add(a);
    }
  }
  aliens.removeAll(dead);
  dead.clear();
}

void updateBullets() {

  for (Bullet b : bullets) {
    rect(b.getX(), b.getY(), 5, 10);
    b.move();
    if (b.getY() < 30) {
      toRemove.add(b);
    }
    for (Alien a : aliens){
      if (a.getX() < b.getX() && a.getX() + alienL > b.getX() && a.getY() < b.getY() && a.getY() + alienW > b.getY() ){
          toRemove.add(b);
          a.takeDamage(power);
          
      }
    }
  }
  bullets.removeAll(toRemove);
  toRemove.clear();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      left = true;
    } else if (keyCode == RIGHT) {
      right = true;
    }
  }
  if (key == ' ') {
    shoot = true;
  }
}


void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      left = false;
    } else if (keyCode == RIGHT) {
      right = false;
    }
  }
  if (key == ' ') {
    shoot = false;
  }
}
