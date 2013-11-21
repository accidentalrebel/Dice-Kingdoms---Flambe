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
	static public var pack:AssetPack;
	static public var playAreaPadding : Point = new Point(15, 15);
	static public var inputManager:InputManager;
	static public var playerManager:PlayerManager;
}