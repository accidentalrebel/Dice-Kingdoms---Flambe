package game.layers;
import flambe.Component;
import flambe.display.Sprite;
import flambe.math.Rectangle;
import game.indigoEngine.IEMainStage;
import game.Registry;

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
	
	public function centerOnScreen() 
	{
		var layerRect : Rectangle = (Sprite.getBounds(Registry.gameLayer.owner));
		sprite.setXY((IEMainStage.width / 2) - (layerRect.width / 2)
			, (IEMainStage.height / 2) - (layerRect.height / 2));
	}
}