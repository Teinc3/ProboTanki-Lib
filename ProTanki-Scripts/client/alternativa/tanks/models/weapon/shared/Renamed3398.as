package alternativa.tanks.models.weapon.shared
{
   import alternativa.math.Vector3;
   import alternativa.tanks.engine3d.Renamed1647;
   import Renamed366.Renamed3387;
   import flash.geom.ColorTransform;
   
   public class Renamed3388 extends Renamed1647
   {
      private static var Renamed3389:int = 20;
      
      private static var pool:Vector.<Renamed3388> = new Vector.<Renamed3388>(Renamed3389);
      
      private static var Renamed3390:int = -1;
      
      public var velocity:Vector3;
      
      public var Renamed3391:Number = 0;
      
      public var Renamed3392:Number;
      
      public var Renamed3393:int;
      
      public function Renamed3388()
      {
         this.velocity = new Vector3();
         super(100,100);
         softAttenuation = 130;
         colorTransform = new ColorTransform();
      }
      
      public static function Renamed3394() : Renamed3388
      {
         if(Renamed3390 == -1)
         {
            return new Renamed3388();
         }
         var _loc1_:Renamed3388 = pool[Renamed3390];
         var _loc2_:* = Renamed3390--;
         pool[_loc2_] = null;
         _loc1_.reset();
         return _loc1_;
      }
      
      private static function Renamed3395(param1:Renamed3387, param2:Renamed3387, param3:Number, param4:ColorTransform) : void
      {
         param4.alphaMultiplier = param1.alphaMultiplier + param3 * (param2.alphaMultiplier - param1.alphaMultiplier);
         param4.alphaOffset = param1.alphaOffset + param3 * (param2.alphaOffset - param1.alphaOffset);
         param4.redMultiplier = param1.redMultiplier + param3 * (param2.redMultiplier - param1.redMultiplier);
         param4.redOffset = param1.redOffset + param3 * (param2.redOffset - param1.redOffset);
         param4.greenMultiplier = param1.greenMultiplier + param3 * (param2.greenMultiplier - param1.greenMultiplier);
         param4.greenOffset = param1.greenOffset + param3 * (param2.greenOffset - param1.greenOffset);
         param4.blueMultiplier = param1.blueMultiplier + param3 * (param2.blueMultiplier - param1.blueMultiplier);
         param4.blueOffset = param1.blueOffset + param3 * (param2.blueOffset - param1.blueOffset);
      }
      
      private static function Renamed3396(param1:Renamed3387, param2:ColorTransform) : void
      {
         param2.alphaMultiplier = param1.alphaMultiplier;
         param2.alphaOffset = param1.alphaOffset;
         param2.redMultiplier = param1.redMultiplier;
         param2.redOffset = param1.redOffset;
         param2.greenMultiplier = param1.greenMultiplier;
         param2.greenOffset = param1.greenOffset;
         param2.blueMultiplier = param1.blueMultiplier;
         param2.blueOffset = param1.blueOffset;
      }
      
      public function reset() : void
      {
         var _loc1_:ColorTransform = colorTransform;
         _loc1_.redMultiplier = 1;
         _loc1_.greenMultiplier = 1;
         _loc1_.blueMultiplier = 1;
         _loc1_.alphaMultiplier = 1;
         _loc1_.redOffset = 0;
         _loc1_.greenOffset = 0;
         _loc1_.blueOffset = 0;
         _loc1_.alphaOffset = 0;
         alpha = 1;
      }
      
      public function dispose() : void
      {
         clear();
         var _loc1_:* = ++Renamed3390;
         pool[_loc1_] = this;
      }
      
      public function Renamed3397(param1:Number, param2:Vector.<Renamed3387>) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Renamed3387 = null;
         var _loc5_:Renamed3387 = null;
         var _loc6_:int = 0;
         if(param2 != null)
         {
            _loc3_ = this.Renamed3391 / param1;
            if(_loc3_ <= 0)
            {
               _loc4_ = param2[0];
               Renamed3396(_loc4_,colorTransform);
            }
            else if(_loc3_ >= 1)
            {
               _loc4_ = param2[param2.length - 1];
               Renamed3396(_loc4_,colorTransform);
            }
            else
            {
               _loc6_ = 1;
               _loc4_ = param2[0];
               _loc5_ = param2[1];
               while(_loc5_.t < _loc3_)
               {
                  _loc6_++;
                  _loc4_ = _loc5_;
                  _loc5_ = param2[_loc6_];
               }
               _loc3_ = (_loc3_ - _loc4_.t) / (_loc5_.t - _loc4_.t);
               Renamed3395(_loc4_,_loc5_,_loc3_,colorTransform);
            }
            alpha = colorTransform.alphaMultiplier;
         }
      }
   }
}

