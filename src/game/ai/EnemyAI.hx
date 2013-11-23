package game.ai;
import flambe.Component;
import game.objects.Player;

/**
 * ...
 * @author Karlo
 */
class EnemyAI extends Component
{
	var playerScript : Player;

	public function new() 
	{
		this.playerScript = this.owner.parent.get(Player);
		
		// We roll for the AI type
		//aiType = Type.createEnumIndex(AIType, Std.int(Math.floor(Math.random() * Type.allEnums(AIType).length)));
		//trace(Std.string(aiType));
	}
	
	public function startPlanning()
	{
	
	}
	
}