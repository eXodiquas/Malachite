import dsfml.graphics;
import dsfml.graphics.drawable;

import background;
import actor;
/++
 + Scene
 +/
class Scene : Drawable
{ 
  private
    {
      string scene_name;
      Background background;
      Actor[] actors;
    }

  this(string scene_name, string path_to_background)
    {
      this.scene_name = scene_name;
      this.background = new Background(path_to_background);
    }

  public void add_actor(Actor actor) {
    this.actors ~= actor;
  }
  
  override void draw(RenderTarget target, RenderStates states)
  {
    target.draw(this.background);
    foreach (actor ; this.actors)
      {
	target.draw(actor);
      }
  }
}

