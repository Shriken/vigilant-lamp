module render;

import std.stdio;

// Storage for our window
SDL_Window* window;
// Rendering context
SDL_GLContext context;
// Window width and heightk
int width  = 720,
    height = 720;

bool init() {
    DerelictSDL2.load();

    // Init SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        writeln("Error Initializing SDL: ", SDL_GetError());
        return false;
    }

    // Enable double buffering
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1); 

    // Create our window, store it in our window variable
    window = SDL_CreateWindow("Sumotion",
            SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
            width, height,
            SDL_WINDOW_OPENGL | SDL_WINDOW_INPUT_FOCUS);

    if (!window) {
        writeln("Couldn't create window: ", SDL_GetError());
        return false;
    }

    // Create our rendering context
    context = SDL_GL_CreateContext(window);
    SDL_GL_SetSwapInterval(1);

    return true;
}

void destroy() {
    SDL_GL_DeleteContext(context);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

void flip() {
    SDL_GL_SwapWindow(window);
}

// TODO: Implement these
void draw_pixel(RenderLoc loc, RenderColor color);
void draw_line(RenderLoc loc1, RenderLoc loc2, RenderColor color);
void draw_rect(RenderLoc loc1, RenderLoc loc2, RenderColor color);
