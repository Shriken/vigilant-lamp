module types;

import gfm.math.vector;

alias WorldLoc = Vector!(float, 2);
alias WorldDiff = Vector!(float, 2);
alias RenderLoc = Vector!(int, 2);
alias RenderColor = Vector!(ubyte, 4);

RenderLoc worldToRender(WorldLoc loc);
