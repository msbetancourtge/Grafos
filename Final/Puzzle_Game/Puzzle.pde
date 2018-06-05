class Puzzle {
  // 1. Attributes
  Piece[][] piezas;
  PImage img;

  // 2. Constructors
  // 2.1. Default in this case dummy constructor
  Puzzle() {
    piezas = new Piece[1][1];
  img = loadImage("test1.png");
    for (int i = 0; i<m; i++) {
    X=0;
    for (int j = 0; j<n; j++) {
      piezas[i][j] = new Piece(img.get(X, Y, ss, ss), 60);
      X=X+ss;
      N++;
    }
    Y=Y+ss;
  }
  }

  // 2.2. Main constructor
  // file es un archico csv ubicado en la carpeta
  // data del sketch.
  
  Puzzle( String name) {
    String load = name + ".png";
    img = loadImage(load);
  a = img.width/2;
  b = img.height/2;
  
  Y=0;
  n = img.width/ss;
  m = img.height/ss;
  piezas = new Piece[m][n];
  //PVector[][] matrizP = new PVector[m][n];
  
  for (int i = 0; i<m; i++) {
    X=0;
    for (int j = 0; j<n; j++) {
      //matrizP[i][j]= new PVector(X, Y);
      piezas[i][j] = new Piece(img.get(X, Y, ss, ss), 60);
      X=X+ss;
      N++;
    }
    Y=Y+ss;
  }
    
  }

  void display() {
    pushStyle();
    
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
    
    popStyle();
  }
}
