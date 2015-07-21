import std.stdio;

import Dgame.Graphic;
import Dgame.Math.Vector2;
import Dgame.Math.Rect : Size;

import direction;

struct Player {
	public static const float RUN_VELOCITY_INC = 0.75;
	public static const float RUN_VELOCITY_DEC = 2.5;
	public static const float MAX_VELOCITY = 20.0;
	public static const int MAX_LIVES = 3;
	
	public static Sprite sprite;
	public int lives;
	
	private static int windowWidth;
	private static int windowHeight;
	
	private static Texture texture;
	
	private Direction lastDirection;
	
	private int spriteY;	
	private float currentVelocity = 0;
	
	public void create(int windowWidth, int windowHeight) {
		this.windowWidth = windowWidth;
		this.windowHeight = windowHeight;
		
		Surface surface = Surface("res/sprite/player.png");
		texture = Texture(surface);
		sprite = new Sprite(texture);
		
		lastDirection = Direction.STOP;	
		
		spriteY = windowHeight - 100;
		
		sprite.setPosition(windowWidth / 2, spriteY);
		
		lives = MAX_LIVES;
	}
	
	public void draw(ref Window window) {
		window.draw(sprite);
	}
	
	public void run(Direction dir) {				
		if (dir != Direction.STOP) {
			lastDirection = dir;
		}
		
		if (dir == Direction.STOP  && currentVelocity > 0) {
			currentVelocity -= RUN_VELOCITY_DEC;		
					
			if (currentVelocity < 0) {
				currentVelocity = 0;
			} else {
				handleStopping();
			}
		} else {
			currentVelocity += RUN_VELOCITY_INC;
		}
		
		if (currentVelocity > MAX_VELOCITY) {
			currentVelocity = MAX_VELOCITY;
		}
		
		if (dir == Direction.LEFT) {
			sprite.move(-currentVelocity, 0);
		} else if (dir == Direction.RIGHT) {
			sprite.move(currentVelocity, 0);
		}
		
		moveInsideWindow();
	}
	
	public void reset() {
		lives = MAX_LIVES;
		
		lastDirection = Direction.STOP;	
		
		currentVelocity = 0;
	}
	
	private void handleStopping() {
		if (lastDirection == Direction.LEFT) {
			sprite.move(-currentVelocity, 0);
		} else if (lastDirection == Direction.RIGHT) {
			sprite.move(currentVelocity, 0);
		}
		
		moveInsideWindow();
	}
	
	private void moveInsideWindow() {
		if (sprite.x() < -32) {
			sprite.setPosition(windowWidth, spriteY);
		} else if (sprite.x() > windowWidth) {
			sprite.setPosition(-32, spriteY);
		}
	}
}