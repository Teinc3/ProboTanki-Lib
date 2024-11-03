package Renamed388
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed8391
   {
      private var Renamed8392:EncryptedNumber;
      
      private var Renamed8393:EncryptedNumber;
      
      private var minSplashDamagePercent:EncryptedNumber;
      
      private var Renamed8394:EncryptedNumber;
      
      public function Renamed8391(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.Renamed8392 = new EncryptedNumberImpl(param1);
         this.Renamed8393 = new EncryptedNumberImpl(param2);
         this.minSplashDamagePercent = new EncryptedNumberImpl(param3);
         this.Renamed8394 = new EncryptedNumberImpl(param4);
      }
      
      public function Renamed8395() : Number
      {
         return this.Renamed8393.getNumber();
      }
      
      public function Renamed3067(param1:Number) : Number
      {
         return this.Renamed8394.getNumber() * this.Renamed8396(param1);
      }
      
      private function Renamed8396(param1:Number) : Number
      {
         var _loc2_:Number = this.Renamed8392.getNumber();
         var _loc3_:Number = this.Renamed8393.getNumber();
         var _loc4_:Number = this.minSplashDamagePercent.getNumber();
         if(param1 < _loc2_)
         {
            return 1;
         }
         if(param1 > _loc3_)
         {
            return 0.1 * _loc4_;
         }
         return 0.01 * (_loc4_ + (_loc3_ - param1) * (100 - _loc4_) / (_loc3_ - _loc2_));
      }
   }
}

