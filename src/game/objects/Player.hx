package game.objects;
import flambe.Component;
import flambe.Entity;
import game.ai.EnemyAI;
import game.tools.ArrayTools;

/**
 * ...
 * @author Karlo
 */
class Player extends Component
{
	public var territories:Array<Int>;
	public var territoryColor:String;
	public var isHuman:Bool = false;
	public var ai:EnemyAI;	
	public var playerNum:Int;

	public function new() 
	{
		
	}
	
	public function initialize(playerNum : Int, isHuman : Bool )
	{
		this.playerNum = playerNum;
		this.isHuman = isHuman;
		
		if ( !this.isHuman )
		{
			this.ai = new EnemyAI();
			owner.addChild(new Entity().add(this.ai));
			this.ai.initialize();
		}
		
		this.territoryColor = Registry.colorList[playerNum-1];
		this.territories = new Array<Int>();
	}
	
	public function randomlyAssignArmies(maxArmyCount:Int) 
	{
		var territoryListCopy : Array<Int> = ArrayTools.hardCopyArray(territories);
		
		while ( maxArmyCount > 0 && territoryListCopy.length > 0)
		{
			var roll : Int = Std.random(territoryListCopy.length);
			var territoryNum : Int = territoryListCopy[roll];
			var territory : Territory = Registry.territoryManager.getTerritory(territoryNum);
			
			if ( territory.increaseArmyCount() )
				maxArmyCount--;
			else
				territoryListCopy.remove(territoryNum);
		}
	}
}