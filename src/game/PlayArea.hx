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
		
		setupTerritories();
	}
	
	function setupTerritories() 
	{
		var centerBaseList : Array<HexaTile> = new Array<HexaTile>();
		var currentTerritoryNumber : Int = 0;
		var recursiveMax : Int = 5;
		var recursiveCount : Int = 0;
		var alpha : Float = 0;
		
		function markTerritory(hexaTile : HexaTile, canOverride : Bool = false) : Bool
		{  
			if (hexaTile == null || hexaTile.isATerritory)
				return false;
			
			hexaTile.isATerritory = true;	
			hexaTile.territoryNumber = currentTerritoryNumber;
			
			return true;
		}
		
		function setAsMainBase(hexaTile : HexaTile) : Bool
		{
			if (hexaTile == null)
				return false;
			
			markTerritory(hexaTile); 
			hexaTile.isMainBase = true;
			
			return true;
		}	
		
		function markMainBase(centerTile : HexaTile, centerBaseList : Array<HexaTile>)
		{	
			centerTile.isCenter = true;		
			
			centerBaseList.push(centerTile);
			setAsMainBase(centerTile);
			setAsMainBase(centerTile.top);
			setAsMainBase(centerTile.topRight);
			setAsMainBase(centerTile.bottomRight);
			setAsMainBase(centerTile.bottom);
			setAsMainBase(centerTile.bottomLeft);
			setAsMainBase(centerTile.topLeft);
			
			centerTile.setupLabel("1");
		}
		
		function setupTerritory(rollX : Int, rollY : Int, centerBaseList : Array<HexaTile>)
		{	
			// We move the center slightly to make it more random
			var rollXModifier = Std.random(2) - 1;
			var rollYModifier = Std.random(2) - 1;
			
			rollX = rollX + rollXModifier;
			rollY = rollY + rollYModifier;
		  
			var currentHexaTile = playAreaArray[rollX][rollY];
			markMainBase(currentHexaTile, centerBaseList);
		}
		
		// We initialize the territories
		for (row in 1...(Math.floor(playAreaRows/5) + 1))
		{
			for (col in 1...(Math.floor(playAreaCols/5) + 1))
			{  
				setupTerritory((col * 5)-1, (row * 5)-1, centerBaseList);
				currentTerritoryNumber += 1;
			}
        }
	}
	
}