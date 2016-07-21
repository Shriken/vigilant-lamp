module game_state;

struct GameState {
	bool running = true;
	Level curLevel;

	void update() {
		curLevel.update();
	}
}
