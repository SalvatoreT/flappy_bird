PImage scene;
PImage ground;
Bird bird;

void setup() {
    size(288, 511-50);
    scene = loadImage("assets/Day Background.png");
    ground = loadImage("assets/Ground.png");
    bird = new Bird();
}

int tick = 0;
void draw() {
    image(scene, 0, -50, width, height);
    bird.draw();
    image(ground, (0 - tick) % ground.width, height - ground.height);
    image(ground, (0 - tick) % ground.width + ground.width, height - ground.height);
    tick += 1;
}

public class Bird {
    PImage up;
    PImage middle;
    PImage down;
    PImage[] imageStates;
    float flapProgress;
    float flapSpeed = 0.2;

    public Bird() {
        up = loadImage("assets/Purple Up.png");
        middle = loadImage("assets/Purple Middle.png");
        down = loadImage("assets/Purple Down.png");
        imageStates = new PImage[]{up, middle, down, middle};
        flapProgress = 0;
    }

    public void draw() {
        image(imageStates[floor(flapProgress)], 100, 100);
        flapProgress = (flapProgress + flapSpeed) % 4;
    }
}