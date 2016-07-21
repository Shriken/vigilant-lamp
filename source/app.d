import std.stdio;

import level;
import renderer;

void main() {
	writeln("hiya, starting up");
	auto level = new Level();
	writeln(level);

	while (true) {
		level.update();
		renderer.render(level);
	}
}
