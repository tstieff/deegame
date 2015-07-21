import Dgame.Window;
import Dgame.Graphic;
import Dgame.Graphic.Text;
import Dgame.System.Font;

import gamestate;
import inputhandler;

class Menu {
	private static Window * window;	
	
	private Event event;
	private GameState *gameState;
	
	private Font arial;
	private Text menuText;
	
	this(ref Window window) {
		this.window = &window;
		this.gameState = gameState;
		
		arial = Font("arial.ttf", 22);
		menuText = new Text(arial);
	}
	
	public void run(ref GameState gameState) {	
		this.gameState = &gameState;
		while(*this.gameState == GameState.MENU) {
			this.loop();
		}
	}	
	
	private void loop() {
		window.clear();
		
		InputHandler.handleMenuInput(event, *gameState, *window);
		
		menuText.format("Press Enter to continue...");
		menuText.setPosition(100, 100);
		window.draw(menuText);
		
		window.display();
	}
}