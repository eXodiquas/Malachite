import dsfml.graphics;
import scene;
import player;

void main(string[] args)
{
    auto window = new RenderWindow(VideoMode(1280,720),"Malachite Test Game!");
    Scene s = new Scene("Marketplace", "assets/default720.png");
    s.add_actor(new Player("assets/person.png"));

    
    
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
	  if (event.mouseButton.button == Mouse.Button.Left)
	    {
	    }
	  }

	// Clear and display again
        window.clear();
	window.draw(s);
        window.display();
    }
}
