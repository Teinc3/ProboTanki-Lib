package alternativa.tanks.utils
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.utils.Dictionary;
   
   public class Renamed3238
   {
      public function Renamed3238()
      {
         super();
      }
      
      public static function Renamed3888(param1:Dictionary, param2:uint, param3:BitmapData, param4:Boolean = true) : TextureMaterial
      {
         var _loc5_:TextureMaterial = param1[param2];
         if(_loc5_ == null)
         {
            _loc5_ = new TextureMaterial(Renamed3249(param3,param2,0.75),param4,true,MipMapping.PER_PIXEL);
            param1[param2] = _loc5_;
         }
         return _loc5_;
      }
      
      public static function Renamed3249(param1:BitmapData, param2:int, param3:Number = 1) : BitmapData
      {
         var _loc4_:Number = param3 * (param2 >> 16 & 0xFF) / 255;
         var _loc5_:Number = param3 * (param2 >> 8 & 0xFF) / 255;
         var _loc6_:Number = param3 * (param2 & 0xFF) / 255;
         var _loc7_:BitmapData = param1.clone();
         _loc7_.colorTransform(param1.rect,new ColorTransform(_loc4_,_loc5_,_loc6_));
         return _loc7_;
      }
   }
}

