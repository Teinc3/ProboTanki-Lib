package alternativa.tanks.models.weapon.shaft
{
   import alternativa.tanks.utils.Renamed3238;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.resource.types.ImageResource;
   import Renamed79.Renamed2769;
   
   public class Renamed3184 extends Sprite
   {
      private static var Renamed3239:Dictionary = new Dictionary();
      
      private var Renamed3240:Bitmap;
      
      private var Renamed3241:Bitmap;
      
      private var Renamed3242:uint;
      
      public function Renamed3184(param1:ImageResource, param2:uint)
      {
         super();
         this.Renamed3242 = param2;
         this.Renamed3243(param1);
         this.Renamed3241 = this.Renamed3244(param2);
         addChild(this.Renamed3240);
         addChild(this.Renamed3241);
         this.Renamed3241.x = (this.Renamed3240.width - this.Renamed3241.width) / 2;
         this.Renamed3241.y = (this.Renamed3240.height - this.Renamed3241.height) / 2;
      }
      
      public function get Renamed3245() : Bitmap
      {
         return this.Renamed3240;
      }
      
      public function Renamed3227(param1:Number) : void
      {
         this.Renamed3241.width = Renamed2769.Renamed3246.width * param1;
         this.Renamed3241.height = Renamed2769.Renamed3246.height * param1;
         this.Renamed3241.x = (this.Renamed3240.width - this.Renamed3241.width) / 2;
         this.Renamed3241.y = (this.Renamed3240.height - this.Renamed3241.height) / 2;
      }
      
      public function Renamed3247(param1:uint) : void
      {
         var _loc2_:Bitmap = null;
         _loc2_ = null;
         if(this.Renamed3242 != param1)
         {
            _loc2_ = this.Renamed3244(param1);
            addChild(_loc2_);
            _loc2_.x = this.Renamed3241.x;
            _loc2_.y = this.Renamed3241.y;
            _loc2_.width = this.Renamed3241.width;
            _loc2_.height = this.Renamed3241.height;
            removeChild(this.Renamed3241);
            this.Renamed3241 = _loc2_;
            this.Renamed3242 = param1;
         }
      }
      
      private function Renamed3243(param1:ImageResource) : void
      {
         var _loc2_:BitmapData = param1.data;
         this.Renamed3240 = new Bitmap(_loc2_);
      }
      
      private function Renamed3244(param1:uint) : Bitmap
      {
         var _loc2_:Bitmap = Renamed3239[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this.Renamed3248(param1);
            Renamed3239[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function Renamed3248(param1:uint) : Bitmap
      {
         var _loc2_:BitmapData = Renamed3238.Renamed3249(Renamed2769.Renamed3246,param1,0.75);
         var _loc3_:Bitmap = new Bitmap(_loc2_);
         _loc3_.smoothing = true;
         return _loc3_;
      }
   }
}

