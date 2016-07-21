import std.stdio;

import game_state;
import renderer;

void main() {
	writeln("hiya, starting up");
	auto gameState = GameState();

	while (true) {
		gameState.update();
		renderer.render(gameState);
	}
}
