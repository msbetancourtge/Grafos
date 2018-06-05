
class Piece {
  // 1. Attributes
  PImage img;
  float size;

  // 2. Constructors
  // 2.1. Default
  Piece() {
    setImage(loadImage("none.png"));
    setSize(60);
  }

  // 2.2. Other
  Piece(PImage img, int size) {
    setImage(img);
    setSize(size);
  }

  // 3. Methods

  void display(PImage disp, int posx, int posy) {
    pushStyle();
    image(disp, posx, posy);
    popStyle();
  }

  // 3.2. Setters

  void setSize(float s) {
    size = s;
  }
  
  void setImage(PImage image){
    img = image;
  }

  // 3.3. Getters

  float size() {
    return size;
  }
  
  PImage imagge() {
    return img;
  }
}
