package game.objects;
import flambe.Component;
import flambe.display.ImageSprite;
import flambe.display.Sprite;
import game.Registry;

/**
 * ...
 * @author Karlo
 */
class HexaTile extends Component
{
	var sprite : ImageSprite;
	var col:Int = 0;
	var row:Int = 0;
	
	public function new() 
	{
	}
	
	override public function onAdded()
	{
		super.onAdded();
	}
	
	public function initialize(col : Int , row : Int)
	{
		this.col = col;
		this.row = row;
		
		sprite = new ImageSprite(Registry.pack.getTexture("hexaTile"));
		owner.add(sprite);
	}
}