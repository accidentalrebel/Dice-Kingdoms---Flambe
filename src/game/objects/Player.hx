package game.objects;
import flambe.Component;

/**
 * ...
 * @author Karlo
 */
class Player extends Component
{
	public var territories:Array<Int>;
	public var territoryColor:String;
	public var isHuman:Bool = false;
	//public var ai:EnemyAI;	
	public var playerNum:Int;

	public function new() 
	{
		
	}
	
	public function initialize(playerNum : Int, isHuman : Bool )
	{
		this.playerNum = playerNum;
		this.isHuman = isHuman;
		
		//if ( !this.isHuman )
			//this.ai = new EnemyAI(this);
		
		this.territoryColor = Registry.colorList[playerNum-1];
		this.territories = new Array<Int>();
	}
	
}