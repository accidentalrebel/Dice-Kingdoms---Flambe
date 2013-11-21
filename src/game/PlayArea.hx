package game;
import flambe.Component;
import flambe.Entity;
import game.objects.HexaTile;

/**
 * ...
 * @author Karlo
 */
class PlayArea extends Component
{
	public static var playAreaCols : Int = 42;
	public static var playAreaRows : Int = 26;
	var playAreaArray:Array<Array<HexaTile>>;

	public function new() 
	{
	}
	
	override public function onAdded()
	{
		super.onAdded();
		
		playAreaArray = new Array<Array<HexaTile>>();
		
		// We create the hexaTiles and arrange their positions
		for ( col in 0...playAreaCols+1 )
		{
			var rowArray : Array<HexaTile> = new Array<HexaTile>();
			playAreaArray.push(rowArray);
			
			for ( row in 0...playAreaRows+1 )
			{
				var hexaTile : HexaTile;
				owner.addChild(new Entity().add(hexaTile = new HexaTile()));
				hexaTile.initialize(col, row);
				playAreaArray[col].push(hexaTile);
			}
		}
	}
	
}