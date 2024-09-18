package §include package null§
{
   import §#"D§.§7!t§;
   import §,#a§.§each package default§;
   import alternativa.math.Vector3;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import §override const package§.§9!m§;
   
   public class §get catch while§ extends Sprite
   {
      private static const §native for while§:Class = §var for§;
      
      private static const §,"0§:BitmapData = Bitmap(new §native for while§()).bitmapData;
      
      private var container:Sprite;
      
      private var §override for switch§:Bitmap;
      
      private var position:Vector3;
      
      public function §get catch while§(param1:Vector3)
      {
         this.container = new Sprite();
         super();
         this.position = param1;
         this.§override catch finally§();
      }
      
      private static function §^#C§(param1:§each package default§) : Bitmap
      {
         return new Bitmap(§9!m§.§get catch with§(param1),PixelSnapping.AUTO,true);
      }
      
      private function §override catch finally§() : void
      {
         this.§override for switch§ = §^#C§(§each package default§.BLUE);
         addChild(this.container);
         var _loc1_:Bitmap = new Bitmap(§,"0§);
         _loc1_.x = 3;
         _loc1_.y = 1;
         addChild(_loc1_);
         this.container.addChild(this.§override for switch§);
         this.visible = true;
      }
      
      public function §=K§(param1:Vector3) : void
      {
         param1.copy(this.position);
         param1.z += §7!t§.§class package get§;
      }
   }
}

