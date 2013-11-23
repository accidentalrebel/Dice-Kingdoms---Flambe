package game.ai;
import flambe.Component;
import game.ai.EnemyAI.AIType;
import game.objects.Player;

/**
 * ...
 * @author Karlo
 */
enum AIType {
	NORMAL;			// Attacks only at equal armies or more
	AGGRESSIVE;		// Attacks even though enemy is one army bigger
	DEFENSIVE;		// Only attacks if army is 7 or 8 in count
	CAUTIOUS;		// Only attacks if they have more than one army
}  
 
class EnemyAI extends Component
{
	var playerScript : Player;
	var aiType : AIType;

	public function new() 
	{
		
	}
	
	public function initialize()
	{
		this.playerScript = this.owner.parent.get(Player);
		
		 //We roll for the AI type
		aiType = Type.createEnumIndex(AIType, Std.int(Math.floor(Math.random() * Type.allEnums(AIType).length)));
		trace(Std.string(aiType));
	}
	
	public function startPlanning()
	{
	
	}
	
}