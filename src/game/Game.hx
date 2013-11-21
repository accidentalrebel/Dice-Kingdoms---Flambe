package game;
import flambe.Component;
import flambe.Entity;

/**
 * ...
 * @author Karlo
 */
class Game extends Component
{
	var playArea:PlayArea;

	public function new() 
	{
		owner.addChild(new Entity().add(playArea = new PlayArea()));
	}
	
}