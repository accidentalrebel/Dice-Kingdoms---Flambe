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
	public static var tileWidth : Int = 22;
	public static var tileHeight : Int = 20;
	
	var sprite : ImageSprite;
	var col:Int = 0;
	var row:Int = 0;
	
	// Neighbors
	public var top : HexaTile = null;
	public var topRight : HexaTile= null;
	public var bottomRight : HexaTile = null;
	public var bottom : HexaTile = null;
	public var bottomLeft : HexaTile = null;
	public var topLeft : HexaTile = null;
	
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
		
		var xPos = 0.0;
		var yPos = 0.0;
		var hexaSpacingX : Float = (tileWidth / 4);
      
		xPos = col * ( tileWidth - hexaSpacingX + 1.5);
		if ( col % 2 == 0 )
			yPos = row * tileHeight + (tileHeight / 2) - 1;			
		else
			yPos = row * tileHeight - 1;
		
		sprite.setXY(xPos + Registry.playAreaPadding.x, yPos + Registry.playAreaPadding.y);		
	}
}