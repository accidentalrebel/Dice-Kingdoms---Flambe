package game.indigoEngine;
import flambe.swf.Library;

/**
 * ...
 * @author Melody
 */
class IEMoviePlayer extends flambe.swf.MoviePlayer
{
	/**
     * Whether onUpdate function runs or not
     */
	static private var isPaused:Bool = false;
	
	public function new(lib:Library) 
	{
		super.new(lib);
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
     * Overrides onAdded function of MoviePlayer.hx
     */
	override public function onAdded()
	{
		super.onAdded();
		
		IEEngine.pauseSignal.connect(pause);
		IEEngine.resumeSignal.connect(resume);
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
}