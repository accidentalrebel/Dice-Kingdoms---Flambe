package game.objects;
import flambe.Component;

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
}