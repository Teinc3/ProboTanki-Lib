package alternativa.tanks.battle.objects.tank.tankskin
{
   import §?#Z§.§9!c§;
   import §?#Z§.§<"Q§;
   import §?#Z§.§return var native§;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.§implements set get§;
   import alternativa.tanks.utils.MathUtils;
   
   public class §1!2§
   {
      private static const §`[§:Number = 100;
      
      private static const §8#R§:Vector3 = new Vector3();
      
      private var §do package include§:§<"Q§;
      
      private var skin:§false catch set§;
      
      private var §[#0§:§implements set get§;
      
      public function §1!2§(param1:§<"Q§, param2:§false catch set§, param3:§implements set get§)
      {
         super();
         this.§do package include§ = param1;
         this.skin = param2;
         this.§[#0§ = param3;
      }
      
      public function §]"7§(param1:Number) : void
      {
         this.§native package const§(param1);
         this.skin.§,!0§(param1 * this.§do package include§.§override native§.§6#§,param1 * this.§do package include§.§ "C§.§6#§);
      }
      
      private function §native package const§(param1:Number) : void
      {
         this.§8`§(this.§do package include§.§override native§,param1);
         this.§8`§(this.§do package include§.§ "C§,param1);
      }
      
      private function §8`§(param1:§return var native§, param2:Number) : void
      {
         if(this.§^!n§(param1))
         {
            this.§'"b§(param1,param2);
         }
         else
         {
            this.§throw catch import§(param1,param2);
         }
      }
      
      private function §^!n§(param1:§return var native§) : Boolean
      {
         return param1.body.baseMatrix.m22 > 0 && param1.§continue const override§ > 0;
      }
      
      private function §'"b§(param1:§return var native§, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = this.§`h§(param1);
         if(this.§import set else§(param1,_loc4_))
         {
            param1.§6#§ = _loc4_;
         }
         else
         {
            _loc3_ = this.§`#4§(param1) * §`[§;
            param1.§get for native§(_loc3_,this.§do package include§.§final var implements§() * param2);
         }
      }
      
      private function §`h§(param1:§return var native§) : Number
      {
         var _loc2_:Vector3 = param1.§2!7§;
         var _loc3_:§9!c§ = param1.§@"y§[param1.§@x§ >> 1];
         this.§do const case§(param1.body,_loc3_.§5!o§(),§8#R§);
         var _loc4_:Number = §8#R§.x - _loc2_.x;
         var _loc5_:Number = §8#R§.y - _loc2_.y;
         var _loc6_:Number = §8#R§.z - _loc2_.z;
         var _loc7_:Matrix3 = param1.body.baseMatrix;
         return _loc4_ * _loc7_.m01 + _loc5_ * _loc7_.m11 + _loc6_ * _loc7_.m21;
      }
      
      private function §do const case§(param1:Body, param2:Vector3, param3:Vector3) : void
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
      
      private function §import set else§(param1:§return var native§, param2:Number) : Boolean
      {
         var _loc3_:Number = this.§`#4§(param1);
         return Math.abs(param2) > 0.8 * §`[§ || _loc3_ == 0 || MathUtils.numberSign(param2,1) * MathUtils.sign(_loc3_) == -1;
      }
      
      private function §`#4§(param1:§return var native§) : Number
      {
         var _loc2_:int = this.§do package include§.§set package var§();
         var _loc3_:int = this.§do package include§.§extends var null§();
         var _loc4_:Number = 0;
         if(_loc2_ == 0)
         {
            _loc4_ = param1.§;<§ * _loc3_ * 0.5;
         }
         else if(_loc3_ == 0)
         {
            _loc4_ = _loc2_;
         }
         else
         {
            _loc4_ = _loc2_ * (3 + param1.§;<§ * _loc3_) / 4;
         }
         return _loc4_;
      }
      
      private function §throw catch import§(param1:§return var native§, param2:Number) : void
      {
         var _loc3_:Number = this.§`#4§(param1);
         param1.§get for native§(_loc3_ * this.§[#0§.§try package finally§(),this.§do package include§.§final var implements§() * param2);
      }
   }
}

