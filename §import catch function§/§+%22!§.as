package §import catch function§
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class §+"!§
   {
      private var §super const do§:EncryptedNumber;
      
      private var §extends package true§:EncryptedNumber;
      
      private var minSplashDamagePercent:EncryptedNumber;
      
      private var §finally catch switch§:EncryptedNumber;
      
      public function §+"!§(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.§super const do§ = new EncryptedNumberImpl(param1);
         this.§extends package true§ = new EncryptedNumberImpl(param2);
         this.minSplashDamagePercent = new EncryptedNumberImpl(param3);
         this.§finally catch switch§ = new EncryptedNumberImpl(param4);
      }
      
      public function §?,§() : Number
      {
         return this.§extends package true§.getNumber();
      }
      
      public function §include package finally§(param1:Number) : Number
      {
         return this.§finally catch switch§.getNumber() * this.§class catch do§(param1);
      }
      
      private function §class catch do§(param1:Number) : Number
      {
         var _loc2_:Number = this.§super const do§.getNumber();
         var _loc3_:Number = this.§extends package true§.getNumber();
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

