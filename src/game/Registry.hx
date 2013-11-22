package game;
import flambe.asset.AssetPack;
import flambe.math.Point;
import game.managers.GameplayManager;
import game.managers.InputManager;
import game.managers.PlayerManager;
import game.managers.TerritoryManager;
import game.PlayArea;

/**
 * ...
 * @author Karlo
 */
class Registry
{
	public static var colorList : Array<String> = [ "red", "blue", "green", "yellow", "white", "black", "pink", "lightBlue" ];		
	public static var maxTerritories : Int = Math.floor(PlayArea.playAreaRows / 5) * Math.floor(PlayArea.playAreaCols / 5);	
	static public var territoryPerPlayer:Int;

	static public var initialArmyCount:Int = 20;
	static public var maxArmyCountPerTerritory : Int = 8;
	
	static public var pack:AssetPack;
	static public var playAreaPadding : Point = new Point(15, 15);
	static public var inputManager:InputManager;
	static public var playerManager:PlayerManager;
	static public var territoryManager:TerritoryManager;
	static public var playArea:PlayArea;
	static public var gameplayManager : GameplayManager;
}