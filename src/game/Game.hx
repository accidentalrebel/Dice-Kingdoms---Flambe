package game;
import flambe.Component;
import flambe.Entity;
import game.managers.InputManager;
import game.managers.PlayerManager;
import game.managers.TerritoryManager;

/**
 * ...
 * @author Karlo
 */
class Game extends Component
{
	public function new()
	{
		
	}
	
	override public function onAdded()
	{
		super.onAdded();
		owner.add(Registry.inputManager = new InputManager());
		owner.add(Registry.playerManager = new PlayerManager());
		owner.add(Registry.territoryManager = new TerritoryManager());
		
		owner.addChild(new Entity().add(Registry.playArea = new PlayArea()));
		Registry.playerManager.initialize();
		Registry.playArea.assignTerritories();
	}
}