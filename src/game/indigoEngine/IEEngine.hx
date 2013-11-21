package game.indigoEngine;
import flambe.asset.AssetPack;
import flambe.System;
import flambe.util.Signal0;

/**
 * ...
 * @author 
 */
class IEEngine
{
	/**
	 *	Pause signal
	 */
	static public var pauseSignal:Signal0 = new Signal0();
	
	/**
	 *	Resume signal
	 */
	static public var resumeSignal:Signal0 = new Signal0();
	
	/**
	 * Initializes the engine and the system
	 * @param	hdEnabled		Switch on whether to offer HD version or not
	 * @param	designSizeWidth		the width in which the game is designed
	 * @param	designSizeHeight	the width in which the game is designed
	 */
	public static function init(hdEnabled : Bool = false, designSizeWidth : Float = 960, designSizeHeight : Float = 560)
	{
		System.init();
		var  loader = IEAssetLoader.load("indigoEngine", onSuccess);
		System.root.add(new IEMainStage(hdEnabled, designSizeWidth, designSizeHeight));
		#if flash
			//IEPlaynomics.setup(0123456789, "NameOfGame", 0);
		#end
	}
	
	private static function onSuccess (pack :AssetPack)
    {
		trace("onSucces");
		IEVersion.versionPack = pack;
		System.root.add(new IEVersion());
	}
	
	/**
	 * Emits the pause signal
	 */
	public static function pauseGame()
	{
		pauseSignal.emit();
	}
	
	/**
	 * Emits the resume signal
	 */
	public static function resumeGame()
	{
		resumeSignal.emit();
	}
}