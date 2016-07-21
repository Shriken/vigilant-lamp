module types;

import gfm.math.vector;

alias WorldLoc = Vector!(float, 2);
alias WorldDiff = Vector!(float, 2);
alias RenderLoc = void;

RenderLoc worldToRender(WorldLoc loc);
