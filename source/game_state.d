module game_state;

import derelict.sdl2.sdl;

import level;

struct GameState {
	bool running = true;
	private bool paused = false;
	Level curLevel = new Level();

	void update() {
		updateIO();
		if (!paused) {
			curLevel.update();
		}
	}

	void updateIO() {
		SDL_Event event;
		while (SDL_PollEvent(&event)) {
			switch (event.type) {
				case SDL_KEYDOWN:
					pressKey(event.key.keysym.sym);
					break;
				default:
					break;
			}
		}
	}

	void pressKey(SDL_Keycode keycode) {
		switch (keycode) {
			case SDLK_ESCAPE:
				running = false;
				break;
			case SDLK_p:
				paused = !paused;
				break;
			default:
				break;
		}
	}
}
