package game;
import flambe.asset.AssetPack;
import flambe.math.Point;
import game.managers.InputManager;
import game.managers.PlayerManager;

/**
 * ...
 * @author Karlo
 */
class Registry
{
	public static var colorList : Array<Int> = [ 0xFF0000, 0x00FF00, 0x0000FF, 0xFFFF00, 0x00FFFF, 0xFF00FF, 0x000033, 0xFFFFFF ];		
	
	static public var pack:AssetPack;
	static public var playAreaPadding : Point = new Point(15, 15);
	static public var inputManager:InputManager;
	static public var playerManager:PlayerManager;
}