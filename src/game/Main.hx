package game;

import flambe.Entity;
import flambe.input.PointerEvent;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.display.FillSprite;
import flambe.display.ImageSprite;
import game.indigoEngine.IEAssetLoader;
import game.indigoEngine.IEEngine;
import game.indigoEngine.IEMainStage;

class Main
{
	static private var plane;
    private static function main ()
    {
        // Wind up all engine and platform-specific stuff
		trace("Start");
        IEEngine.init();
		
        // Load up the asset pack in the assets directory named "game"
		// Note: The game automatically adds the prefix "-sd" or "-hd" depending on what was computed.
        var  loader = IEAssetLoader.load("game", onSuccess);
		loader.progressChanged.connect(function () { trace(loader.progress / loader.total); } );
    }

    private static function onSuccess (pack :AssetPack)
    {
        // Add a solid color background
        var background = new FillSprite(0x202020, IEMainStage.width, IEMainStage.height);
        IEMainStage.addChild(new Entity().add(background));
		
        // Add a plane that moves along the screen
        plane = new ImageSprite(pack.getTexture("plane"));
        plane.x._ = IEMainStage.width - plane.getNaturalWidth();
        plane.y.animateTo(200 * IEMainStage.resolutionModifier, 6);
        IEMainStage.addChild(new Entity().add(plane));
		
		System.pointer.down.connect(handlePointerDown);
    }
	
	private static function handlePointerDown(event:PointerEvent) {
	   trace(event.viewX + " " + event.viewY);
	   plane.setXY(event.viewX / IEMainStage.stageScale, event.viewY / IEMainStage.stageScale);
	}
}
