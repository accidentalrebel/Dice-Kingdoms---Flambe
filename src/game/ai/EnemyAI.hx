package game.ai;
import flambe.Component;
import flambe.Entity;
import flambe.script.CallFunction;
import flambe.script.Delay;
import flambe.script.Script;
import flambe.script.Sequence;
import game.ai.EnemyAI.AIType;
import game.managers.GameplayManager;
import game.objects.Player;
import game.objects.Territory;
import game.Registry;
import game.tools.CallFunction1;
import game.tools.CallFunction2;

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
	var playerComponent : Player;
	var aiType : AIType;
	var aiScript:Script;

	public function new() 
	{
		
	}
	
	public function initialize()
	{
		this.playerComponent = this.owner.parent.get(Player);
		
		 //We roll for the AI type
		aiType = Type.createEnumIndex(AIType, Std.int(Math.floor(Math.random() * Type.allEnums(AIType).length)));
		trace(Std.string(aiType));
		
		// We setup the script
		owner.addChild(new Entity().add(aiScript = new Script()));
	}
	
	public function startPlanning()
	{
		trace("AI is taking over");
		
		function getAvailableTerritories() : Null<Territory>
		{
			// We loop through each territory
			for ( tTerritory in playerComponent.territories )
			{ 
				var territory : Territory = Registry.territoryManager.getTerritory(tTerritory);
				if ( territory.armyCount > 1
					&& territory.ownerNumber == playerComponent.playerNum 
					&& territory.neighbors.length >= 1
					&& territory.markAsChecked == false )
					{
						if ( aiType == AIType.DEFENSIVE 		// If the AI is defensive
							&& territory.armyCount < 7 )		// And the territory does not meet the army requirement
							continue;
							
						return territory;
					}
			}
			
			// We did not get any territories
			return null;
		}
		
		function endMove()
		{
			// We loop through each territory and mark each territory as unchecked
			for ( tTerritory in playerComponent.territories )
			{ 
				var territory : Territory = Registry.territoryManager.getTerritory(tTerritory);
				territory.markAsChecked = false;
			}
			
			// We then go to the next player
			Registry.gameplayManager.nextPlayer();
		}
		
		function getNextMove()
		{
			//aiScript.stopAll();
			
			var sequence : Sequence = new Sequence();
			var hasTerritoryToAttack : Bool = false;
			var territory : Null<Territory> = getAvailableTerritories();
			
			sequence.add(new Delay(0.75));
			
			// If no territory is availble, we now end our turn
			if ( territory == null )
			{
				trace("Did not get any territories, going to the next player");
				endMove();
				return;
			}
				
			// We go through each neighbors
			// TODO: Pick a random neighbor instead of picking the first one on the list
			for ( tNeighbor in territory.neighbors )
			{
				trace("GOING THROUGH A NEIGHBOR");
				
				var neighborTerritory : Territory = Registry.territoryManager.getTerritory(tNeighbor);
				
				// If I own this territory
				if ( neighborTerritory.ownerNumber == territory.ownerNumber )
					continue;
				
				trace("I DO NOT OWN THE TERRITORY. CONTINUING");
					
				if ( ( (aiType == AIType.NORMAL || aiType == AIType.DEFENSIVE )
						&& territory.armyCount >= neighborTerritory.armyCount )			// If we have equal or more than enemy
					|| (aiType == AIType.CAUTIOUS 
						&& territory.armyCount > neighborTerritory.armyCount)			// If we have more army count than enemy
					|| (aiType == AIType.AGGRESSIVE
						&& territory.armyCount >= neighborTerritory.armyCount - 1 ))	// If even the enemy has one army more than mine
				{
					trace("SETTING UP SEQUENCE");
					
					hasTerritoryToAttack = true;
					
					// We highlight the attacker and the one being attacked
					sequence.add(new CallFunction2(Registry.playArea.selectTerritory, territory, false));
					sequence.add(new CallFunction2(Registry.playArea.selectTerritory, neighborTerritory, true));
					sequence.add(new Delay(1));
					
					// We then start the battle and unhighlight territories
					sequence.add(new CallFunction2(Registry.battleManager.startAttack, territory.territoryNumber, neighborTerritory.territoryNumber));
					sequence.add(new CallFunction1(Registry.playArea.deselectTerritory, territory.territoryNumber));
					sequence.add(new CallFunction1(Registry.playArea.deselectTerritory, neighborTerritory.territoryNumber));
					break;
				}
			}
			
			// If there are no neighbors to attack
			if ( !hasTerritoryToAttack )
			{
				territory.markAsChecked = true;
			}
			
			// We run the sequence and once that is done, get the next move
			sequence.add(new CallFunction(getNextMove));
				
			// We run the sequence
			trace("running the sequence");
			aiScript.run(sequence);
		}
		
		getNextMove();
	}
}