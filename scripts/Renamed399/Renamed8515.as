package Renamed399
{
   import Renamed4553.Renamed4554;
   import Renamed206.Renamed5125;
   import alternativa.math.Vector3;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import Renamed408.Renamed8525;
   
   public class Renamed8515 extends Sprite
   {
      private static const Renamed8526:Class = Renamed8527;
      
      private static const Renamed8528:BitmapData = Bitmap(new Renamed8526()).bitmapData;
      
      private var container:Sprite;
      
      private var Renamed8529:Bitmap;
      
      private var position:Vector3;
      
      public function Renamed8515(param1:Vector3)
      {
         this.container = new Sprite();
         super();
         this.position = param1;
         this.Renamed8530();
      }
      
      private static function Renamed8531(param1:Renamed5125) : Bitmap
      {
         return new Bitmap(Renamed8525.Renamed8532(param1),PixelSnapping.AUTO,true);
      }
      
      private function Renamed8530() : void
      {
         this.Renamed8529 = Renamed8531(Renamed5125.BLUE);
         addChild(this.container);
         var _loc1_:Bitmap = new Bitmap(Renamed8528);
         _loc1_.x = 3;
         _loc1_.y = 1;
         addChild(_loc1_);
         this.container.addChild(this.Renamed8529);
         this.visible = true;
      }
      
      public function Renamed8520(param1:Vector3) : void
      {
         param1.copy(this.position);
         param1.z += Renamed4554.Renamed5086;
      }
   }
}

