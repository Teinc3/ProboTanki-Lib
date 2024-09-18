package alternativa.tanks.engine3d
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   
   use namespace alternativa3d;
   
   public class TrackMaterial extends TextureMaterial
   {
      public function TrackMaterial(param1:BitmapData = null, param2:Boolean = false, param3:Boolean = true, param4:int = 0, param5:Number = 1)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      [Obfuscation(rename="false")]
      override alternativa3d function get transparent() : Boolean
      {
         return true;
      }
      
      [Obfuscation(rename="false")]
      override public function clone() : Material
      {
         var _loc1_:TrackMaterial = new TrackMaterial(texture,repeat,smooth,alternativa3d::_mipMapping,resolution);
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
   }
}

