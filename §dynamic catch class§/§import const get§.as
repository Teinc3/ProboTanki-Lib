package §dynamic catch class§
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.utils.textureutils.TextureByteData;
   import flash.display.BitmapData;
   
   public class §import const get§ implements §#!5§
   {
      private var § j§:PropSprite;
      
      private var §extends switch§:Vector.<Sprite3D>;
      
      public function §import const get§(param1:PropSprite, param2:String)
      {
         this.§extends switch§ = new Vector.<Sprite3D>();
         super();
         this.§ j§ = param1;
      }
      
      public function §class for default§(param1:Sprite3D) : void
      {
         this.§extends switch§.push(param1);
      }
      
      public function §28§(param1:TextureMaterial) : void
      {
         var _loc2_:Sprite3D = null;
         var _loc3_:Number = NaN;
         var _loc4_:BitmapData = param1.texture;
         for each(_loc2_ in this.§extends switch§)
         {
            _loc2_.material = param1;
            _loc3_ = _loc2_.width;
            _loc2_.width = _loc3_ * _loc4_.width;
            _loc2_.height = _loc3_ * _loc4_.height;
         }
      }
      
      public function §;"'§() : TextureByteData
      {
         return this.§ j§.textureData;
      }
   }
}

