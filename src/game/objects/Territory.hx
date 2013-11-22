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
}