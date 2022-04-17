class Ball{
  
  float xb=320; // Coordinate palla
  float yb=240;
  int xd=1; // Incremento coordinate palla
  int yd=1;
  float xspeed = 2.5; // Velocità x della palla
  float yspeed = 2.5; // Velocità y della pala
  int ballSize=10; // Dimensione palla
  
  float get_ball_xb(){
    return xb;
  }
  
  float get_ball_yb(){
    return yb;
  }
  
  void set_ball_xd(int new_xd){
    this.xd = new_xd;
  }
  
  int get_ball_xd(){
    return this.xd;
  }
  
  int get_ball_size(){
    return this.ballSize;
  }
  
  void set_ball_xb(float new_xb){
    this.xb = new_xb;
  }
  
  void set_ball_yb(float new_yb){
    this.yb = new_yb;
  }
  
  void draw_ball() {
    xb = xb + ( xspeed * xd);
    yb = yb + ( yspeed * yd);
    if (xb > width-ballSize || xb < ballSize) {
    xd *= -1;
    }
    if (yb > height-ballSize-10 || yb < ballSize+32) {
    yd *= -1;
    }
    ellipse(xb, yb, ballSize, ballSize);
  }
  
  
   void collision(Player player){
          
      if(this.get_ball_xb() == player.get_player_lineX_1()){
      
        if(this.get_ball_yb() >= player.get_player_lineY() && this.get_ball_yb() <= player.get_player_lineY() + player.player_size){
        
          this.set_ball_xd(this.get_ball_xd() * -1);
          
        }
      
    }
  
  }
  
}
