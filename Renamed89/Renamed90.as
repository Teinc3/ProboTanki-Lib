package Renamed89
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed90
   {
      private var energyCapacity:EncryptedNumber;
      
      private var energyDischargeSpeed:EncryptedNumber;
      
      private var energyRechargeSpeed:EncryptedNumber;
      
      private var tickIntervalMsec:EncryptedNumber;
      
      public function Renamed90(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.energyCapacity = new EncryptedNumberImpl(param1);
         this.energyDischargeSpeed = new EncryptedNumberImpl(param2);
         this.energyRechargeSpeed = new EncryptedNumberImpl(param3);
         this.tickIntervalMsec = new EncryptedNumberImpl(param4);
      }
      
      public function Renamed9500() : Number
      {
         return this.energyCapacity.getNumber();
      }
      
      public function Renamed9501() : Number
      {
         return this.energyDischargeSpeed.getNumber();
      }
      
      public function Renamed9502() : Number
      {
         return this.energyRechargeSpeed.getNumber();
      }
      
      public function Renamed9503() : Number
      {
         return this.tickIntervalMsec.getNumber();
      }
   }
}

