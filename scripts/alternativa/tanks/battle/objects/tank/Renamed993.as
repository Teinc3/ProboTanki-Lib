package alternativa.tanks.battle.objects.tank
{
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   
   public class Renamed993 implements Renamed947
   {
      private var currentValue:EncryptedNumber;
      
      private var Renamed1155:EncryptedNumber;
      
      private var Renamed1156:Number;
      
      private var Renamed1157:Number;
      
      public function Renamed993(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.Renamed1156 = param1;
         this.Renamed1157 = param2;
         this.Renamed1155 = new EncryptedNumberImpl(param3);
         this.currentValue = new EncryptedNumberImpl(param4);
      }
      
      public function reset(param1:Number) : void
      {
         this.currentValue.setNumber(param1);
         this.Renamed1155.setNumber(param1);
      }
      
      public function update(param1:Number) : Number
      {
         var _loc2_:Number = this.currentValue.getNumber();
         var _loc3_:Number = this.Renamed1155.getNumber();
         if(_loc2_ < _loc3_)
         {
            _loc2_ += this.Renamed1156 * param1;
            if(_loc2_ > _loc3_)
            {
               _loc2_ = _loc3_;
            }
         }
         else if(_loc2_ > _loc3_)
         {
            _loc2_ -= this.Renamed1157 * param1;
            if(_loc2_ < _loc3_)
            {
               _loc2_ = _loc3_;
            }
         }
         this.currentValue.setNumber(_loc2_);
         return _loc2_;
      }
      
      public function Renamed1088(param1:Number) : void
      {
         this.Renamed1155.setNumber(param1);
      }
      
      public function Renamed1081() : Number
      {
         return this.Renamed1155.getNumber();
      }
   }
}

