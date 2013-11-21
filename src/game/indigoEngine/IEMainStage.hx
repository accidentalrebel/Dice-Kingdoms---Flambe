package game.indigoEngine;
import flambe.Component;
import flambe.display.Sprite;
import flambe.Entity;
import flambe.math.Point;
import flambe.System;

/**
 * ...
 * @author 
 */
class IEMainStage extends Sprite
{
	/**
	 * Whether the engine has HD version enabled
	 */
	static private var hdEnabled:Bool;
	
	/**
	 * Can be used to check if the game is in HD resolution
	 * Automatically set by setResolution function
	 */
	static public var isHD (default, null): Bool = false;
	
	/**
	 * The size dimensions in which the game is designed.
	 * Primarily used in determining the scaling of the game.
	 */
	static public var designSize (default, null): Point = new Point(960, 560);
	
	/**
	 * The asset size in string format.	 
	 */
	static public var assetSize (default, null): String = "sd";	
	
	/**
	 * The new scale of the stage after it was changed due to auto-scaling.
	 * You can use this for scaling other values (i.e. Adjusting the touch input)
	 */
	static public var stageScale (default, null):Float = 1;
	
	/**
	 * Gets the width of the mainStage
	 */
	static public var width (get_width, null):Float = 1;
		
	/**
	 * Gets the height of the mainStage
	 */
	static public var height (get_height, null):Float = 1;	
	
	/**
	 * Use this when you need to specify a specific position for an object.
	 * This takes into account the current resolution (HD or SD) and does the necessary adjustments.
	 */
	static public var resolutionModifier (default, null): Float = 1;

	/**
	 * Initializes the main stage
	 * @param 	hdEnabled			Whether HD version is enabled or not
	 * @param	designSizeWidth		the width in which the game is designed
	 * @param	designSizeHeight    the width in which the game is designed
	 */
	public function new(isHdEnabled : Bool = false, designSizeWidth : Float = 960, designSizeHeight : Float = 560) 
	{
		hdEnabled = isHdEnabled;
		setResolution("sd");
		IEMainStage.designSize = new Point(designSizeWidth, designSizeHeight);			
		determineAssetSize();
		
		super();
	}
	
	override public function onAdded():Void
	{
		super.onAdded();	
		
		#if flash
			// Forces the canvas size to the given dimensions
			// This is good if the game would only be one-size like Flash
			System.stage.requestResize(960, 560);
		#end	
		
		resize();
	}
	
	override public function onUpdate(dt:Float):Void 
	{
		super.onUpdate(dt);
		resize();
	}
	
	/**
	 * Resizes the mainStage
	 */
	function resize() 
	{
		//TODO: Only scale if a change is detected
		#if js
			var tWidth  : Float= System.stage.width;
			var tHeight  : Float= System.stage.height;
			var widthIdeal  : Float= designSize.x;
			var heightIdeal  : Float= designSize.y;
			var tScale : Float = 1;
			if ( tWidth / widthIdeal < tHeight / heightIdeal ) 
				tScale = tWidth/widthIdeal;
			else 
				tScale = tHeight/heightIdeal;         
			
			stageScale = tScale;
			
			//stageScale = IEEmbedProxy.canvasScale;		
			
			// If we are in HD mode
			if ( hdEnabled && isHD )
				stageScale /= 2;
			
			this.setScale(stageScale);
		#end
	}
	
	/**
	 * Determines if game were to switch to HD assets
	 */
	function determineAssetSize() 
	{	
		#if js			
			if ( hdEnabled && System.stage.width > IEMainStage.designSize.x)
			{
				trace("Switching to HD version");
				setResolution("hd");
				designSize.x *= 2;
				designSize.y *= 2;
			}
		#end
	}
	
	/**
	 * Sets the resolution for the game and adjusts all needed values
	 * @param	resolutionString	Accepts "hd" and "sd"
	 */
	function setResolution(resolutionString:String) 
	{
		if (resolutionString == "hd")
		{
			isHD = true;
			assetSize = "hd";
			resolutionModifier = 2;
		}
		else
		{
			isHD = false;
			assetSize = "sd";
			resolutionModifier = 1;
		}	
	}
	
	/**
	 * Adds an entity to the main stage
	 * @param	toAdd	theEntity to add
	 */
	static public function addChild(toAdd : Entity)
	{		
		System.root.addChild(toAdd);
	}
	
	/**
	 * Returns the width of the mainStage
	 * It is actualy just the current design size but it here for convenience
	 */
	static private function get_width() 
	{
		return designSize.x;
	}
	
	/**
	 * Returns the height of the mainStage
	 * It is actualy just the current design size but it here for convenience
	 */
	static private function get_height() 
	{
		return designSize.y;
	}
}