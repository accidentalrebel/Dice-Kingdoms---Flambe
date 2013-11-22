package game.objects;
import flambe.Component;
import flambe.display.Font;
import flambe.display.ImageSprite;
import flambe.display.Sprite;
import flambe.display.TextSprite;
import flambe.Entity;
import game.Registry;

/**
 * ...
 * @author Karlo
 */
class HexaTile extends Component
{
	public static var tileWidth : Int = 22;
	public static var tileHeight : Int = 20;
	
	public var sprite : ImageSprite;
	var coverGraphic:ImageSprite;
	
	var col:Int = 0;
	var row:Int = 0;
	var label : TextSprite;
	
	public var isCenter : Bool = false;
	public var isATerritory : Bool = false;
	public var territoryNumber : Int = 0;
	public var isMainBase : Bool = false;
	public var isPicked : Bool = false;
	
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
		
		sprite = new ImageSprite(Registry.pack.getTexture("hexaTiles/terrain/hexaLand"));
		owner.addChild(new Entity().add(sprite));
		
		var xPos = 0.0;
		var yPos = 0.0;
		var hexaSpacingX : Float = (tileWidth / 4);
      
		xPos = col * ( tileWidth - hexaSpacingX + 1.5);
		if ( col % 2 == 0 )
			yPos = row * tileHeight + (tileHeight / 2) - 1;			
		else
			yPos = row * tileHeight - 1;
		
		sprite.setXY(xPos + Registry.playAreaPadding.x, yPos + Registry.playAreaPadding.y);
		
		coverGraphic = new ImageSprite(Registry.pack.getTexture("hexaTiles/hexaTile"));
		coverGraphic.alpha._ = 0.5;
		sprite.owner.addChild(new Entity().add(coverGraphic));
	}
	
	public function setupLabel(textToDisplay : String)
	{
		label = new TextSprite(new Font(Registry.pack, "fonts/AdventureSubtitles"), textToDisplay);
		label.setScale(0.4);
		
		label.setXY(sprite.x._, sprite.y._);
		owner.addChild(new Entity().add(label));
		updateLabel(textToDisplay);
	}
	
	public function setCoverColorTo(colorToUse : String) 
	{
		coverGraphic.texture = Registry.pack.getTexture("hexaTiles/hexaTile-" + colorToUse);
	}
	
	public function updateLabel(text : String) 
	{
		label.text = text;
	}
	
	public function checkIfClicked(xPos:Float, yPos:Float)
	{
		if ( xPos >= sprite.x._ && xPos <= sprite.x._ + sprite.getNaturalWidth() 
			&& yPos >= sprite.y._ && yPos <= sprite.y._ + sprite.getNaturalHeight() )
			return true;
			
		return false;
	}
}