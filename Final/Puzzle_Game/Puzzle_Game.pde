int X, Y, n, m, a, b;
int N;
Piece[][] piezas;
PImage img;
int ss = 60; 
int se = ss+5;

void crearP(PImage img, String name) {

  //background(img);
  Y=0;
  n = img.width/ss;
  m = img.height/ss;
  piezas = new Piece[m][n];
  PVector[][] matrizP = new PVector[m][n];
  
  for (int i = 0; i<m; i++) {
    X=0;
    for (int j = 0; j<n; j++) {
      matrizP[i][j]= new PVector(X, Y);
      //println();
      //print(X, Y, img.width/ss, img.height/ss);
      piezas[i][j] = new Piece(img.get(X, Y, ss, ss), 60);
      //image(piezas[i][j], 0, 0);
      //piezas[i][j].save("Data/" + name + "/pieza" + str(N) + ".png");
      X=X+ss;
      N++;
    }
    Y=Y+ss;
  }
}

void setup() {

  size(1200, 750);
  
  String[] names = new String[3];

  names[0] = "test1";
  names[1] = "test3";
  names[2] = "test3";

  //for (int i=0; i<names.length; i++) {
  //for (int i=0; i<1; i++) {
  String load = names[1] + ".png";
  //println(load, names[i]);
  N=0;
  img = loadImage(load);
  a = img.width/2;
  b = img.height/2;
  crearP(img, names[1]);
//}
} 


void draw() {

  background(40);
  img.resize(a, b);
  image(img, 20, 20);

  for (int i=0; i<m; i++) {
    for (int j=0; j<n/2; j++) {
      PImage temp = piezas[i][j].imagge();
      piezas[i][j].display(temp, 350 + se*i, 20 + se*j);
      //image(piezas[i][j], 350 + se*i, 20 + se*j);
    }
    for (int j=n/2; j<n; j++) {
      PImage temp = piezas[i][j].imagge();
      piezas[i][j].display(temp, (m*se)+ 350 + se*i, 20 + se*(j-(n/2)));
      //image(piezas[i][j], (m*se)+ 350 + se*i, 20 + se*(j-(n/2)));
    }
  }

  for (int i=0; i<m; i++) {
    for (int j=0; j<n; j++) {
      rect( 350 + (ss * j), ((n/2)*se)+ 35 + (ss * i), ss, ss);
    }
  }
}
