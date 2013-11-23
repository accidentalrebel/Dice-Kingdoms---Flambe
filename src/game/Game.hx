package game;
import flambe.Component;
import flambe.display.Sprite;
import flambe.Entity;
import game.gui.GUILayer;
import game.indigoEngine.IEMainStage;
import game.layers.Layer;
import game.managers.BattleManager;
import game.managers.GameplayManager;
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
		
		
		// We create the managers
		owner.add(Registry.gameplayManager = new GameplayManager());
		owner.add(Registry.battleManager = new BattleManager());
		owner.add(Registry.inputManager = new InputManager());
		owner.add(Registry.playerManager = new PlayerManager());
		owner.add(Registry.territoryManager = new TerritoryManager());
		
		// We create the layers
		owner.addChild(new Entity().add(Registry.gameLayer = new Layer()));
		owner.addChild(new Entity().add(Registry.guiLayer = new GUILayer()));
		
		// We initialize the playareas and players
		owner.addChild(new Entity().add(Registry.playArea = new PlayArea()));
		Registry.playerManager.initialize();
		Registry.playArea.assignTerritories();
		Registry.playerManager.initializeArmies();
		
		//CameraManager.focusOnRandomTerritory(PlayerManager.currentPlayerNumber);
		
		Registry.gameLayer.centerOnScreen();
	}
}