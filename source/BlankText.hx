package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class BlankText extends FlxSprite
{

    private var refx:Float;
    private var refy:Float;
    public var animOffsets:Map<String, Array<Dynamic>>;

    private var resize = 0.35;

    private var images:Array<String> = ["img"];

	var posTween:FlxTween;
    var alphaTween:FlxTween;
	
    public function new(_x:Float, _y:Float, _image:String)
	{

        super(_x, _y);

        animOffsets = new Map<String, Array<Dynamic>>();

        defineImage(_image);
		switch(_image){
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

    function defineImage(_image)
	{

       _image = images.contains(_image) ? _image : "blank";


        frames = Paths.getSparrowAtlas(_image);

        switch(_image){

            case "text":
                addAnim("_", "blank_space_cuz_cutscene_code_shit.png");
				animation.play("_");
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