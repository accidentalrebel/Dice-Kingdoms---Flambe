package game.managers;
import flambe.Component;
import game.objects.Player;

/**
 * ...
 * @author Karlo
 */
class PlayerManager extends Component
{
	public var numOfPlayers:Int = 8;
	public var numOfHumans:Int = 1;
	public var playerList:Array<Player>;
	public var currentPlayerNumber : Int = 1;
	public var currentPlayer : Player;
	
	public function new() 
	{
	}
	
	public function initialize(tNumOfPlayers : Int = 8, tNumOfHumans : Int = 1) 
	{
		numOfPlayers = tNumOfPlayers;
		numOfHumans = tNumOfHumans;
		playerList = new Array<Player>();
		
		var isHuman : Bool = true;
		for ( i in 1...(numOfPlayers+1) )
		{
			if ( tNumOfHumans <= 0 )
				isHuman = false;
			else
				isHuman = true;
			
			var player : Player = new Player();
			player.initialize(i, isHuman);
			playerList.push(player);
			
			tNumOfHumans--;
		}
		
		//setCurrentPlayer(1);
	}
	
}