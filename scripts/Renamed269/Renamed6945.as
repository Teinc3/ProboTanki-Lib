package Renamed1
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.models.weapon.shared.Renamed3388;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import Renamed89.Renamed6935;
   
   public class Renamed6936 extends Renamed1444 implements Renamed6901
   {
      private var Renamed6937:Renamed6935;
      
      private var Renamed6938:Renamed6939;
      
      private var Renamed6940:Array;
      
      private var Renamed6941:Array;
      
      public function Renamed6936(param1:Renamed1443)
      {
         this.Renamed6940 = [0.1,0.3,0.5,0.8,0.9,1];
         this.Renamed6941 = [0.5,0.8,1,0.5,0.3,0.05];
         super(param1);
      }
      
      public function init(param1:Renamed6935, param2:Renamed6939) : void
      {
         this.Renamed6937 = param1;
         this.Renamed6938 = param2;
      }
      
      public function Renamed6904(param1:Object3D) : void
      {
         var _loc2_:Vector.<Renamed3388> = null;
         var _loc3_:int = 0;
         var _loc4_:Renamed3388 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         if(this.Renamed6937.Renamed6942 == 0)
         {
            this.Renamed6938.Renamed6904(param1);
         }
         else
         {
            _loc2_ = this.Renamed6937.Renamed6943;
            _loc3_ = 0;
            while(_loc3_ < this.Renamed6937.Renamed6942)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = _loc4_.Renamed3391 / this.Renamed6937.range;
               _loc6_ = this.Renamed6944(_loc5_);
               _loc10_ += _loc6_;
               _loc7_ += _loc4_.x * _loc6_;
               _loc8_ += _loc4_.y * _loc6_;
               _loc9_ += _loc4_.z * _loc6_;
               _loc3_++;
            }
            _loc7_ /= _loc10_;
            _loc8_ /= _loc10_;
            _loc9_ /= _loc10_;
            param1.x = _loc7_;
            param1.y = _loc8_;
            param1.z = _loc9_;
         }
      }
      
      private function Renamed6944(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed6940.length)
         {
            _loc2_ = Number(this.Renamed6940[_loc3_]);
            if(_loc2_ >= param1)
            {
               return this.Renamed6941[_loc3_];
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function Renamed6905(param1:Object3D, param2:Renamed842, param3:int) : void
      {
         this.Renamed6904(param1);
      }
      
      public function destroy() : void
      {
         this.Renamed6937 = null;
         this.Renamed6938 = null;
      }
   }
}

