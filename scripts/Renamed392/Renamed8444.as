package Renamed392
{
   import Renamed4553.Renamed5127;
   import Renamed206.Renamed5125;
   import alternativa.tanks.display.Flash;
   import alternativa.tanks.display.SquareSectorIndicator;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   
   public class Renamed8444 extends Sprite
   {
      private static const SIZE:int = 36;
      
      private static const Renamed2670:uint = 16742221;
      
      private static const Renamed2671:uint = 4760319;
      
      private static const Renamed8449:uint = 16777215;
      
      private static const Renamed2672:uint = 9249024;
      
      private static const Renamed2673:uint = 16256;
      
      private var point:Renamed5127;
      
      private var label:LabelBase;
      
      private var Renamed8450:SquareSectorIndicator;
      
      private var Renamed8451:Renamed5125;
      
      private var score:Number = 0;
      
      public function Renamed8444(param1:Renamed5127)
      {
         this.flash = Flash.getDefault();
         this.Renamed8451 = Renamed5125.NEUTRAL;
         super();
         this.point = param1;
         this.Renamed8452();
         this.createLabel();
         this.update();
      }
      
      public static function Renamed772(param1:Renamed5125) : uint
      {
         switch(param1)
         {
            case Renamed5125.BLUE:
               return Renamed2671;
            case Renamed5125.RED:
               return Renamed2670;
            default:
               return Renamed8449;
         }
      }
      
      private function Renamed8452() : void
      {
         this.Renamed8450 = new SquareSectorIndicator(SIZE,0,0,0);
         addChild(this.Renamed8450);
      }
      
      private function createLabel() : void
      {
         this.label = new LabelBase();
         this.label.size = 18;
         this.label.bold = true;
         this.label.color = Renamed772(this.point.Renamed5137());
         this.label.text = this.point.getName();
      }
      
      public function getLabel() : LabelBase
      {
         return this.label;
      }
      
      public function update() : void
      {
         this.Renamed8453();
         this.updateScore();
      }
      
      private function Renamed8454(param1:uint) : void
      {
         var _loc2_:ColorTransform = this.Renamed8450.transform.colorTransform;
         _loc2_.redOffset = param1;
         _loc2_.greenOffset = param1;
         _loc2_.blueOffset = param1;
         this.Renamed8450.transform.colorTransform = _loc2_;
      }
      
      private function Renamed8453() : void
      {
         if(this.Renamed8451 != this.point.Renamed5137())
         {
            this.Renamed8451 = this.point.Renamed5137();
            this.label.color = this.Renamed8455();
            if(this.Renamed8451 != Renamed5125.NEUTRAL)
            {
               this.flash.init();
            }
         }
         if(this.flash.isActive())
         {
            this.Renamed8454(this.flash.getColorOffset(getTimer()));
         }
      }
      
      private function Renamed8455() : uint
      {
         switch(this.Renamed8451)
         {
            case Renamed5125.BLUE:
               return Renamed2671;
            case Renamed5125.RED:
               return Renamed2670;
            default:
               return Renamed8449;
         }
      }
      
      private function updateScore() : void
      {
         if(this.score != this.point.Renamed5139())
         {
            this.score = this.point.Renamed5139();
            if(this.score < 0)
            {
               this.Renamed8450.setColor(Renamed2672,1);
            }
            else if(this.score > 0)
            {
               this.Renamed8450.setColor(Renamed2673,1);
            }
            else
            {
               this.Renamed8450.setColor(0,0);
            }
            this.Renamed8450.setProgress(Math.abs(this.score) / 100);
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

