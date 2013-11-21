package game.indigoEngine;

import flambe.script.Action;
import flambe.util.Disposable;

/**
* ...
* @author ...
*/
class IEScript extends flambe.script.Script
{
	/**
     * Whether onUpdate function runs or not
     */
	static private var isPaused:Bool = false;
	
	public function new()
	{
		super();
		
		IEEngine.pauseSignal.connect(pause);
		IEEngine.resumeSignal.connect(resume);
	}
	
	/**
     * Sets isPaused to true to stop onUpdate function
     */
	private function pause()
	{
		isPaused = true;
	}
	
	/**
     * Sets isPaused to true to resume onUpdate function
     */
	public function resume()
	{
		isPaused = false;
	}
	
	/**
     * Overrides onUpdate function of Script.hx
     */
	override public function onUpdate(dt:Float)
	{
		if ( isPaused )
		return;

		super.onUpdate(dt);
	}
	
	/**
     * Overrides run function of Script.hx
     */
	override public function run(action:Action):Disposable
	{
		isPaused = false;

		return super.run(action);
	}
}


