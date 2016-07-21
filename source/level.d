module level;

import agent;
import bullet;

class Level {
	Room[] room;
	Room curRoom;
}

class Room {
	Room[4] neighbors;
	Agent[] agents;
	Bullet[] bullets;
}
