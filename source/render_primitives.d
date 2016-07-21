module render;

import std.stdio;
import derelict.sdl2.sdl;

import types;

// Storage for our window
SDL_Window* window;
// Rendering context
SDL_GLContext context;
// Renderer
SDL_Renderer* renderer;
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

    renderer = SDL_GetRenderer(window);

    if (!renderer) {
        writeln("Couldn't create renderer: ", SDL_GetError());
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

void draw_pixel(RenderLoc loc, RenderColor color) {
    SDL_SetRenderDrawColor(renderer, color[0], color[1], color[2], color[3]);
    SDL_RenderDrawPoint(renderer, loc[0], loc[1]);
}

void draw_line(RenderLoc loc1, RenderLoc loc2, RenderColor color) {
    SDL_SetRenderDrawColor(renderer, color[0], color[1], color[2], color[3]);
    SDL_RenderDrawLine(renderer, loc1[0], loc1[1], loc2[0], loc2[1]);
}

void draw_rect(RenderLoc loc1, RenderLoc loc2, RenderColor color) {
    SDL_SetRenderDrawColor(renderer, color[0], color[1], color[2], color[3]);
    auto rect = SDL_Rect(loc1[0], loc1[1], loc2[0], loc2[1]);
    SDL_RenderFillRect(renderer, &rect);
}
