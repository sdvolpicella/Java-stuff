Field field;
Player p1;
Player p2;
Ball ball;

String game_state;

void setup(){
  
  size(640,480);
  field = new Field();
  
  p1 = new Player();
  p1.set_player_name("Player1: ");
  p1.set_player_size(40);
  p1.set_player_lineY();
  p1.set_player_sx(true);
  p1.set_player_AI_sx(false);
  p1.set_player_lineX(20);
  p1.set_player_speed(10);
  
  p2 = new Player();
  p2.set_player_name("Player2: ");
  p2.set_player_size(40);
  p2.set_player_lineY();
  p2.set_player_dx(true);
  p2.set_player_AI_dx(false);
  p2.set_player_lineX(20);
  p2.set_player_speed(10);
  
  ball = new Ball();
    
  game_state = "START";
  
}



void draw(){
  
  clear_background();
  switch(game_state){
    case "START": start_game(); break;
    case "PLAY": play_game(); break;
    case "END": end_game(); break;
      
  }
}

void start_game(){
  
  textAlign(CENTER);
  textSize(18);
  fill(255,0,0);
  text("Click anywhere to play PONG", width/2, height/2);
  textSize(14);
  fill(0,0,255);
  text("Commands for player1 are Q and A, commands for player2 are P and L", width/2, height/2+30);
  if(mousePressed == true){
    game_state = "PLAY";
  }
  
}


void play_game(){
  
  p1.set_player_winner(false);
  p2.set_player_winner(false);
  
  background(0);
  field.draw_display();
  if(p1.is_player_AI_sx() == false){
   p1.draw_player();
  }else{
    p1.draw_AI_player(ball);
  }
  if(p2.is_player_AI_dx() == false){
    p2.draw_player();
  }else{
    p2.draw_AI_player(ball);
  }
  ball.draw_ball();
  field.set_score(ball,p1,p2); // restituisce 1 se vince player1, 2 se vince player 2
  
  if(p1.is_player_winner()==true){
    game_state = "END";
    p1.set_player_score(0);
    p2.set_player_score(0);
  }
   
  if(p2.is_player_winner()==true){
    game_state = "END";
    p1.set_player_score(0);
    p2.set_player_score(0);
  }
  
  ball.collision(p1);
  ball.collision(p2);
  
}

void end_game(){
 
  textAlign(CENTER);
  textSize(18);
  fill(255,0,0);
  if(p1.is_player_winner() == true){
    text("Player1 WON",width/2,height/2);
  }
  if(p2.is_player_winner() == true){
    text("Player2 WON",width/2,height/2);
  }
  textSize(14);
  fill(0,0,255);
  text("Click anywhere to play again",width/2,height/2+40);
  if(mousePressed == true){
    game_state = "PLAY"; 
  }
  

}

void clear_background(){
  fill(255);
  rect(0,0,width,height);
}
