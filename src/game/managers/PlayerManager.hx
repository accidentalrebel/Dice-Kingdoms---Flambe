package game.managers;
import flambe.Component;
import game.ai.EnemyAI;
import game.objects.Player;
import game.Registry;

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
		
		setCurrentPlayer(1);
	}
	
	public function getPlayer(playerNum : Int) 
	{
		return playerList[playerNum-1];
	}
	
	public function initializeArmies() 
	{
		for ( tPlayer in playerList )
		{
			var player : Player = tPlayer;
			player.randomlyAssignArmies(Registry.initialArmyCount - Registry.territoryPerPlayer);			
		}
	}
	
	public function nextPlayer() 
	{
		// We add armies according to the number of territories
		currentPlayer.randomlyAssignArmies(currentPlayer.territories.length);
		
		// We then increase our playerNumber
		currentPlayerNumber += 1;
		if ( currentPlayerNumber >= numOfPlayers )
			currentPlayerNumber = 1;			
		
		// We then set the current player
		setCurrentPlayer(currentPlayerNumber);
		
		// We then determine if AI would take over
		if ( !currentPlayer.isHuman )
			currentPlayer.ai.startPlanning();
	}
	
	private function setCurrentPlayer(playerNumber:Int) 
	{
		currentPlayerNumber = playerNumber;
		currentPlayer = getPlayer(currentPlayerNumber);
		//Registry.gameGUI.playerIndicator.color = getPlayer(currentPlayerNumber).territoryColor;
	}
	
}