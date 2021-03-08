module main;

import dsfml.graphics;

void main(string[] args)
{
    auto window = new RenderWindow(VideoMode(800,600),"Malachite Test Game!");

    // Game loop
    while (window.isOpen())
    {
        Event event;

        while(window.pollEvent(event))
        {
            if(event.type == event.EventType.Closed)
            {
                window.close();
            }
        }

	// Clear and display again
        window.clear();
        window.display();
    }
}
