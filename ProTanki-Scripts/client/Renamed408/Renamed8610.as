package Renamed408
{
   import Renamed4553.Renamed5127;
   import Renamed206.Renamed5125;
   import alternativa.math.Vector3;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import utils.graphics.SectorMask;
   
   public class Renamed8610 extends Sprite
   {
      private var Renamed8611:Renamed5127;
      
      private var Renamed8529:Bitmap;
      
      private var Renamed8612:Bitmap;
      
      private var sectorMask:SectorMask;
      
      private var score:Number = 0;
      
      private var container:Sprite;
      
      public function Renamed8610(param1:Renamed5127)
      {
         this.container = new Sprite();
         super();
         this.Renamed8611 = param1;
         this.Renamed8530();
      }
      
      private static function Renamed8531(param1:Renamed5125) : Bitmap
      {
         return new Bitmap(Renamed8525.Renamed8532(param1),PixelSnapping.AUTO,true);
      }
      
      private function Renamed8530() : void
      {
         this.Renamed8529 = Renamed8531(Renamed5125.BLUE);
         this.Renamed8612 = Renamed8531(Renamed5125.RED);
         addChild(Renamed8531(Renamed5125.NEUTRAL));
         addChild(this.container);
         this.sectorMask = new SectorMask(this.Renamed8529.width);
         this.container.addChild(this.sectorMask);
         addChild(new Bitmap(Renamed8525.Renamed8613(this.Renamed8611.getName().charAt(0))));
         this.Renamed8614();
      }
      
      public function Renamed8520(param1:Vector3) : void
      {
         this.Renamed8611.readPosition(param1);
      }
      
      public function update() : void
      {
         this.Renamed2685(this.Renamed8611.Renamed5139());
      }
      
      public function Renamed8615() : Renamed5127
      {
         return this.Renamed8611;
      }
      
      private function Renamed2685(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(param1 < -100)
         {
            param1 = -100;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         if(this.score != param1)
         {
            if(param1 == 0)
            {
               this.Renamed8614();
            }
            else
            {
               _loc2_ = Math.abs(param1) / 100;
               this.sectorMask.setProgress(1 - _loc2_,1);
               if(param1 < 0)
               {
                  this.Renamed8616();
               }
               else if(param1 > 0)
               {
                  this.Renamed8617();
               }
            }
            this.score = param1;
         }
      }
      
      private function Renamed8614() : void
      {
         this.container.visible = false;
      }
      
      private function Renamed8616() : void
      {
         this.container.visible = true;
         this.Renamed8618(this.Renamed8529,this.Renamed8612);
         this.container.mask = this.sectorMask;
      }
      
      private function Renamed8617() : void
      {
         this.container.visible = true;
         this.Renamed8618(this.Renamed8612,this.Renamed8529);
         this.container.mask = this.sectorMask;
      }
      
      private function Renamed8618(param1:DisplayObject, param2:DisplayObject) : void
      {
         if(param2.parent == null)
         {
            if(param1.parent != null)
            {
               this.container.removeChild(param1);
            }
            this.container.addChild(param2);
         }
      }
   }
}

