package game.objects;
import flambe.Component;
import game.Registry;

/**
 * ...
 * @author Karlo
 */
class Territory extends Component
{
	public var neighbors : Array<Int>;
	public var armyCount : Int = 0;
	public var centerTile : HexaTile = null;
	public var members : Array<HexaTile>;
	public var ownerNumber : Int = 0;
	public var territoryNumber : Int;
	public var markAsChecked : Bool = false;

	public function new() 
	{
		
	}
	
	public function initialize(territoryNumber : Int) 
	{
		this.territoryNumber = territoryNumber;
		neighbors = new Array<Int>();
		members = new Array<HexaTile>();
	}
	
	public function setArmyCount(count:Int) 
	{
		if ( centerTile == null )
		{
			trace("CENTER TILE IS NOT INITIALIZED");
			return;
		}
		
		armyCount = count;
		centerTile.updateLabel(Std.string(count));
	}
	
	public function increaseArmyCount(amount : Int = 1) : Bool
	{
		if ( armyCount + amount > Registry.maxArmyCountPerTerritory )
			return false;
		
		armyCount += amount;
		setArmyCount(armyCount);
		
		return true;
	}
	
	public function highlightNeighbors() 
	{
		for ( tNeighborNum in neighbors )
		{
			var neighborNum : Int = tNeighborNum;
			if ( Registry.territoryManager.getTerritory(neighborNum).ownerNumber == ownerNumber )
				continue;
			
			Registry.territoryManager.getTerritory(neighborNum).select(true);
		}
	}
	
	public function unhighlightNeighbors() 
	{
		for ( tNeighborNum in neighbors )
		{
			var neighborNum : Int = tNeighborNum;
			Registry.territoryManager.getTerritory(neighborNum).deselect(true);
		}
	}
	
	public function checkIfEnemyNeighbor(territoryNumber:Int) 
	{
		if ( Registry.territoryManager.getTerritory(territoryNumber).ownerNumber == ownerNumber )
			return false;
			
		return Lambda.has(neighbors, territoryNumber);
	}
	
	public function select(isNeighborSelect : Bool = false) 
	{
		for ( tHexaTile in members )
		{
			var hexaTile : HexaTile = tHexaTile;
			
			if ( isNeighborSelect )
				hexaTile.sprite.scaleX._ = 0.5;
			else
			{
				hexaTile.sprite.rotation._ = 90;
				hexaTile.sprite.scaleX._ = 0.5;
			}
		}
	}
	
	public function deselect(isNeighborDeselect : Bool = false)
	{
		for ( tHexaTile in members )
		{
			var hexaTile : HexaTile = tHexaTile;
			
			if ( isNeighborDeselect )
				hexaTile.sprite.scaleX._ = 1;
			else
			{
				hexaTile.sprite.rotation._ = 0;
				hexaTile.sprite.scaleX._ = 1;
			}
		}
	}
}