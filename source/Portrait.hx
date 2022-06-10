package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Portrait extends FlxSprite
{

    private var refx:Float;
    private var refy:Float;
    public var animOffsets:Map<String, Array<Dynamic>>;

    private var resize = 0.35;

    private var characters:Array<String> = ["text"];

	var posTween:FlxTween;
    var alphaTween:FlxTween;
	
    public function new(_x:Float, _y:Float, _character:String)
	{

        super(_x, _y);

        animOffsets = new Map<String, Array<Dynamic>>();

        defineCharacter(_character);
		/*
		if(_character =="pico"){
        setGraphicSize(Std.int(width * .35));
		}
		*/
		flipX = true;
		switch(_character){
			case "text":
				setGraphicSize(Std.int(width * .33));
		}
        updateHitbox();
        scrollFactor.set();
        antialiasing = true;

        refx = x;
        refy = y + height;

        playFrame();
        posTween = FlxTween.tween(this, {}, 0);
        alphaTween = FlxTween.tween(this, {}, 0);
        //hide();

    }

    function defineCharacter(_character)
	{

        _character = characters.contains(_character) ? _character : "text";


        frames = Paths.getSparrowAtlas("blankText/" + _character); //I literally can't with this shit right now

        switch(_character){

            case "text":
                addAnim("default", "blank_space_cuz_cutscene_code_shit.png");
				animation.play("default");
        }
    }
    
    function addAnim(anim:String, prefix:String){
        animation.addByPrefix(anim,prefix, 0, false);
    }    
    
  
    public function playFrame(?_frame:String = "default"){


        visible = true;
		
        animation.play(_frame);
       // flipX = false;
        updateHitbox();
        //This lets you change the induvidual portrait x/y
        switch(_frame){
            default:
                x = refx;
                y = refy - height;
            case "g6":
                x = refx;
                y = (refy - height)+17;
            case "g5":
                x = refx;
                y = (refy - height)+17;
            case "g4":
                x = refx;
                y = (refy - height)+10;
            case "g3":
                x = refx;
                y = (refy - height)+10;
			case "g12":
				x = refx;
				y = (refy - height)+4;
			case "g13":
				x = refx;
				y = (refy - height)+0.5;
			case "g16":
				x = refx;
				y = (refy - height)+5;
			case "g17":
				x = refx;
				y = (refy - height)+5;
			case "g20":
				x = refx;
				y = (refy - height)+13;
			case "m4":
				x = refx;
				y = (refy - height)+10;
			case "m5":
				x = refx;
				y = (refy - height)+10;
			case "m6":
				x = refx;
				y = (refy - height)+10;
			case "m8":
				x = refx;
				y = (refy - height)+10;
			case "m9":
				x = refx;
				y = (refy - height)+10;
            case "mx5":
                x = refx+10;
                y = (refy - height);
            case "bx18":
                x = refx-50;
                y = (refy - height);
            case "bx11":
                x = refx;
                y = (refy - height);
            case "bx5":
                x = refx;
                y = (refy - height);
            case "bx7":
                x = refx;
                y = (refy - height);
			case "dois2":
				x = refx-45;
				y = (refy - height)+15;
            case "angy2":
                x = refx - 150;
                y = (refy - height);
             case "angy":
                x = refx - 200;
                y = (refy - height);
            case "b10":
                y = (refy - height)+10;
			case "b13":
				x = refx;
				y = (refy - height)+10;
            case "m7":
                y = (refy - height)+15;           

        }

    }
	
	public function hide(){

        alphaTween.cancel();
        posTween.cancel();
        alpha = 1;
        visible = false;

    }
	public function effectFadeOut(?time:Float = 1){

        alphaTween.cancel();
        alpha = 1;
        alphaTween = FlxTween.tween(this, {alpha: 0}, time);

    }

    public function effectFadeIn(?time:Float = 1){

        alphaTween.cancel();
        alpha = 0;
        alphaTween = FlxTween.tween(this, {alpha: 1}, time);

    }

    public function effectExitStageLeft(?time:Float = 1){

        posTween.cancel();
        posTween = FlxTween.tween(this, {x: 0 - width}, time, {ease: FlxEase.circIn});

    }

    public function effectExitStageRight(?time:Float = 1){

        posTween.cancel();
        posTween = FlxTween.tween(this, {x: FlxG.width}, time, {ease: FlxEase.circIn});

    }

    public function effectFlipRight(){

        x = FlxG.width - refx - width;
        y = refy - height;

    }

    public function effectFlipDirection(){
        
        flipX = true;

    }

    public function effectEnterStageLeft(?time:Float = 1){
        
        posTween.cancel();
        var finalX = x;
        x = 0 - width;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.circOut});

    }

    public function effectEnterStageRight(?time:Float = 1){
        
        posTween.cancel();
        var finalX = x;
        x = FlxG.width;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.circOut});
    }

    public function effectToRight(?time:Float = 1){
        
        posTween.cancel();
        var finalX = FlxG.width - refx - width;
        x = refx;
        y = refy - height;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.quintOut});
    }

    public function effectToLeft(?time:Float = 1){
        
        posTween.cancel();
        var finalX = refx;
        x = FlxG.width - refx - width;
        y = refy - height;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.quintOut});
    }


	
}