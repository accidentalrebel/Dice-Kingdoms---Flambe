package game.managers;
import flambe.Component;
import game.objects.Territory;

/**
 * ...
 * @author Karlo
 */
class TerritoryManager extends Component
{

	public function new() 
	{
		
	}
	
	public var territoryList : Array<Territory>;

	override public function onAdded() 
	{
		super.onAdded();
		territoryList = new Array<Territory>();
	}
	
	public function getTerritory(territoryNumber : Int) : Territory
	{
		return territoryList[territoryNumber];
	}
}