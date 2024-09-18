package alternativa.tanks.engine3d
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   
   public class Renamed520 implements Renamed1635
   {
      public function Renamed520()
      {
         super();
      }
      
      public function Renamed1636(param1:BitmapData, param2:Boolean) : TextureMaterial
      {
         return new TextureMaterial(param1,false,true,param2 ? int(MipMapping.PER_PIXEL) : int(0));
      }
   }
}

