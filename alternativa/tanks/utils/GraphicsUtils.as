package alternativa.tanks.utils
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.math.Vector3;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.engine3d.§try set break§;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class GraphicsUtils
   {
      private static var filteredImages:Dictionary = new Dictionary(true);
      
      public function GraphicsUtils()
      {
         super();
      }
      
      public static function getTextureAnimationFromResource(param1:TextureMaterialRegistry, param2:MultiframeImageResource) : §throw const switch§
      {
         var _loc3_:§throw const switch§ = getTextureAnimation(param1,param2.data,param2.frameWidth,param2.frameHeight,param2.numFrames);
         _loc3_.fps = param2.fps;
         return _loc3_;
      }
      
      public static function getFilteredTextureAnimationFromResource(param1:TextureMaterialRegistry, param2:MultiframeImageResource, param3:BitmapFilter) : §throw const switch§
      {
         var _loc4_:BitmapData = createFilteredImage(param2.data,param3);
         var _loc5_:§throw const switch§;
         (_loc5_ = getTextureAnimation(param1,_loc4_,param2.frameWidth,param2.frameHeight,param2.numFrames)).fps = param2.fps;
         return _loc5_;
      }
      
      public static function createFilteredImage(param1:BitmapData, param2:BitmapFilter) : BitmapData
      {
         var _loc3_:* = undefined;
         var _loc4_:BitmapData = null;
         var _loc5_:Object = null;
         for(_loc3_ in filteredImages)
         {
            _loc5_ = filteredImages[_loc3_];
            if(_loc5_.s == param1 && _loc5_.f == param2)
            {
               return _loc3_;
            }
         }
         _loc4_ = param1.clone();
         _loc4_.applyFilter(param1,param1.rect,new Point(),param2);
         filteredImages[_loc4_] = {
            "s":param1,
            "f":param2
         };
         return _loc4_;
      }
      
      public static function setObjectTransform(param1:Object3D, param2:Vector3, param3:Vector3) : void
      {
         param1.x = param2.x;
         param1.y = param2.y;
         param1.z = param2.z;
         param1.rotationX = param3.x;
         param1.rotationY = param3.y;
         param1.rotationZ = param3.z;
      }
      
      public static function getTextureAnimation(param1:TextureMaterialRegistry, param2:BitmapData, param3:int, param4:int, param5:int = 0, param6:Boolean = true) : §throw const switch§
      {
         var _loc7_:TextureMaterial = param1.getMaterial(param2,param6);
         var _loc8_:Vector.<§try set break§> = getUVFramesFromTexture(param2,param3,param4,param5);
         return new §throw const switch§(_loc7_,_loc8_);
      }
      
      public static function getSquareUVFramesFromTexture(param1:BitmapData, param2:int = 0) : Vector.<§try set break§>
      {
         var _loc3_:int = param1.height;
         return getUVFramesFromTexture(param1,_loc3_,_loc3_,param2);
      }
      
      public static function getUVFramesFromTexture(param1:BitmapData, param2:int, param3:int, param4:int = 0) : Vector.<§try set break§>
      {
         var _loc20_:* = undefined;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = param1.width;
         var _loc11_:int = Math.min(param2,_loc10_);
         var _loc12_:int = _loc10_ / _loc11_;
         var _loc13_:int = param1.height;
         var _loc14_:int = Math.min(param3,_loc13_);
         var _loc15_:int = _loc13_ / _loc14_;
         var _loc16_:int = _loc12_ * _loc15_;
         if(param4 > 0 && _loc16_ > param4)
         {
            _loc16_ = param4;
         }
         var _loc17_:Vector.<§try set break§> = new Vector.<§try set break§>(_loc16_);
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         while(_loc19_ < _loc15_)
         {
            _loc5_ = _loc19_ * _loc14_;
            _loc6_ = _loc5_ + _loc14_;
            _loc7_ = 0;
            while(_loc7_ < _loc12_)
            {
               _loc8_ = _loc7_ * _loc11_;
               _loc9_ = _loc8_ + _loc11_;
               _loc20_ = _loc18_++;
               _loc17_[_loc20_] = new §try set break§(_loc8_ / _loc10_,_loc5_ / _loc13_,_loc9_ / _loc10_,_loc6_ / _loc13_);
               if(_loc18_ == _loc16_)
               {
                  return _loc17_;
               }
               _loc7_++;
            }
            _loc19_++;
         }
         return _loc17_;
      }
   }
}

