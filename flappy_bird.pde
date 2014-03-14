PImage backgroundImg;

void setup() {
    size(288, 511);
    backgroundImg = loadImage("assets/Day Background.png");
}

void draw() {
    background(backgroundImg);
}