float ax, bx, cx, dx, ex;
float ay, by, cy, dy, ey;
PVector[] coordenadas = new PVector[10];
boolean[] coord_sel = new boolean[10];
boolean[] activo = new boolean[12];
boolean sel = false, resuelto=false;
int lineas = 0;
int nivel=1;
int pantalla=0;

int seleccion=999, pinicial = 999, pfinal = 999;

float x=350;
float y=250;
float w=180;
float h=50;


void setup() {
  
//Posiciones en X
ax = 250;
bx = 350;
cx = 450;
dx = 550;
ex = 650;
//Posiciones en Y
ay = 50;
by = 150;
cy = 250;
dy = 350;
ey = 450;

// Fondo
  size(900, 500);
  frameRate(15);
  
//Creación de los puntos
  coordenadas[0]= new PVector(ax, ay);
  coordenadas[1]= new PVector(cx, ay);
  coordenadas[2]= new PVector(ex, ay);
  coordenadas[3]= new PVector(ax, ey);
  coordenadas[4]= new PVector(cx, by);
  coordenadas[5]= new PVector(dx, cy);
  coordenadas[6]= new PVector(cx, dy);
  coordenadas[7]= new PVector(cx, ey);
  coordenadas[8]= new PVector(bx, cy);
  coordenadas[9]= new PVector(ex, ey);
  
  //Inicialización de los arreglos
  for(int j=0; j<10; j++){
    coord_sel[j]=false;
  }
  
  for(int k=0; k<10; k++){
    activo[k]=false;
  }

}

void draw() {
  
  //Pantalas de juego
  
  if (pantalla == 0) {
    inicial();
  } else if (pantalla == 1) {
    juego();
  } else if (pantalla == 2) {
    gameOver();
  }
    
}

void inicial(){
  
  //Pantalla de inicio del juego
  
  background(0);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(26);
  text("Click para Iniciar", 450, 200);
   
}

void juego(){

  //Función para correr el juego y los niveles
  
  switch(nivel){
    case 1:
    nivel1();
    break;
    //case 2:
    //nivel2();
    //break;
    //case 3:
    //nivel3();
    //break; 
  }
}

void gameOver(){
  
  if(lineas>14){
  
  //Función al perder el juego
  
  background(255, 20, 20);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(26);
  text("Has Perdido :(", 450, 200);
  text("Hiciste "+lineas+" líneas. Esas son demasiadas", 450, 100);
  
  stroke(0);
  rect(x, y, w, h, 5);
  textSize(14);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Volver a empezar!", 440, 275);
  
  }else if (lineas == 14){
    
  background(20, 240, 20);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(26);
  text("Felicitaciones!", 450, 200);
  //text(lineas, 450, 100);
  
  }
  
}


void nivel1(){
  
  background(255, 255, 255);
  
  //Líneas de la base
  stroke(200, 200, 200);
  strokeWeight(5);
  line(coordenadas[0].x, coordenadas[0].y, coordenadas[1].x, coordenadas[1].y);
  line(coordenadas[1].x, coordenadas[1].y, coordenadas[2].x, coordenadas[2].y);
  line(coordenadas[4].x, coordenadas[4].y, coordenadas[5].x, coordenadas[5].y);
  line(coordenadas[5].x, coordenadas[5].y, coordenadas[6].x, coordenadas[6].y);
  line(coordenadas[6].x, coordenadas[6].y, coordenadas[7].x, coordenadas[7].y);
  line(coordenadas[6].x, coordenadas[6].y, coordenadas[8].x, coordenadas[8].y);
  line(coordenadas[7].x, coordenadas[7].y, coordenadas[9].x, coordenadas[9].y);
  line(coordenadas[2].x, coordenadas[2].y, coordenadas[9].x, coordenadas[9].y);
  line(coordenadas[0].x, coordenadas[0].y, coordenadas[3].x, coordenadas[3].y);
  line(coordenadas[1].x, coordenadas[1].y, coordenadas[4].x, coordenadas[4].y);
  line(coordenadas[3].x, coordenadas[3].y, coordenadas[7].x, coordenadas[7].y);
  line(coordenadas[4].x, coordenadas[4].y, coordenadas[8].x, coordenadas[8].y);


  //Líneas de comprobación
  if(activo[0]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[0].x, coordenadas[0].y, coordenadas[1].x, coordenadas[1].y);
  line(coordenadas[1].x, coordenadas[1].y, coordenadas[0].x, coordenadas[0].y);
  if(activo[1]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[1].x, coordenadas[1].y, coordenadas[2].x, coordenadas[2].y);
  line(coordenadas[2].x, coordenadas[2].y, coordenadas[1].x, coordenadas[1].y);
  if(activo[2]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[4].x, coordenadas[4].y, coordenadas[5].x, coordenadas[5].y);
  line(coordenadas[5].x, coordenadas[5].y, coordenadas[4].x, coordenadas[4].y);
  if(activo[3]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[5].x, coordenadas[5].y, coordenadas[6].x, coordenadas[6].y);
  line(coordenadas[6].x, coordenadas[6].y, coordenadas[5].x, coordenadas[5].y);
  if(activo[4]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[6].x, coordenadas[6].y, coordenadas[7].x, coordenadas[7].y);
  line(coordenadas[7].x, coordenadas[7].y, coordenadas[6].x, coordenadas[6].y);
  if(activo[5]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[6].x, coordenadas[6].y, coordenadas[8].x, coordenadas[8].y);
  line(coordenadas[8].x, coordenadas[8].y, coordenadas[6].x, coordenadas[6].y);
  if(activo[6]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[7].x, coordenadas[7].y, coordenadas[9].x, coordenadas[9].y);
  line(coordenadas[9].x, coordenadas[9].y, coordenadas[7].x, coordenadas[7].y);
  if(activo[7]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[2].x, coordenadas[2].y, coordenadas[9].x, coordenadas[9].y);
  line(coordenadas[9].x, coordenadas[9].y, coordenadas[2].x, coordenadas[2].y);
  if(activo[8]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[0].x, coordenadas[0].y, coordenadas[3].x, coordenadas[3].y);
  line(coordenadas[3].x, coordenadas[3].y, coordenadas[0].x, coordenadas[0].y);
  if(activo[9]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[1].x, coordenadas[1].y, coordenadas[4].x, coordenadas[4].y);
  line(coordenadas[4].x, coordenadas[4].y, coordenadas[1].x, coordenadas[1].y);
  if(activo[10]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[3].x, coordenadas[3].y, coordenadas[7].x, coordenadas[7].y);
  line(coordenadas[7].x, coordenadas[7].y, coordenadas[3].x, coordenadas[3].y);
  if(activo[11]==false){
  stroke(255, 255, 255);
  }else{
    stroke(0);
  }
  strokeWeight(4);
  line(coordenadas[4].x, coordenadas[4].y, coordenadas[8].x, coordenadas[8].y);
  line(coordenadas[8].x, coordenadas[8].y, coordenadas[4].x, coordenadas[4].y);
  
  
  //Puntos que hay que unir
  stroke(0);
  strokeWeight(7);
  for(int i=0; i<10; i++){
    ellipse(coordenadas[i].x, coordenadas[i].y, 8, 8);
  }
  
  //Línea de unión
  if (sel==true) {     
    line(coordenadas[seleccion].x, coordenadas[seleccion].y, mouseX, mouseY);
  }
  
  
}


