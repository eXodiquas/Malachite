import dsfml.graphics;
import dsfml.graphics.drawable;
import dsfml.graphics.transformable;

/++
 + Actor
 +/
class Actor : Drawable, Transformable
{
  mixin NormalTransformable;
  
  private
    {
      string actor_id;
      Texture actor_texture;
      Sprite sprite;
    }
  
  this(string actor_id, string path)
    {
      this.actor_texture = new Texture();
      if (!this.actor_texture.loadFromFile(path)) {
	throw new Exception("No file found for actor.");
      }
      this.sprite = new Sprite();
      sprite.setTexture(actor_texture);
    }

  override void draw(RenderTarget target, RenderStates states)
  {
    // Sync sprite position with transformable position
    // I think it should not be done like this, but I have not found
    // a satisfying solution.
    this.sprite.position = this.position;
    
    target.draw(this.sprite);
  }
}
