package game.indigoEngine;

/**
 * ...
 * @author 
 */
class IEEmbedProxy
{
	static public var base(get_base, never) : String;
	static public function get_base() : String
	{ 
		return callJSEmbedMethod("baseUrl()"); 
	}
	
	//Use this number to scale game in update(dt : Float)
	static public var canvasScale(get_canvasScale, never) : Float;
	static public function get_canvasScale() : Float
	{ 
		return Std.parseFloat(callJSEmbedMethod("canvasScale()")); 
	}
	
	static public function callJSEmbedMethod( pRequest:String ) : Dynamic
	{
		// Make sure you include () parenthesis and any parameters needed by the method.
		#if js
			try
			{ 
				var result = (js.Lib.eval("jsembed." + pRequest)); 
				return result == null?"":result; 
			} 
			catch( err:Dynamic )
			{ 
				// Nothing 
				trace("[JSEmbedProxy](callJSEmbedMethod) Error: JSEmbed missing, or can't handle request : ");
				return "Error";
			}
		#end
	}
}