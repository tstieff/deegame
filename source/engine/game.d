import Dgame.Window;
import Dgame.Graphic;
import Dgame.Math.Rect;

import gamestate;
import player;
import direction;
import inputhandler;

class Game {
	private static int windowHeight;
	private static int windowWidth;
	
	private static Window *window;		
	private GameState *gameState;
	private static Player player;
	
	private Event event;
	private Direction playerDirection; 	
	
	this(ref Window window) {
		this.window = &window;
		this.gameState = gameState;
		
		Size windowSize = this.window.getSize();
		windowWidth = windowSize.width;
		windowHeight = windowSize.height;
		
		player = Player();
		player.create(windowWidth, windowHeight);
		
		playerDirection = Direction.STOP;
	}
	
	public void run(ref GameState gameState) {
		this.gameState = &gameState;
		while(*this.gameState == GameState.PLAYING) {
			this.loop();
		}
	}	
	
	private void loop() {
		window.clear();
		
		InputHandler.handleGameInput(event, *gameState, *window, player, playerDirection);
		
		player.draw(*window);
		
		window.display();
	}
}