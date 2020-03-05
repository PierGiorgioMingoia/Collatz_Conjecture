import processing.pdf.*;
void setup(){
  fullScreen();
  beginRecord(PDF, "collatz.pdf");
  //size(600,600); //create canvas
  background(0);
  for(int i=1;i<100000;i++){
    IntList sequence= new IntList();
    int n=i;
    do{
      sequence.append(n);
      n=collatz(n);
    }while (n!=1);
    sequence.append(1);
    sequence.reverse();
    float len= height/100.0;
    float angle= 0.15;
    resetMatrix();
    translate(width/2,height);
    for(int j=0; j<sequence.size(); j++){
      int value = sequence.get(j);
      if(value % 2==0){
        rotate(angle); //rotation of the point of view of 30°
      } else{
        rotate(-angle);
      }
      strokeWeight(2);
      stroke(255,2); //white 
      line(0,0,0,-len); //draw line from origin to len
      translate (0,-len); //move the origin to -len
    }
   
   // int steps=0;
    
    
    //println(steps);
  }
  endRecord();
  println("finished");
}

void draw(){
}

int collatz(int n){
  //even
  if(n%2 == 0) {
    return n/2;
  }
  //odd
  else{
    return (n*3+1)/2;
  }
}
