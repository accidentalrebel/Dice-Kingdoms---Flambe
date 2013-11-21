package game.indigoEngine;
import flambe.asset.Manifest;
import flambe.System;

/**
 * ...
 * @author 
 */
class IEAssetLoader
{	
	public static function load(toLoad, onSuccess)
	{			
		// We load the manifest. Take note that we also consider the asset size.
		var manifest : Manifest = Manifest.build(toLoad + "-" + IEMainStage.assetSize);		
		var base : String = "";
		
		#if js
			base = IEEmbedProxy.base;		// We get the base for javascript
		#end
		
		if (base != "") { manifest.externalBasePath = base + "/assets/"; }
		
        var loader = System.loadAssetPack(manifest);
        loader.get(onSuccess);
		
		return loader;
	}	
}