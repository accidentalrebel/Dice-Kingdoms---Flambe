package game.indigoEngine;
import flambe.asset.AssetPack;
import flambe.Component;
import flambe.display.FillSprite;
import flambe.display.Font;
import flambe.display.Sprite;
import flambe.display.TextSprite;
import flambe.Entity;
import flambe.input.Key;
import flambe.input.KeyboardEvent;
import flambe.input.PointerEvent;
import flambe.input.TouchPoint;
import flambe.script.CallFunction;
import flambe.script.Delay;
import flambe.script.Repeat;
import flambe.script.Script;
import flambe.script.Sequence;
import flambe.System;



/**
 * ...
 * @author Melody
 */
class IEVersion extends Component
{
	/**
	 *	Pack where the version font is
	 */
	static public var versionPack:AssetPack;
	
	/**
	 *	Game version
	 */
	static public var gameVersion:String = "Version 1";
	
	/**
	 *	Game details
	 */
	static public var gameDetails:String = "Details";
	
	/**
	 *	Store the code entered
	 */
	static private var code:String;
	
	/**
	 *	Script that counts how many seconds is the touch down
	 */
		static private var holdScript:Script;
	
	/**
	 *	Entity that shows the game information
	 */
	static private var infoEntity:Entity;
	
	/**
	 *	TextSprite that will display the game version
	 */
	static private var versionText:TextSprite;
	
	/**
	 *	TextSprite that will display the game details
	 */
	static private var detailsText:TextSprite;
	
	public function new() 
	{
		code = "";
		holdScript = new Script();
	}
	
	override public function onAdded():Void
	{
		super.onAdded();
		
		#if flash
			System.keyboard.up.connect(keyUpHandler);
		#else
			System.touch.down.connect(detectHold);
			System.touch.up.connect(cancelTouch);
			owner.add(holdScript);
		#end
		
		var fillSprite:FillSprite = new FillSprite(0xFFFFFF, IEMainStage.width, IEMainStage.height * 0.1);
		
		var xFSprite:FillSprite = new FillSprite(0x4B0082, 30 * IEMainStage.resolutionModifier, 30 * IEMainStage.resolutionModifier);
		xFSprite.x._ = IEMainStage.width - xFSprite.getNaturalWidth();
		xFSprite.pointerUp.connect(hideInformation);
		
		var font:Font = new Font(versionPack, "Version_Font");
		
		var xText:TextSprite = new TextSprite(font, "X");
		xText.centerAnchor();
		xText.x._ = xFSprite.x._  + (xFSprite.getNaturalWidth() / 2);
		xText.y._ = xFSprite.y._  + (xFSprite.getNaturalHeight() / 2);
		xText.disablePointer();
		
		versionText = new TextSprite(font, gameVersion);
		versionText.x._ = IEMainStage.width * 0.01;
		
		detailsText = new TextSprite(font, gameDetails);
		detailsText.x._ = versionText.x._;
		detailsText.y._ = IEMainStage.height * 0.05;
		
		infoEntity = new Entity().add(fillSprite)
								 .addChild(new Entity().add(xFSprite))
								 .addChild(new Entity().add(xText))
								 .addChild(new Entity().add(versionText))
								 .addChild(new Entity().add(detailsText));
	}
	
	/**
	 * Handles all key up events
	 */
	function keyUpHandler (event:KeyboardEvent)
	{
		trace(Std.string(event.key));
		
		if(event.key != Key.Enter)
			code = code + Std.string(event.key);
		
		if (event.key == Key.Enter)
		{
			if (code == "INDIGO")
				showInformation();
			
			trace(code);
			code = "";
			trace(code);
		}
	}
	
	/**
	 * Detects if touch down is hold
	 */
	function detectHold(event:TouchPoint)
	{
		trace("detectHold");
		var seconds:Int = 0;
		
		holdScript.run(new Repeat(new Sequence([
					   new CallFunction( function() { seconds++; } ),
					   new Delay(1),
					   new CallFunction( function() {
														if (seconds == 2)
														{
															showInformation();
															holdScript.stopAll();
														}
													} )
					   ])));
	}
	
	/**
	 * Stop holdScript
	 */
	function cancelTouch(event:TouchPoint)
	{
		trace("cancelTouch");
		holdScript.stopAll();
	}
	
	/**
	 * Show infoSprite
	 */
	function showInformation()
	{
		trace("showInformation");
		System.root.addChild(infoEntity);
	}
	
	/**
	 * Hide infoSprite
	 */
	function hideInformation(event:PointerEvent)
	{
		trace("hideInformation");
		System.root.removeChild(infoEntity);
	}
	
	/**
	 * Set game version
	 * @param	version		Game version that will be displayed
	 */
	public static function setVersion(version:String)
	{
		gameVersion = version;
	}
	
	/**
	 * Set game details
	 * @param	details		Game details that will be displayed
	 */
	public static function setDetails(details:String)
	{
		gameDetails = details;
	}
	
	/**
	 * Set game version and game details
	 * @param	version		Game version that will be displayed
	 * @param	details		Game details that will be displayed
	 */
	public static function setInformation(version:String, details:String)
	{
		gameVersion = version;
		gameDetails = details;
	}
}