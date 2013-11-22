package game.tools;

/**
 * ...
 * @author Karlo
 */
class ArrayTools
{

	public function new() 
	{
		
	}
	
	static public function hardCopyArray<A>(arrayToCopy : Array<A>)
	{
		var newArray : Array<A> = new Array<A>();
		for ( item in arrayToCopy )
			newArray.push(item);
			
		return newArray;
	}
	
}