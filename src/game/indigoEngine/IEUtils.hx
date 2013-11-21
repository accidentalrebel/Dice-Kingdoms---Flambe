package game.indigoEngine;

/**
 * ...
 * @author 
 */
class IEUtils
{	
	/**
	 * Returns a random number from a given min and max range
	 * @param	min		the minimum range of the random number
	 * @param	max		the maximum range of the random number	
	 * @return	The random number
	 */
	public static function randomMinMax( min : Float, max : Float ) : Float
	{
		return min + ( max - min ) * Math.random();
	}
	
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
	
	/**
	 * Gets the string name of the particular class
	 * @param	theClass
	 * @return	The name of the class in String form
	 */
	public static function getClassName( theClass : Dynamic ) : String
	{
		var className : String = Type.getClassName(theClass);
		className = className.split(".")[1];
		return className;
	}
	
	/**
	 * Copies the content of one array into a new array
	 * @param	arrayToCopy		the array to copy from
	 * @return	the new array that was created
	 */
	public static function deepCopyArray( arrayToCopy : Array<Dynamic>) : Array<Dynamic>
	{
		var newArray : Array<Dynamic> = new Array<Dynamic>();
		for ( element in arrayToCopy )
		{
			newArray.push(element);
		}
		
		return newArray;
	}	
}