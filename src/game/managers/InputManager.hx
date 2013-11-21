package game.managers;
import flambe.Component;
import flambe.math.Point;

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
	}
	
	override public function onUpdate(dt:Float)
	{
		super.onUpdate(dt);
		
		//var distanceFromStartTouch : Float = 0;
		//if ( startTouchPos != null )
			//distanceFromStartTouch = FlxMath.getDistance(startTouchPos, new FlxPoint(FlxG.mouse.x, FlxG.mouse.y));
		//
		//if ( startTouchPos == null && FlxG.mouse.justPressed )
		//{
			//startTouchPos = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
		//}
		//else if ( startTouchPos != null && FlxG.mouse.justReleased )
		//{
			//if ( !isDragging && distanceFromStartTouch < distanceToDrag )			
				//GameplayManager.onClick(FlxG.mouse.x, FlxG.mouse.y);			
				//
			//startTouchPos = null;
			//isDragging = false;
		//}
		//
		//if ( startTouchPos != null && distanceFromStartTouch > distanceToDrag)
		//{			
			//isDragging = true;
			//FlxG.camera.scroll.x = (FlxG.camera.scroll.x + startTouchPos.x - FlxG.mouse.screenX) * screenDrag;
			//FlxG.camera.scroll.y = (FlxG.camera.scroll.y + startTouchPos.y - FlxG.mouse.screenY) * screenDrag; 
		//}
		//
		//if ( FlxG.keys.justPressed.Z )
			//CameraManager.toggleZoom();
	}
}