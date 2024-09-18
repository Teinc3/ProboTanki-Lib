package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Matrix3;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class §include const implements§ implements §default catch import§
   {
      private static const position:Vector3 = new Vector3();
      
      private static const §default for true§:Matrix3 = new Matrix3();
      
      private static const §9";§:EncryptedNumber = new EncryptedNumberImpl(Math.PI / 10.4719);
      
      private static const §get catch super§:Vector3 = new Vector3();
      
      private var tank:Tank;
      
      public function §include const implements§(param1:Tank)
      {
         this.§@"9§ = new Vector3();
         this.§=#[§ = new Quaternion();
         super();
         this.tank = param1;
      }
      
      private static function §return var final§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         param1 += param2 * param3;
         return param1 + (param4 - param1) * param5;
      }
      
      public function reset() : void
      {
         var _loc1_:BodyState = this.tank.§0"t§().prevState;
         this.§@"9§.copy(_loc1_.position);
         this.§=#[§.copy(_loc1_.orientation);
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:Body = this.tank.§0"t§();
         var _loc3_:BodyState = _loc2_.prevState;
         var _loc4_:Vector3 = _loc3_.velocity;
         var _loc5_:Vector3 = this.tank.§include for var§;
         var _loc6_:Number = §9";§.getNumber();
         this.§@"9§.x = §return var final§(this.§@"9§.x,_loc4_.x,param1,_loc5_.x,_loc6_);
         this.§@"9§.y = §return var final§(this.§@"9§.y,_loc4_.y,param1,_loc5_.y,_loc6_);
         this.§@"9§.z = §return var final§(this.§@"9§.z,_loc4_.z,param1,_loc5_.z,_loc6_);
         var _loc7_:Vector3 = _loc3_.angularVelocity;
         this.§=#[§.addScaledVector(_loc7_,param1);
         this.§=#[§.slerp(this.§=#[§,this.tank.§^#§,_loc6_);
         this.§=#[§.getEulerAngles(§get catch super§);
         this.§=#[§.toMatrix3(§default for true§);
         position.copy(this.tank.§catch package false§);
         position.transform3(§default for true§);
         position.add(this.§@"9§);
         this.tank.§in package default§().§function set catch§(position,§get catch super§);
      }
   }
}

