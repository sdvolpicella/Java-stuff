boolean [] keys = new boolean[128];

void keyPressed(){
  keys[key] = true; 
}
  
void keyReleased(){
  keys[key] = false;
}

class Player{

  String player_name;
  
  int player_size;
  int player_lineY;
  int player_lineX_1;
  int player_lineX_2;
  int player_speed;
  boolean player_sx = false;  //verrà settato a vero quell'istanza che andrà a rappresentare la racchetta di sinistra
  boolean player_dx = false;
  boolean player_AI_sx = false;
  boolean player_AI_dx = false;
  boolean winner = false;
  
  int player_score = 0;
  
  int max_score = 5;
  
  void set_player_name(String new_name){
    this.player_name = new_name;
  }
  
  String get_player_name(){
    return this.player_name;
  }
  
  void set_max_score(int max){
    this.max_score = max;
  }
  
  int get_max_score(){
    return this.max_score; 
  }
  
  void set_player_score(int new_score){
    this.player_score = new_score;  
  }
  
  int get_player_score(){
    return this.player_score;  
  }
  
  void set_player_winner(Boolean new_bool){
    this.winner = new_bool;
  }
  
  Boolean is_player_winner(){
    return this.winner;
  }
  
  
  void set_player_size(int new_size){
    this.player_size = new_size;
  }
  
  void set_player_lineY(){
   this.player_lineY = height/2 - this.player_size/2;
  }
  
  void set_player_lineX(int n){
    if(this.player_sx == true && this.player_dx == false){ //racchetta sinistra
      this.player_lineX_1 = n;
      this.player_lineX_2 = n;
    }
    if(this.player_sx == false && this.player_dx == true){ //racchetta destra
      this.player_lineX_1 = width - n;
      this.player_lineX_2 = width - n;
    }
    
  }
  
  int get_player_lineX_1(){
   return this.player_lineX_1;
  }
  
  int get_player_lineX_2(){
    return this.player_lineX_2;  
  }
  
  void set_player_sx(boolean new_bool){
   this.player_sx = new_bool; 
  }
  
  boolean is_player_sx(){
    return this.player_sx;
  }
  
  void set_player_dx(boolean new_bool){
    this.player_dx = new_bool;
  }
  
  boolean is_player_dx(){
    return this.player_dx;
  }
  
  void set_player_speed(int new_int){
    this.player_speed = new_int;
  }
  
  int get_player_size(){
    return this.player_size; 
  }
  
  int get_player_lineY(){
    return this.player_lineY;
  }
  
  void set_player_AI_dx(boolean bool){
    this.player_AI_dx = bool;
  }
  
  void set_player_AI_sx(boolean bool){
    this.player_AI_sx = bool; 
  }
  
  boolean is_player_AI_dx(){
    return this.player_AI_dx;
  }
  
  boolean is_player_AI_sx(){
    return this.player_AI_sx;  
  }
  
  void draw_player(){
   
    if(this.player_sx == true && this.player_AI_sx == false){  //racchetta di sinistra
    
      //this.player_lineY = mouseY;
      if(keys['a']){
        this.player_lineY = this.player_lineY + player_speed;
      }
      if(keys['q']){
        this.player_lineY = this.player_lineY - player_speed;
      }
 
      
      if (this.player_lineY<=32)
      {
        this.player_lineY=32;
      }
      if (this.player_lineY>=height-10-this.player_size)
      {
        this.player_lineY=height-10-this.player_size;
      }
      strokeWeight(4);
      stroke(255);
      line(this.player_lineX_1, this.player_lineY, this.player_lineX_2, this.player_lineY+this.player_size); 
      noStroke();
    }
    
    if(this.player_dx == true && this.player_AI_dx == false){ //racchetta di destra
      
      if(keys['l']){
        this.player_lineY = this.player_lineY + player_speed;
      }
      if(keys['p']){
        this.player_lineY = this.player_lineY - player_speed;

      }
      
      if (this.player_lineY<=32)
      {
        this.player_lineY=32;
      }
      if (this.player_lineY>=height-10-this.player_size)
      {
        this.player_lineY=height-10-this.player_size;
      }
      strokeWeight(4);
      stroke(255);
      line(this.player_lineX_1, this.player_lineY, this.player_lineX_2, this.player_lineY+this.player_size); 
      noStroke();
    }
    
    
    
  }
  
  void draw_AI_player(Ball ball){ // AI
    
    if(this.player_dx == true && this.player_AI_dx == true){ //racchetta AI di destra
    
      
      if(ball.get_ball_xb() >= width/2){
      
        if(ball.get_ball_yb() >= this.player_lineY+(this.player_size/2)){
          this.player_lineY = this.player_lineY + player_speed;
        }else{
          this.player_lineY = this.player_lineY - player_speed;
        }
      
      }
      
      if (this.player_lineY<=32)
      {
        this.player_lineY=32;
      }
      if (this.player_lineY>=height-10-this.player_size)
      {
        this.player_lineY=height-10-this.player_size;
      }
      
    
 
      strokeWeight(4);
      stroke(255);
      line(this.player_lineX_1, this.player_lineY, this.player_lineX_2, this.player_lineY+this.player_size); 
      noStroke();
      
    }
    
  }
  
  
}
