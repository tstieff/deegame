import std.stdio;

import Dgame.Window;
import Dgame.System.Keyboard;

import gamestate;
import direction;
import player;

class InputHandler {	
	public static void handleMenuInput(ref Event event, ref GameState gameState, ref Window window) {
		while(window.poll(&event)) {
			switch (event.type) {
				case Event.Type.Quit:
					gameState = GameState.QUIT;
				break;
				
				case Event.Type.KeyDown:	
					if (event.keyboard.key == Keyboard.Key.Esc) {
						gameState = GameState.QUIT;
					} else if (event.keyboard.key == Keyboard.Key.Return) {
						gameState = GameState.PLAYING;
					}
				break;
				
				default: break;
			}			
		}
	}
	
	public static void handleGameInput(ref Event event, ref GameState gameState, ref Window window, ref Player player, ref Direction playerDirection) {
		while(window.poll(&event)) {
			switch (event.type) {
				case Event.Type.Quit:
					gameState = GameState.QUIT;
				break;
				
				case Event.Type.KeyDown:	
					if (event.keyboard.key == Keyboard.Key.Esc) {
						gameState = GameState.QUIT;
					} else if (event.keyboard.key == Keyboard.Key.Right) {
						playerDirection = Direction.RIGHT;
					} else if (event.keyboard.key == Keyboard.Key.Left) {
						playerDirection = Direction.LEFT;
					} else {
						playerDirection = Direction.STOP;
					}
				break;
				
				default: 
					playerDirection = Direction.STOP;
				break;
			}			
		}
		
		player.run(playerDirection);	
	}
	
	public static void handleEndGameInput(ref Event event, ref GameState gameState, ref Window window) {
		while(window.poll(&event)) {
			switch (event.type) {
				case Event.Type.Quit:
					gameState = GameState.QUIT;
				break;
				
				case Event.Type.KeyDown:	
					if (event.keyboard.key == Keyboard.Key.Esc) {
						gameState = GameState.QUIT;
					} else if (event.keyboard.key == Keyboard.Key.Return) {
						gameState = GameState.MENU;
					}
				break;
				
				default: break;
			}			
		}
	}
}