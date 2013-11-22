package game.tools;
import flambe.math.Point;

/**
 * ...
 * @author Karlo
 */
class MathTools
{
	inline static public function getDistance(Point1:Point, Point2:Point):Float
	{
		var dx:Float = Point1.x - Point2.x;
		var dy:Float = Point1.y - Point2.y;
		return vectorLength(dx, dy);
	}	
	
	inline static public function vectorLength(dx:Float, dy:Float):Float
	{
		return Math.sqrt(dx * dx + dy * dy);
	}
	
	public static function randomMinMax(minValue : Int, maxValue : Int) : Int
	{
		return Std.int(minValue + Math.round((Math.random() * (maxValue - minValue))));
	}
}