void mousePressed() {
  
  //Cambio de pantalla de inicio a pantalla de juego al hacer click
  
  if (pantalla==0) {
    pantalla=1;
  }
  
  float px= mouseX;
  float py= mouseY;
  
  for(int i=0; i<10; i++){
    if(coordenadas[i].x < px+7 && coordenadas[i].x > px-7){
      if(coordenadas[i].y < py+7 && coordenadas[i].y > py-7){
        
          coord_sel[i] = true;
          seleccion = i;
          sel = true;
          lineas++;
      }
    }
  }
}

void mouseReleased() {
  
  //Verificar si no se ha resuelto el juego para seguir creando líneas
  
  if(resuelto==false) {
    
    //Verificar si se seleccionó uno de los puntos y 
    //almacenarlo en variables auxiliares
    
    if (sel==true) {
      if(pinicial==999) {
        pinicial=seleccion;
      } else if (pfinal==999) {
        pfinal=seleccion;
      }
      
      //Llamar la función dibLinea() que cambia el color de la línea
      dibLinea(pinicial, pfinal);
      verificarRes();
      
      pinicial=seleccion;
      pfinal=999;
      
      //resuelto = verificarRes2(lineas);
      //sel = !resuelto;
      
    }else {
      pinicial=999;
      pfinal=999;
    }
  }
}

void dibLinea(int pinicial,int pfinal) {
  
  int a = pinicial;
  int b = pfinal;

//Cambia los valores en el arreglo activo[] 
//para cambiar el color de la línea que ya se trazó
  
  if(sel==true) {
    if(((a==0)&&(b==1))||(a==1)&&(b==0)) { activo[0]=true;}
    if(((a==1)&&(b==2))||(a==2)&&(b==1)) { activo[1]=true;}
    if(((a==4)&&(b==5))||(a==5)&&(b==4)) { activo[2]=true;}
    if(((a==5)&&(b==6))||(a==6)&&(b==5)) { activo[3]=true;}
    if(((a==6)&&(b==7))||(a==7)&&(b==6)) { activo[4]=true;}
    if(((a==6)&&(b==8))||(a==8)&&(b==6)) { activo[5]=true;}
    if(((a==7)&&(b==9))||(a==9)&&(b==7)) { activo[6]=true;}
    if(((a==2)&&(b==9))||(a==9)&&(b==2)) { activo[7]=true;}
    if(((a==0)&&(b==3))||(a==3)&&(b==0)) { activo[8]=true;}
    if(((a==1)&&(b==4))||(a==4)&&(b==1)) { activo[9]=true;}
    if(((a==3)&&(b==7))||(a==7)&&(b==3)) { activo[10]=true;}
    if(((a==4)&&(b==8))||(a==8)&&(b==4)) { activo[11]=true;}
  }
}


void verificarRes() {
  
  //Verificar los resultados
  
  int contlineas=0;
  for(int i=0; i<12; i++) {
    if (activo[i]==true) {
      contlineas++;
    }
  }
  if(contlineas < 12) {
    sel=true;
    resuelto=false;
  }else if(contlineas==12) {
    sel=false;
    resuelto=true;
    pantalla=2;
  }
  
}