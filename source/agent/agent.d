module agent;

import types;

class Agent {
	WorldLoc loc;
	WorldDiff vel;

	void update() {
		loc += vel;
	}
}
