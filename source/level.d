module level;

import agent;
import bullet;

class Level {
	Room[] rooms;
	Room curRoom;

	this() {
		addRoom(new Room());
	}

	void addRoom(Room room) {
		rooms ~= room;
		if (curRoom is null) {
			curRoom = room;
		}
	}

	void update() {
		foreach (room; rooms) room.update();
	}
}

class Room {
	Room[4] neighbors;
	Agent[] agents;
	Bullet[] bullets;

	this() {}

	void update() {
		foreach (agent; agents) agent.update();
		foreach (bullet; bullets) bullet.update();
	}
}
