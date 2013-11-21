package game;
import flambe.Component;
import flambe.Entity;
import game.managers.InputManager;

/**
 * ...
 * @author Karlo
 */
class Game extends Component
{
	var playArea:PlayArea;

	public function new()
	{
		
	}
	
	override public function onAdded()
	{
		super.onAdded();
		owner.add(Registry.inputManager = new InputManager());
		owner.addChild(new Entity().add(playArea = new PlayArea()));
	}
}