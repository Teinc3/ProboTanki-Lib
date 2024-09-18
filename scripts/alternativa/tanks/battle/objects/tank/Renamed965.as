package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed965
   {
      private var body:Body;
      
      private var eventDispatcher:BattleEventDispatcher;
      
      public function Renamed965(param1:Body, param2:BattleEventDispatcher)
      {
         this.hash = new EncryptedNumberImpl();
         this.Renamed1144 = new EncryptedNumberImpl(Math.random() + 1);
         this.Renamed1145 = new EncryptedNumberImpl(Math.random() + 1);
         this.Renamed1146 = new EncryptedNumberImpl(Math.random() + 1);
         this.Renamed1147 = new EncryptedNumberImpl(Math.random() + 1);
         this.Renamed1148 = new Vector3();
         this.Renamed1149 = new Quaternion();
         super();
         this.body = param1;
         this.eventDispatcher = param2;
         this.refresh();
      }
      
      public function refresh() : void
      {
         var _loc1_:BodyState = this.body.state;
         var _loc2_:Vector3 = _loc1_.position;
         var _loc3_:Quaternion = _loc1_.orientation;
         var _loc4_:Number = this.Renamed1144.getNumber();
         var _loc5_:Number = this.Renamed1145.getNumber();
         var _loc6_:Number = this.Renamed1146.getNumber();
         this.hash.setNumber(_loc4_ * _loc2_.x + _loc5_ * _loc2_.y + _loc6_ * _loc2_.z + _loc4_ * _loc3_.x + _loc5_ * _loc3_.y + _loc6_ * _loc3_.z + this.Renamed1147.getNumber() * _loc3_.w);
         this.Renamed1148.copy(_loc2_);
         this.Renamed1149.copy(_loc3_);
      }
      
      public function validate() : void
      {
         var _loc1_:BodyState = this.body.state;
         var _loc2_:Vector3 = _loc1_.position;
         var _loc3_:Quaternion = _loc1_.orientation;
         var _loc4_:Number = this.Renamed1144.getNumber();
         var _loc5_:Number = this.Renamed1145.getNumber();
         var _loc6_:Number = this.Renamed1146.getNumber();
         var _loc7_:Number = _loc4_ * _loc2_.x + _loc5_ * _loc2_.y + _loc6_ * _loc2_.z + _loc4_ * _loc3_.x + _loc5_ * _loc3_.y + _loc6_ * _loc3_.z + this.Renamed1147.getNumber() * _loc3_.w;
         if(_loc7_ != this.hash.getNumber())
         {
            this.eventDispatcher.dispatchEvent(new DataValidationErrorEvent(DataValidatorType.TANK_POSITION));
         }
      }
   }
}

