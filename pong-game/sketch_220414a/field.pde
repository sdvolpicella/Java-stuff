class Field{
    
  PFont f;
  
  void draw_display(){
    
    PFont f;
    strokeWeight(4);
    stroke(255);
    line(0, 32, width, 32);
    line(0, height-10, width, height-10);
    f = createFont("Arial", 22, true);
    textFont(f);
    fill(255);
    noStroke();
    text(p1.get_player_name() + p1.get_player_score(), 80, 22);//12
    text(p2.get_player_name() + p2.get_player_score(), width-80, 22);
  }
  
  void set_score(Ball ball, Player p1, Player p2){
   
    if(ball.get_ball_xb() == 0+ball.get_ball_size()){
       
       
       p2.set_player_score(p2.get_player_score()+1);
       
       ball.set_ball_xb(320);
       ball.set_ball_yb(240);
       p1.set_player_lineY();
       p2.set_player_lineY();

    }
    
    if(ball.get_ball_xb() == width - ball.get_ball_size()){
       
       p1.set_player_score(p1.get_player_score()+1);

       ball.set_ball_xb(320);
       ball.set_ball_yb(240);
       p1.set_player_lineY();
       p2.set_player_lineY();
    }
    
        
    if(p1.get_player_score() == p1.get_max_score()){
      p1.set_player_winner(true);
    }
    if(p2.get_player_score() == p2.get_max_score()){
      p2.set_player_winner(true);
    }
    
  }
  
}
