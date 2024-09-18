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
   
   public class §case final§
   {
      private var body:Body;
      
      private var eventDispatcher:BattleEventDispatcher;
      
      public function §case final§(param1:Body, param2:BattleEventDispatcher)
      {
         this.hash = new EncryptedNumberImpl();
         this.§5! § = new EncryptedNumberImpl(Math.random() + 1);
         this.§switch const final§ = new EncryptedNumberImpl(Math.random() + 1);
         this.§var for final§ = new EncryptedNumberImpl(Math.random() + 1);
         this.§for for case§ = new EncryptedNumberImpl(Math.random() + 1);
         this.§default catch§ = new Vector3();
         this.§>#i§ = new Quaternion();
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
         var _loc4_:Number = this.§5! §.getNumber();
         var _loc5_:Number = this.§switch const final§.getNumber();
         var _loc6_:Number = this.§var for final§.getNumber();
         this.hash.setNumber(_loc4_ * _loc2_.x + _loc5_ * _loc2_.y + _loc6_ * _loc2_.z + _loc4_ * _loc3_.x + _loc5_ * _loc3_.y + _loc6_ * _loc3_.z + this.§for for case§.getNumber() * _loc3_.w);
         this.§default catch§.copy(_loc2_);
         this.§>#i§.copy(_loc3_);
      }
      
      public function validate() : void
      {
         var _loc1_:BodyState = this.body.state;
         var _loc2_:Vector3 = _loc1_.position;
         var _loc3_:Quaternion = _loc1_.orientation;
         var _loc4_:Number = this.§5! §.getNumber();
         var _loc5_:Number = this.§switch const final§.getNumber();
         var _loc6_:Number = this.§var for final§.getNumber();
         var _loc7_:Number = _loc4_ * _loc2_.x + _loc5_ * _loc2_.y + _loc6_ * _loc2_.z + _loc4_ * _loc3_.x + _loc5_ * _loc3_.y + _loc6_ * _loc3_.z + this.§for for case§.getNumber() * _loc3_.w;
         if(_loc7_ != this.hash.getNumber())
         {
            this.eventDispatcher.dispatchEvent(new DataValidationErrorEvent(DataValidatorType.TANK_POSITION));
         }
      }
   }
}

