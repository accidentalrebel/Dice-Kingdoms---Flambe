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
		
		// We set the neighbors of each hexaTile
		for ( col in 0...playAreaCols+1 )
		{
			for ( row in 0...playAreaRows+1 )
			{
				var currentHexaTile : HexaTile = playAreaArray[col][row];
				
				// We then get the surrounding of this tile
				// First the bottom neighbor
				if ( row + 1 <= playAreaRows )			
					currentHexaTile.bottom = playAreaArray[col][row + 1];
				// We get the top neighbor
				if ( row - 1 >= 0 )
					currentHexaTile.top = playAreaArray[col][row - 1];
					
				if ( col % 2 == 0 ) 		// If even
				{
					if ( col - 1 >= 0 )
					{
						currentHexaTile.topLeft = playAreaArray[col - 1][row];
						currentHexaTile.bottomLeft = playAreaArray[col - 1][row + 1];
					}
					
					if ( col + 1 < playAreaCols )
					{
						currentHexaTile.topRight = playAreaArray[col + 1][row];					
						currentHexaTile.bottomRight = playAreaArray[col + 1][row + 1];
					}
				}
				else						// If odd
				{
					if ( col - 1 >= 0 )
					{
						currentHexaTile.topLeft = playAreaArray[col - 1][row - 1];
						currentHexaTile.bottomLeft = playAreaArray[col - 1][row];
					}
					
					if ( col + 1 < playAreaCols)
					{
						currentHexaTile.topRight = playAreaArray[col + 1][row - 1];
						currentHexaTile.bottomRight = playAreaArray[col + 1][row];
					}
				}
			}
		}
	}
	
}