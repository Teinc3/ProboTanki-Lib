package §import for in§
{
   import §#"D§.§case set extends§;
   import §,#a§.§each package default§;
   import alternativa.tanks.display.Flash;
   import alternativa.tanks.display.SquareSectorIndicator;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   
   public class §try for get§ extends Sprite
   {
      private static const SIZE:int = 36;
      
      private static const §=#b§:uint = 16742221;
      
      private static const §#6§:uint = 4760319;
      
      private static const §##I§:uint = 16777215;
      
      private static const §8"U§:uint = 9249024;
      
      private static const §#c§:uint = 16256;
      
      private var point:§case set extends§;
      
      private var label:LabelBase;
      
      private var §2#n§:SquareSectorIndicator;
      
      private var §1&§:§each package default§;
      
      private var score:Number = 0;
      
      public function §try for get§(param1:§case set extends§)
      {
         this.flash = Flash.getDefault();
         this.§1&§ = §each package default§.NEUTRAL;
         super();
         this.point = param1;
         this.§;h§();
         this.createLabel();
         this.update();
      }
      
      public static function §#!@§(param1:§each package default§) : uint
      {
         switch(param1)
         {
            case §each package default§.BLUE:
               return §#6§;
            case §each package default§.RED:
               return §=#b§;
            default:
               return §##I§;
         }
      }
      
      private function §;h§() : void
      {
         this.§2#n§ = new SquareSectorIndicator(SIZE,0,0,0);
         addChild(this.§2#n§);
      }
      
      private function createLabel() : void
      {
         this.label = new LabelBase();
         this.label.size = 18;
         this.label.bold = true;
         this.label.color = §#!@§(this.point.§^!]§());
         this.label.text = this.point.getName();
      }
      
      public function getLabel() : LabelBase
      {
         return this.label;
      }
      
      public function update() : void
      {
         this.§override set dynamic§();
         this.updateScore();
      }
      
      private function § #I§(param1:uint) : void
      {
         var _loc2_:ColorTransform = this.§2#n§.transform.colorTransform;
         _loc2_.redOffset = param1;
         _loc2_.greenOffset = param1;
         _loc2_.blueOffset = param1;
         this.§2#n§.transform.colorTransform = _loc2_;
      }
      
      private function §override set dynamic§() : void
      {
         if(this.§1&§ != this.point.§^!]§())
         {
            this.§1&§ = this.point.§^!]§();
            this.label.color = this.§static set false§();
            if(this.§1&§ != §each package default§.NEUTRAL)
            {
               this.flash.init();
            }
         }
         if(this.flash.isActive())
         {
            this.§ #I§(this.flash.getColorOffset(getTimer()));
         }
      }
      
      private function §static set false§() : uint
      {
         switch(this.§1&§)
         {
            case §each package default§.BLUE:
               return §#6§;
            case §each package default§.RED:
               return §=#b§;
            default:
               return §##I§;
         }
      }
      
      private function updateScore() : void
      {
         if(this.score != this.point.§+!I§())
         {
            this.score = this.point.§+!I§();
            if(this.score < 0)
            {
               this.§2#n§.setColor(§8"U§,1);
            }
            else if(this.score > 0)
            {
               this.§2#n§.setColor(§#c§,1);
            }
            else
            {
               this.§2#n§.setColor(0,0);
            }
            this.§2#n§.setProgress(Math.abs(this.score) / 100);
         }
      }
      
      [Obfuscation(rename="false")]
      override public function get width() : Number
      {
         return SIZE;
      }
      
      [Obfuscation(rename="false")]
      override public function get height() : Number
      {
         return SIZE;
      }
   }
}

