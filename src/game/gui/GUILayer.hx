package game.gui;
import flambe.Component;
import flambe.display.Font;
import flambe.display.TextSprite;
import flambe.Entity;
import game.layers.Layer;
import game.objects.Territory;
import game.Registry;

/**
 * ...
 * @author Karlo
 */
class GUILayer extends Layer
{
	var playerIndicatorSprite:TextSprite;
	
	public function new() 
	{
		super();
	}
	
	override public function onAdded()
	{
		super.onAdded();
		
		playerIndicatorSprite = new TextSprite(new Font(Registry.pack, "fonts/AdventureSubtitles"), "Player None");
		playerIndicatorSprite.setScale(0.5);
		playerIndicatorSprite.setXY(10, 10);
		owner.addChild(new Entity().add(playerIndicatorSprite));
		
		updatePlayerIndicator();
	}
	
	public function updatePlayerIndicator()
	{
		playerIndicatorSprite.text = "Player " + Registry.playerManager.currentPlayerNumber;
	}
}