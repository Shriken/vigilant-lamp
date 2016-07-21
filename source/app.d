import std.stdio;

import game_state;
static import renderer;

void main() {
	writeln("hiya, starting up");
    renderer.setup();
	auto gameState = GameState();

	while (gameState.running) {
		gameState.update();
		renderer.render(gameState);
	}
}
