import std.stdio;

import bindbc.sdl;
import bindbc.sdl.image;
import scene;

private bool init_SDL_libraries() 
{
    SDLSupport ret = loadSDL();
    if(ret != sdlSupport) {
        if(ret == SDLSupport.noLibrary) {
            writeln("SDL couldn't get loaded: No library!");
            return false;
        }
        else if(SDLSupport.badLibrary) {
            writeln("SDL couldn't get loaded: Bad library!");
            return false;
        }
    }

    version(Windows) {
        ret = loadSDL("libs/SDL2.dll");
        if(ret != sdlSupport) {
            writeln("SDL couldn't get loaded on Windows!");
            return false;
        }
    }

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        writeln("SDL init went wrong!");
        return false;
    }

    return true;
}

void main(string[] args)
{
    init_SDL_libraries();

    // Create a window
    auto sdlWindow = SDL_CreateWindow( 
        "Malachite Test Game", 
        SDL_WINDOWPOS_UNDEFINED, 
        SDL_WINDOWPOS_UNDEFINED, 
        1280, 
        720, 
        SDL_WINDOW_SHOWN);

    // Event queue
    bool running = true;
    while (running) 
    {
        SDL_Event e;
        while(SDL_PollEvent(&e) > 0)
        {
            switch(e.type) 
            {
                case SDL_QUIT:
                    running = false;
                    break;
                default:
                    break;
            }
            SDL_UpdateWindowSurface(sdlWindow);
        }
    }
}
