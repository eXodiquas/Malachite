import std.algorithm;
import std.array;

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

  public Actor[] get_actors()
  {
    return this.actors;
  }

  public Actor get_player()
  {
    return this.actors.filter!(x => typeof(x).stringof == "Player").array[0];
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

