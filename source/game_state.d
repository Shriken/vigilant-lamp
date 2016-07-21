module game_state;

import derelict.sdl2.sdl;

import level;

struct GameState {
	bool running = true;
	Level curLevel;

	void update() {
		updateIO();
		curLevel.update();
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
	}
}
