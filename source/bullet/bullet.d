module bullet;

import types;

class Bullet {
	WorldLoc loc;
	WorldDiff vel;

	void update() {
		loc += vel;
	}
}
