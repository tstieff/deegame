import std.container;

import Dgame.Window;
import Dgame.Graphic;

import gamestate;
import menu;
import game;
import endgame;

class Engine {
	private static const int WINDOW_HEIGHT = 680;
	private static const int WINDOW_WIDTH = 480;
	private static const Color4b BG_COLOR = Color4b(61, 92, 92, 0);
	
	private static Window window;
	
	private GameState gameState;
	
	this() {
		window = Window(WINDOW_WIDTH, WINDOW_HEIGHT, "DeeGame");
		window.setVerticalSync(Window.VerticalSync.Enable);
		window.setClearColor(BG_COLOR);
	}
	
	public void run() {
		Menu menu = new Menu(window);
		Game game = new Game(window);
		EndGame endGame = new EndGame(window);
		
		gameState = GameState.MENU;
		while(gameState != GameState.QUIT) {
			menu.run(gameState);
			game.run(gameState);
			endGame.run(gameState);
		}
	}
}