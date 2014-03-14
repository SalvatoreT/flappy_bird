PImage scene;
Bird bird;
Ground ground;

void setup() {
    size(288, 511-50);
    scene = loadImage("assets/Day Background.png");
    bird = new Bird(width/5, height/3);
    ground = new Ground();
}

void draw() {
    // Draw the scene
    image(scene, 0, -50, width, height);

    // Update the environment
    bird.update();
    ground.update();

    // Draw the assets
    bird.draw();
    ground.draw();
}

void mousePressed() {
    bird.click();
}

public class Bird {
    PImage up, middle, down;
    PImage[] imageStates;
    float x, y;
    float flapProgress;
    float flapSpeed = 0.2;
    float yVelocity;
    float yAcceleration;
    float flapVelocity;

    public Bird(float x, float y) {
        this.x = x;
        this.y = y;
        yVelocity = 0;
        yAcceleration = 0.2;
        flapVelocity = -4;
        up = loadImage("assets/Purple Up.png");
        middle = loadImage("assets/Purple Middle.png");
        down = loadImage("assets/Purple Down.png");
        imageStates = new PImage[]{up, middle, down, middle};
        flapProgress = 0;
    }

    public void draw() {
        image(imageStates[floor(flapProgress)], x, y);
        flapProgress = (flapProgress + flapSpeed) % 4;
    }

    public void kill() {
        flapSpeed = 0;
        yVelocity = 0;
        yAcceleration = 0;
        flapVelocity = 0;
    }

    public void update() {
        y += yVelocity;
        yVelocity += yAcceleration;
    }

    public void click() {
        yVelocity = flapVelocity;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public float getWidth() {
        return up.width;
    }

    public float getHeight() {
        return up.height;
    }
}

public class Ground {
    PImage img;
    float tick = 0;
    float speed = 1;
    float y;

    public Ground() {
        img = loadImage("assets/Ground.png");
        y = height - img.height;
    }

    public void draw() {
        image(img, (0 - tick) % img.width, y);
        image(img, (0 - tick) % img.width + img.width, y);
        tick += speed;
    }

    public void update() {
        if(bird.getY() + bird.getHeight() >= y) {
            bird.kill();
            speed = 0;
        }
    }
}
