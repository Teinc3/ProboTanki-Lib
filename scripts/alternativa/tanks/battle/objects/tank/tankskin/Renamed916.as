package alternativa.tanks.battle.objects.tank.tankskin
{
   import Renamed838.Renamed839;
   import Renamed838.Renamed910;
   import Renamed838.Renamed840;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.Renamed947;
   import alternativa.tanks.utils.MathUtils;
   
   public class Renamed916
   {
      private static const Renamed1209:Number = 100;
      
      private static const Renamed1210:Vector3 = new Vector3();
      
      private var Renamed980:Renamed910;
      
      private var skin:Renamed917;
      
      private var Renamed986:Renamed947;
      
      public function Renamed916(param1:Renamed910, param2:Renamed917, param3:Renamed947)
      {
         super();
         this.Renamed980 = param1;
         this.skin = param2;
         this.Renamed986 = param3;
      }
      
      public function Renamed1065(param1:Number) : void
      {
         this.Renamed1211(param1);
         this.skin.Renamed1212(param1 * this.Renamed980.Renamed954.Renamed858,param1 * this.Renamed980.Renamed955.Renamed858);
      }
      
      private function Renamed1211(param1:Number) : void
      {
         this.Renamed1213(this.Renamed980.Renamed954,param1);
         this.Renamed1213(this.Renamed980.Renamed955,param1);
      }
      
      private function Renamed1213(param1:Renamed840, param2:Number) : void
      {
         if(this.Renamed1214(param1))
         {
            this.Renamed1215(param1,param2);
         }
         else
         {
            this.Renamed1216(param1,param2);
         }
      }
      
      private function Renamed1214(param1:Renamed840) : Boolean
      {
         return param1.body.baseMatrix.m22 > 0 && param1.Renamed1217 > 0;
      }
      
      private function Renamed1215(param1:Renamed840, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = this.Renamed1218(param1);
         if(this.Renamed1219(param1,_loc4_))
         {
            param1.Renamed858 = _loc4_;
         }
         else
         {
            _loc3_ = this.Renamed1220(param1) * Renamed1209;
            param1.Renamed1221(_loc3_,this.Renamed980.Renamed1222() * param2);
         }
      }
      
      private function Renamed1218(param1:Renamed840) : Number
      {
         var _loc2_:Vector3 = param1.Renamed1223;
         var _loc3_:Renamed839 = param1.Renamed861[param1.Renamed860 >> 1];
         this.Renamed1224(param1.body,_loc3_.Renamed862(),Renamed1210);
         var _loc4_:Number = Renamed1210.x - _loc2_.x;
         var _loc5_:Number = Renamed1210.y - _loc2_.y;
         var _loc6_:Number = Renamed1210.z - _loc2_.z;
         var _loc7_:Matrix3 = param1.body.baseMatrix;
         return _loc4_ * _loc7_.m01 + _loc5_ * _loc7_.m11 + _loc6_ * _loc7_.m21;
      }
      
      private function Renamed1224(param1:Body, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Vector3 = null;
         var _loc6_:Vector3 = param1.state.position;
         _loc4_ = param2.x - _loc6_.x;
         var _loc7_:Number = param2.y - _loc6_.y;
         var _loc8_:Number = param2.z - _loc6_.z;
         _loc5_ = param1.state.angularVelocity;
         param3.x = _loc5_.y * _loc8_ - _loc5_.z * _loc7_;
         param3.y = _loc5_.z * _loc4_ - _loc5_.x * _loc8_;
         param3.z = _loc5_.x * _loc7_ - _loc5_.y * _loc4_;
         var _loc9_:Vector3 = param1.state.velocity;
         param3.x += _loc9_.x;
         param3.y += _loc9_.y;
         param3.z += _loc9_.z;
      }
      
      private function Renamed1219(param1:Renamed840, param2:Number) : Boolean
      {
         var _loc3_:Number = this.Renamed1220(param1);
         return Math.abs(param2) > 0.8 * Renamed1209 || _loc3_ == 0 || MathUtils.numberSign(param2,1) * MathUtils.sign(_loc3_) == -1;
      }
      
      private function Renamed1220(param1:Renamed840) : Number
      {
         var _loc2_:int = this.Renamed980.Renamed1225();
         var _loc3_:int = this.Renamed980.Renamed1226();
         var _loc4_:Number = 0;
         if(_loc2_ == 0)
         {
            _loc4_ = param1.Renamed1227 * _loc3_ * 0.5;
         }
         else if(_loc3_ == 0)
         {
            _loc4_ = _loc2_;
         }
         else
         {
            _loc4_ = _loc2_ * (3 + param1.Renamed1227 * _loc3_) / 4;
         }
         return _loc4_;
      }
      
      private function Renamed1216(param1:Renamed840, param2:Number) : void
      {
         var _loc3_:Number = this.Renamed1220(param1);
         param1.Renamed1221(_loc3_ * this.Renamed986.Renamed1081(),this.Renamed980.Renamed1222() * param2);
      }
   }
}

