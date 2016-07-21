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
}

class Room {
	Room[4] neighbors;
	Agent[] agents;
	Bullet[] bullets;

	this() {}
}
