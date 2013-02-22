import processing.video.*; //Importing video library
import oscP5.*;
import netP5.*;

float firstValue1=0;
float secondValue1=0;
float thirdValue1=0;

Movie mov1, mov2, mov3, mov4, mov5, mov6, mov7, mov8, mov9, mov10, mov11, mov12; // 12 Movie objects are created


OscP5 oscP5;
NetAddress myBroadcastLocation; 


void setup()
{
  size(600, 600, P2D); //size of the screen and render type have been determined, for different render types check processing reference
  
  //load movies into the movie objects created above. To change the movie, just replace the path of the movie you want to play in between " " 
  mov1 = new Movie(this, "rit_orchestra.mov");
  mov2 = new Movie(this, "rit_orchestra.mov");
  mov3 = new Movie(this, "rit_orchestra.mov");
  mov4 = new Movie(this, "rit_orchestra.mov");
  mov5 = new Movie(this, "rit_orchestra.mov");
  mov6 = new Movie(this, "rit_orchestra.mov");
  mov7 = new Movie(this, "rit_orchestra.mov");
  mov8 = new Movie(this, "gitan_accordeon_rid_150.mov");   // another movie 
  mov9 = new Movie(this, "rit_orchestra.mov");
  mov10 = new Movie(this, "rit_orchestra.mov");
  mov11 = new Movie(this, "rit_orchestra.mov");
  mov12 = new Movie(this, "rit_orchestra.mov");
  
  oscP5 = new OscP5(this,12000);
  myBroadcastLocation = new NetAddress("127.0.0.1",32000);
  
  frameRate(30);
  
   
}


void draw()
{
  //place movies on screen according to the grid specifications
  image(mov1, 0, 0);
  image(mov2, 200, 0);
  image(mov3, 400, 0);
  image(mov4, 0, 150);
  image(mov5, 200, 150);
  image(mov6, 400, 150);
  image(mov7, 0, 300);
  image(mov8, 200, 300);
  image(mov9, 400, 300);
  image(mov10, 0, 450);
  image(mov11, 200, 450);
  image(mov12, 400, 450);

// play all movies in loop
  mov1.loop();
  mov2.loop();
  mov3.loop();
  mov4.loop();
  mov5.loop();
  mov6.loop();
  mov7.loop();
  mov8.loop();
  mov9.loop();
  mov10.loop();
  mov11.loop();
  mov12.loop();

//following code is a simple if-else control structure. if a specified key is being kept pressed, movie tied to that key is paused.

//    
//  else if(keyPressed && key =='3') //movie.pause() command does not actually pause the movie, it freezes the current frame but movie keeps playing in backround.
                                   //if you want to actually pause the movie you should decrease the speed to zero by movie.speed(). then set its speed again to one to play it.
                                   //this code piece demonstrates that in comparison to movie.play(). 
    
    mov8.speed(1);  // another video that is going to keep playing
    

    mov1.speed(0);
    mov2.speed(0);
    mov3.speed(0);
    mov4.speed(0);
    mov5.speed(0);
    mov6.speed(0);
    mov7.speed(0);
  //  mov8.speed(0);
    mov9.speed(0);
    mov10.speed(0);
    mov11.speed(0);
    mov12.speed(0);
    
    if(firstValue1 == 0 || secondValue1 == 0 || thirdValue1 == 0) {
    mov1.speed(1);
    }
    else if(firstValue1 == 1 || secondValue1 == 1 || thirdValue1 == 1) {
    mov2.speed(1);
    }
    else if(firstValue1 == 2 || secondValue1 == 2 || thirdValue1 == 2) {
    mov3.speed(1);
    }
    else if(firstValue1 == 3 || secondValue1 == 3 || thirdValue1 == 3) {
    mov4.speed(1);
    }
    else if(firstValue1 == 4 || secondValue1 == 4 || thirdValue1 == 4) {
    mov5.speed(1);
    }
    else if(firstValue1 == 5 || secondValue1 == 5 || thirdValue1 == 5) {
    mov6.speed(1);
    }
    else if(firstValue1 == 6 || secondValue1 == 6 || thirdValue1 == 6) {
    mov7.speed(1);
    }
//    else if(firstValue1 == 7 || secondValue1 == 7 || thirdValue1 == 7) {
//    mov8.speed(1);
//    }
    else if(firstValue1 == 7 || secondValue1 == 7 || thirdValue1 == 7) {
    mov9.speed(1);
    }
    else if(firstValue1 == 8 || secondValue1 == 8 || thirdValue1 == 8) {
    mov10.speed(1);
    }
    else if(firstValue1 == 9 || secondValue1 == 9 || thirdValue1 == 9) {
    mov11.speed(1);
    }
    else if(firstValue1 == 10 || secondValue1 == 10 || thirdValue1 == 10) {
    mov12.speed(1);
    }
    else {
    mov1.speed(0);
    mov2.speed(0);
    mov3.speed(0);
    mov4.speed(0);
    mov5.speed(0);
    mov6.speed(0);
    mov7.speed(0);
    mov8.speed(0);
    mov9.speed(0);
    mov10.speed(0);
    mov11.speed(0);
    mov12.speed(0);  
    }
  
    
    
}


void oscEvent (OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */
 if(theOscMessage.checkAddrPattern("/test/")==true) {
    /* check if the typetag is the right one. */
  //  if(theOscMessage.checkTypetag("iii")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      int firstValue = theOscMessage.get(0).intValue(); 
      int secondValue = theOscMessage.get(1).intValue();
      int thirdValue = theOscMessage.get(2).intValue();
      
      firstValue1 = map(firstValue, 0, 20,0, 10);
      secondValue1 = map(secondValue, 0, 20, 0, 10);
      thirdValue1 = map(thirdValue, 0, 20, 0 ,10);

    
      print("### received an osc message /test with typetag ifs.");
      println(" values: "+firstValue+", "+secondValue+", "+thirdValue);
      return;
    // }  
  }
}  


