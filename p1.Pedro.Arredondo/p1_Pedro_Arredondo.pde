boolean button4Over = false;
boolean button3Over = false;
boolean button2Over = false;
boolean button1Over = false;
boolean buttonCOver = false;
boolean buttonOOver = false;
boolean buttonAOver = false;

color buttonColor = color(245,245,220);
color floor1 = buttonColor;
color floor2 = buttonColor;
color floor3 = buttonColor;
color floor4 = buttonColor;
color floorC = buttonColor;
color floorO = buttonColor;
color floorA = buttonColor;
color floor1set = buttonColor;
color floor2set = buttonColor;
color floor3set = buttonColor;
color floor4set = buttonColor;
color selectedColor = color(255,0,0);

//images
PImage braille4;
PImage braille3;
PImage braille2;
PImage braille1;

int savedTime;
int totalTime = 5000;

String floorDisplay = "1";
void setup(){
 size(1000,750);
 background(255);
 stroke(0);
 braille4 = loadImage("processing_data/4_braille.png");
 braille3 = loadImage("processing_data/3_braille.png");
 braille2 = loadImage("processing_data/2_braille.png");
 braille1 = loadImage("processing_data/1_braille.png");
 
 savedTime = millis();

}
void draw(){
  update(mouseX, mouseY);
  
  int passedTime = millis() - savedTime;
  
  if(passedTime > totalTime){
    if(floor2set == selectedColor){
      floorDisplay = "2";
      floor2set = buttonColor;
    }else if(floor3set == selectedColor){
     floorDisplay = "3";
     floor3set = buttonColor; 
    }else if(floor4set == selectedColor){
      floorDisplay = "4";
      floor4set = buttonColor;
    }else if(floor1set == selectedColor){
     floorDisplay = "1";
     floor1set = buttonColor; 
    }
   savedTime = millis();
  }
  
  noStroke();
  
 
  if(button4Over){
   floor4 = selectedColor;
  }else if(button3Over){
   floor3 = selectedColor; 
  }else if(button2Over){
   floor2 = selectedColor;
  }else if(button1Over){
   floor1 = selectedColor; 
  }else if(buttonCOver){
   floorC = selectedColor;
  }else if(buttonOOver){
   floorO = selectedColor; 
  }else if(buttonAOver){
   floorA = selectedColor; 
  }else{
   floor4= floor4set; 
   floor3=floor3set;
   floor2=floor2set;
   floor1=floor1set;
   floorC=buttonColor;
   floorO=buttonColor;
   floorA=buttonColor;
  }
  
 //silver rectangle
 fill(192,192,192);
 rect(250,50,300,650); 
 
 //black rectangle for floor number
 fill(0,0,0);
 rect(275,75,250,100);
 
 
 //floor buttons
 fill(floor4);
 ellipse(350, 250,50,50);
 fill(floor3);
 ellipse(350, 350,50,50);
 fill(floor2);
 ellipse(350, 450,50,50);
 fill(floor1);
 ellipse(350, 550,50,50);
 
 fill(floorC);
 ellipse(300, 650,50,50);
 fill(floorO);
 ellipse(400, 650,50,50);
 fill(floorA);
 ellipse(500, 650,50,50);
 
 //text
 fill(0,0,0);
 textSize(25);
 text("4",345,260);
 text("3",345,360);
 text("2",345,460);
 text("1",345,560);
 
 text(">|<",285,660);
 text("<|>",385,660);
 textSize(15);
 text("alarm",485,655);
 
 textSize(100);
 fill(255,0,0);
 text(floorDisplay,375,150);
 
 image(braille4,365,190);
 image(braille3,365,290);
 image(braille2,365,390);
 image(braille1,365,490);

}

void update(int x, int y){
 if(overButton(350,250,50)){
   button4Over = true;
 }else if(overButton(350,350,50)){
   button3Over = true;
 }else if(overButton(350,450,50)){
   button2Over = true;
 }else if(overButton(350,550,50)){
   button1Over = true;
 }else if(overButton(300,650,50)){
   buttonCOver = true;
 }else if(overButton(400,650,50)){
   buttonOOver = true;
 }else if(overButton(500,650,50)){
   buttonAOver = true;
 }else{
  button4Over = false;
  button3Over = false;
  button2Over = false;
  button1Over = false;
  buttonCOver = false;
  buttonOOver = false;
  buttonAOver = false;
 }
}

void mousePressed(){
 if(button4Over){
  floor4set = selectedColor; 
 }else if(button3Over){
   floor3set = selectedColor;
 }else if(button2Over){
  floor2set = selectedColor;
 }else if(button1Over){
  floor1set = selectedColor; 
 }
}

boolean overButton(int x, int y, int diameter){
 float disX = x - mouseX;
 float disY = y-mouseY;
 if(sqrt(sq(disX)+sq(disY))<diameter/2){
   return true;
 }else{
   return false;
 }
}
