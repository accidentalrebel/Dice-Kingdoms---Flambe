package game.managers;
import flambe.Component;
import game.objects.HexaTile;
import game.objects.Territory;
import game.Registry;

/**
 * ...
 * @author Karlo
 */
class GameplayManager extends Component
{
	private var selectedTerritory : Int = -1;
	
	public function new() 
	{
		
	}
	
	public function onClick(xPos:Float, yPos:Float)
	{
		function selectTerritoryAndHighlightNeighbors(clickedTerritory : Territory) : Int
		{
			if (clickedTerritory.ownerNumber != Registry.playerManager.currentPlayerNumber 
				|| clickedTerritory.armyCount <= 1)
					return -1;
		
			Registry.playArea.selectTerritory(clickedTerritory);
			clickedTerritory.highlightNeighbors();
			return clickedTerritory.territoryNumber;
		}
		
		var clickedTile : HexaTile = Registry.playArea.checkForClickedTiles(xPos, yPos);
		if ( clickedTile != null )
		{
			var clickedTerritory : Territory = Registry.territoryManager.getTerritory(clickedTile.territoryNumber);
			
			if ( selectedTerritory != -1)		// If there is a selected territory
			{
				// We check if what we clicked is a neighbor of the selected territory 
				if ( Registry.territoryManager.getTerritory(selectedTerritory).checkIfEnemyNeighbor(clickedTile.territoryNumber) )
				{
					Registry.battleManager.startAttack(selectedTerritory, clickedTile.territoryNumber);
					selectedTerritory = Registry.playArea.deselectTerritory(selectedTerritory);					
				}
				// We check if we clicked the same territory
				else if ( selectedTerritory == clickedTile.territoryNumber )
				{
					selectedTerritory = Registry.playArea.deselectTerritory(selectedTerritory);					
				}
				else
				{
					// We deselect a selected territory
					selectedTerritory = Registry.playArea.deselectTerritory(selectedTerritory);
					
					// We select the clicked territory
					selectedTerritory = selectTerritoryAndHighlightNeighbors(clickedTerritory);
				}
			}
			else	// If there is no selected territory
			{
				// We select the clicked territory
				selectedTerritory = selectTerritoryAndHighlightNeighbors(clickedTerritory);
			}
		}
	}
	
	public function nextPlayer() 
	{
		Registry.playerManager.nextPlayer();
		Registry.guiLayer.updatePlayerIndicator();
		
		trace("Current player is human: " + Registry.playerManager.currentPlayer.isHuman);
		if ( Registry.playerManager.currentPlayer.isHuman )
		{
			//CameraManager.zoomIn();
			//CameraManager.focusOnRandomTerritory(PlayerManager.currentPlayerNumber);
		}
		//else
			//CameraManager.zoomOut();			
	}
}