package Renamed342
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.utils.textureutils.TextureByteData;
   import flash.display.BitmapData;
   
   public class Renamed7954 implements Renamed7939
   {
      private var Renamed8013:PropSprite;
      
      private var Renamed8014:Vector.<Sprite3D>;
      
      public function Renamed7954(param1:PropSprite, param2:String)
      {
         this.Renamed8014 = new Vector.<Sprite3D>();
         super();
         this.Renamed8013 = param1;
      }
      
      public function Renamed7953(param1:Sprite3D) : void
      {
         this.Renamed8014.push(param1);
      }
      
      public function Renamed1179(param1:TextureMaterial) : void
      {
         var _loc2_:Sprite3D = null;
         var _loc3_:Number = NaN;
         var _loc4_:BitmapData = param1.texture;
         for each(_loc2_ in this.Renamed8014)
         {
            _loc2_.material = param1;
            _loc3_ = _loc2_.width;
            _loc2_.width = _loc3_ * _loc4_.width;
            _loc2_.height = _loc3_ * _loc4_.height;
         }
      }
      
      public function Renamed7940() : TextureByteData
      {
         return this.Renamed8013.textureData;
      }
   }
}

