package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Matrix3;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed1158 implements Renamed968
   {
      private static const position:Vector3 = new Vector3();
      
      private static const Renamed1137:Matrix3 = new Matrix3();
      
      private static const Renamed1159:EncryptedNumber = new EncryptedNumberImpl(Math.PI / 10.4719);
      
      private static const Renamed1160:Vector3 = new Vector3();
      
      private var tank:Tank;
      
      public function Renamed1158(param1:Tank)
      {
         this.Renamed1161 = new Vector3();
         this.Renamed1162 = new Quaternion();
         super();
         this.tank = param1;
      }
      
      private static function Renamed1163(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         param1 += param2 * param3;
         return param1 + (param4 - param1) * param5;
      }
      
      public function reset() : void
      {
         var _loc1_:BodyState = this.tank.Renamed696().prevState;
         this.Renamed1161.copy(_loc1_.position);
         this.Renamed1162.copy(_loc1_.orientation);
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:Body = this.tank.Renamed696();
         var _loc3_:BodyState = _loc2_.prevState;
         var _loc4_:Vector3 = _loc3_.velocity;
         var _loc5_:Vector3 = this.tank.Renamed969;
         var _loc6_:Number = Renamed1159.getNumber();
         this.Renamed1161.x = Renamed1163(this.Renamed1161.x,_loc4_.x,param1,_loc5_.x,_loc6_);
         this.Renamed1161.y = Renamed1163(this.Renamed1161.y,_loc4_.y,param1,_loc5_.y,_loc6_);
         this.Renamed1161.z = Renamed1163(this.Renamed1161.z,_loc4_.z,param1,_loc5_.z,_loc6_);
         var _loc7_:Vector3 = _loc3_.angularVelocity;
         this.Renamed1162.addScaledVector(_loc7_,param1);
         this.Renamed1162.slerp(this.Renamed1162,this.tank.Renamed970,_loc6_);
         this.Renamed1162.getEulerAngles(Renamed1160);
         this.Renamed1162.toMatrix3(Renamed1137);
         position.copy(this.tank.Renamed972);
         position.transform3(Renamed1137);
         position.add(this.Renamed1161);
         this.tank.Renamed1075().Renamed1138(position,Renamed1160);
      }
   }
}

