package Renamed381
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed3045
   {
      private var maxTurretRotationSpeed:EncryptedNumber;
      
      private var Renamed8340:EncryptedNumber;
      
      private var impactForce:EncryptedNumber;
      
      private var Renamed3066:EncryptedNumber;
      
      public function Renamed3045(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.maxTurretRotationSpeed = new EncryptedNumberImpl(param1);
         this.Renamed8340 = new EncryptedNumberImpl(param2);
         this.impactForce = new EncryptedNumberImpl(param3);
         this.Renamed3066 = new EncryptedNumberImpl(param4);
      }
      
      public function Renamed8341() : Number
      {
         return this.maxTurretRotationSpeed.getNumber();
      }
      
      public function Renamed3137() : Number
      {
         return this.Renamed8340.getNumber();
      }
      
      public function Renamed3067() : Number
      {
         return this.impactForce.getNumber();
      }
      
      public function Renamed3068() : Number
      {
         return this.Renamed3066.getNumber();
      }
   }
}

