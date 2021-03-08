import core.exception;

import dsfml.graphics;
import dsfml.graphics.drawable;

/++
 + Background
 +/
class Background : Drawable
{
  private
    {
    Sprite sprite;
    Texture background_texture;
    }
  
  this(string path)
    {
      this.background_texture = new Texture();
      if (!this.background_texture.loadFromFile(path)) {
	throw new Exception("No file found for background.");
      }
      this.sprite = new Sprite();
      sprite.setTexture(background_texture);
    }

  override void draw(RenderTarget target, RenderStates states) {
    target.draw(this.sprite);
  }
}
