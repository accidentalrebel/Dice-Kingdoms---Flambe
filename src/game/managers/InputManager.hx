package game.managers;
import flambe.Component;
import flambe.input.PointerEvent;
import flambe.input.TouchPoint;
import flambe.math.Point;
import flambe.System;
import game.indigoEngine.IEMainStage;
import game.Registry;
import game.tools.MathTools;

/**
 * ...
 * @author Karlo
 */
class InputManager extends Component
{
	var startTouchPos : Point = null;
	var screenDrag : Float = 0.5;
	var distanceToDrag : Float = 10;
	var isDragging:Bool = false;
	
	public function new() 
	{
		System.pointer.down.connect(onTouchDown);
		System.pointer.up.connect(onTouchUp);
	}
	
	function onTouchDown(touchPoint : PointerEvent) 
	{
		Registry.gameplayManager.onClick(touchPoint.viewX / IEMainStage.stageScale, touchPoint.viewY / IEMainStage.stageScale);
	}
	
	function onTouchUp(touchPoint : PointerEvent) 
	{
		
	}
	
	override public function onUpdate(dt:Float)
	{
		super.onUpdate(dt);
		
		
		
		//var distanceFromStartTouch : Float = 0;
		//if ( startTouchPos != null )
			//distanceFromStartTouch = MathTools.getDistance
				//(startTouchPos, new Point(System.pointer.x, System.pointer.y));
		//
		//if ( startTouchPos == null && System.pointer.justPressed() )
		//{
			//startTouchPos = new Point(System.pointer.x, System.pointer.y);
		//}
		//else if ( startTouchPos != null && FlxG.pointer.justReleased )
		//{
			//if ( !isDragging && distanceFromStartTouch < distanceToDrag )			
				//GameplayManager.onClick(FlxG.pointer.x, FlxG.pointer.y);			
				//
			//startTouchPos = null;
			//isDragging = false;
		//}
		//
		//if ( startTouchPos != null && distanceFromStartTouch > distanceToDrag)
		//{			
			//isDragging = true;
			//FlxG.camera.scroll.x = (FlxG.camera.scroll.x + startTouchPos.x - FlxG.pointer.screenX) * screenDrag;
			//FlxG.camera.scroll.y = (FlxG.camera.scroll.y + startTouchPos.y - FlxG.pointer.screenY) * screenDrag; 
		//}
		
		//if ( FlxG.keys.justPressed.Z )
			//CameraManager.toggleZoom();
	}
}