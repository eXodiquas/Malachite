import dsfml.graphics;
import actor;

/++
 + Player : Actor
 +/
class Player : Actor
{
  this(string path)
    {
      super("PLAYER", path);
    }

  void move_player(Vector2f pos) {
    this.move(pos);
  }
}
