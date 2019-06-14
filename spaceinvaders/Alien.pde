public class Alien{
 private int x,y;
 private int health;
 private int shouldBeAtX, shouldBeAtY;
 private boolean startAni;
  
 public Alien(int x, int y, int shouldBeAtX, int shouldBeAtY, int health, boolean startAni){
   this.x = x;
   this.y = y;
   this.shouldBeAtX = shouldBeAtX;
   this.shouldBeAtY = shouldBeAtY;
   this.health = health;
   this.startAni = startAni;
   
   
 }
 
 public int getX(){
   return x;
 }
 
 public int getY(){
   return y;
 }
 
 public int getHealth(){
   return health;
 }
 
 public void setX(int x){
   this.x = x;
 }
 
 public void setY(int y){
   this.y = y;
 }
 
 public boolean getStartAni(){
   return startAni;
 }
 
 public void toggleStartAni(){
   startAni = !startAni;
 }
 
 public void takeDamage(int power){
   health-=power;
 }
 public void shiftR(){
   x+=5;
 }
 public void shiftL(){
   x-=5;
 }
 public void move(int speed){
   if (x < shouldBeAtX){
     x+= speed;
   }
   if (x > shouldBeAtX){
     x-= speed;
   }
   if (y < shouldBeAtY){
     y+= speed;
   }
   if (y > shouldBeAtY){
     y-= speed;
   }   

 }
 
 public void drop(){
   y+=50;
 }
 
 public void attack(){
   
 }
 
 
 
  
  
}
