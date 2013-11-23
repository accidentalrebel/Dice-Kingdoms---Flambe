package game.layers;
import flambe.Component;
import flambe.display.Sprite;

/**
 * ...
 * @author Karlo
 */
class Layer extends Component
{
	public var sprite:Sprite;
	
	public function new() 
	{
		
	}
	
	override public function onAdded() 
	{
		super.onAdded();
		
		owner.add(sprite = new Sprite());
	}	
}