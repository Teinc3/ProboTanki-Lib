package alternativa.tanks.battle.objects.tank
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class §get set continue§ implements §implements set get§
   {
      private var currentValue:EncryptedNumber;
      
      private var §]"D§:EncryptedNumber;
      
      private var §;!u§:Number;
      
      private var §,"Z§:Number;
      
      public function §get set continue§(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.§;!u§ = param1;
         this.§,"Z§ = param2;
         this.§]"D§ = new EncryptedNumberImpl(param3);
         this.currentValue = new EncryptedNumberImpl(param4);
      }
      
      public function reset(param1:Number) : void
      {
         this.currentValue.setNumber(param1);
         this.§]"D§.setNumber(param1);
      }
      
      public function update(param1:Number) : Number
      {
         var _loc2_:Number = this.currentValue.getNumber();
         var _loc3_:Number = this.§]"D§.getNumber();
         if(_loc2_ < _loc3_)
         {
            _loc2_ += this.§;!u§ * param1;
            if(_loc2_ > _loc3_)
            {
               _loc2_ = _loc3_;
            }
         }
         else if(_loc2_ > _loc3_)
         {
            _loc2_ -= this.§,"Z§ * param1;
            if(_loc2_ < _loc3_)
            {
               _loc2_ = _loc3_;
            }
         }
         this.currentValue.setNumber(_loc2_);
         return _loc2_;
      }
      
      public function §while catch do§(param1:Number) : void
      {
         this.§]"D§.setNumber(param1);
      }
      
      public function §try package finally§() : Number
      {
         return this.§]"D§.getNumber();
      }
   }
}

