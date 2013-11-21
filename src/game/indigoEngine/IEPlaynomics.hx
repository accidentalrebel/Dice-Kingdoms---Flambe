package game.indigoEngine;
import flambe.System;

/**
 * ...
 * @author 
 */
class IEPlaynomics
{
	private static var playnomicsPlayerID : Int = 0;	
	
	public static function setup(appID:Float, appName : String, playerID : Int) 
	{		
		#if flash
			playnomicsPlayerID = playerID;
			if ( playnomicsPlayerID == 0 )
			{
				playnomicsPlayerID = generatePlayerID();
			}		
			
			System.external.call("setupPlaynomics", [Std.string(appID), appName, Std.string(playnomicsPlayerID)]);			
			trace("Playnomics has been set up");
		#end
	}
	
	public static function sendMilestone(milestoneName : String) 
	{
		System.external.call("sendMilestone", [milestoneName]);
	}
	
	private static function generatePlayerID()
	{	
		return Math.floor(Math.random() * (Math.pow(2, 31) - 1));
	}	
}