package game.tools;
import flambe.display.Sprite;
import flambe.math.Matrix;
import flambe.math.Point;

/**
 * ...
 * @author Karlo
 */
class MiscTools
{
	/**
	 * Gets the coordinates of the given sprite according to the stage (or global coordinates)
	 * @param	theSprite	the sprite to get the global coordinates of
	 * @return	The global x and y coordinates of the sprite
	 */
	public static function getGlobalCoordinates( theSprite : Sprite ) : Point
	{
		var matrix : Matrix = theSprite.getViewMatrix();
		return new Point(matrix.m02, matrix.m12);
	}	
}