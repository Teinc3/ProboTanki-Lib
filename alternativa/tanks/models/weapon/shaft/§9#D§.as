package alternativa.tanks.models.weapon.shaft
{
   import alternativa.tanks.utils.§super with§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.resource.types.ImageResource;
   import §return set use§.§'">§;
   
   public class §9#D§ extends Sprite
   {
      private static var §07§:Dictionary = new Dictionary();
      
      private var §^8§:Bitmap;
      
      private var §%#t§:Bitmap;
      
      private var §1'§:uint;
      
      public function §9#D§(param1:ImageResource, param2:uint)
      {
         super();
         this.§1'§ = param2;
         this.§'!;§(param1);
         this.§%#t§ = this.§do package native§(param2);
         addChild(this.§^8§);
         addChild(this.§%#t§);
         this.§%#t§.x = (this.§^8§.width - this.§%#t§.width) / 2;
         this.§%#t§.y = (this.§^8§.height - this.§%#t§.height) / 2;
      }
      
      public function get §[#Q§() : Bitmap
      {
         return this.§^8§;
      }
      
      public function §do for dynamic§(param1:Number) : void
      {
         this.§%#t§.width = §'">§.§""7§.width * param1;
         this.§%#t§.height = §'">§.§""7§.height * param1;
         this.§%#t§.x = (this.§^8§.width - this.§%#t§.width) / 2;
         this.§%#t§.y = (this.§^8§.height - this.§%#t§.height) / 2;
      }
      
      public function §false const throw§(param1:uint) : void
      {
         var _loc2_:Bitmap = null;
         _loc2_ = null;
         if(this.§1'§ != param1)
         {
            _loc2_ = this.§do package native§(param1);
            addChild(_loc2_);
            _loc2_.x = this.§%#t§.x;
            _loc2_.y = this.§%#t§.y;
            _loc2_.width = this.§%#t§.width;
            _loc2_.height = this.§%#t§.height;
            removeChild(this.§%#t§);
            this.§%#t§ = _loc2_;
            this.§1'§ = param1;
         }
      }
      
      private function §'!;§(param1:ImageResource) : void
      {
         var _loc2_:BitmapData = param1.data;
         this.§^8§ = new Bitmap(_loc2_);
      }
      
      private function §do package native§(param1:uint) : Bitmap
      {
         var _loc2_:Bitmap = §07§[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this.§1"K§(param1);
            §07§[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function §1"K§(param1:uint) : Bitmap
      {
         var _loc2_:BitmapData = §super with§.§false var import§(§'">§.§""7§,param1,0.75);
         var _loc3_:Bitmap = new Bitmap(_loc2_);
         _loc3_.smoothing = true;
         return _loc3_;
      }
   }
}

