public class Bullet{
  private int x,y;
  private int power;
  
  public Bullet(int x, int y, int power){
    this.x = x;
    this.y = y;
    this.power = power;
  }
  public void move(){
    this.y = this.y - 10;
  }
  
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  
}
