import Dgame.Window;
import Dgame.Graphic;

import gamestate;

class EndGame {
	private static Window *window;	
	
	private GameState *gameState;	
	
	this(ref Window window) {
		this.window = &window;
	}
	
	public void run(ref GameState gameState) {	
		this.gameState = &gameState;
		while(*this.gameState != GameState.QUIT) {
			this.loop();
		}
	}
	
	private void loop() {
		
	}
}