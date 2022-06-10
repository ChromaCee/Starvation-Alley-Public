package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
//import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;

#if windows
import Discord.DiscordClient;
#end

#if cpp
import sys.thread.Thread;
#end

using StringTools;

class WarningState extends MusicBeatState
{   

    
	var dropText:FlxText;
	var warningMusic:FlxSound;

    override  function create():Void
	{
        DiscordClient.changePresence("Inside The Opening Menu", null);

        dropText = new FlxText(-150, 0, Std.int(FlxG.width * 1), "", 30);
		dropText.font = 'RP Mola';
		dropText.color = FlxColor.WHITE;
        dropText.alignment = FlxTextAlign.CENTER;
        dropText.alpha = 0;
		add(dropText);
        //FlxTween.tween(pic, {alpha: 1}, 1.2, {ease: FlxEase.circOut});
        FlxTween.tween(dropText, {alpha: 1}, 1.2, {ease: FlxEase.circOut});
       
    }


    override function update(elapsed:Float)
	{
	/*	if (warningMusic.volume < 0.3)
			warningMusic.volume += 0.01 * elapsed; */
			
        dropText.text = "Warning!
This mod is rated T (+13) for the following:
Implied Sexual Themes
If you are under 13, it is not advised that you play this mod.
You may press Shift to skip cutscenes at any time.

(Press any key to continue)";
        dropText.visible = true;
        dropText.screenCenter();
         if (FlxG.keys.justPressed.ANY)
		{
            FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
            FlxG.switchState(new MainMenuState());
		}
       
    }
}