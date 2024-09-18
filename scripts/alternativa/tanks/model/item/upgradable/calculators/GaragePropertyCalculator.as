package alternativa.tanks.model.item.upgradable.calculators
{
   public class GaragePropertyCalculator implements IGaragePropertyCalculator
   {
      private var initialValue:Number;
      
      private var finalValue:Number;
      
      private var maxLevel:int;
      
      private var precision:int;
      
      private var factor:Number;
      
      private var maxWeight:Number;
      
      public function GaragePropertyCalculator(param1:Number, param2:Number, param3:int)
      {
         this.LN_2 = Math.log(2);
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:Number = 0;
         super();
         this.initialValue = param1;
         this.finalValue = param2;
         this.maxLevel = param3;
         this.precision = 0;
         this.factor = 1;
         if(param3 > 0)
         {
            this.maxWeight = this.weight(param3);
            _loc4_ = Math.abs(this.calculate(param3) - this.calculate(param3 - 1));
            this.precision = Math.ceil(-Math.log(_loc4_) / Math.log(10));
            if(this.precision < 0)
            {
               this.precision = 0;
            }
            this.factor = Math.pow(10,-this.precision);
            if(this.precision > 0)
            {
               --this.precision;
               this.factor *= 10;
               _loc5_ = true;
               _loc6_ = "+" + param1.toFixed(this.precision);
               _loc7_ = 0;
               while(_loc7_ < param3)
               {
                  if(this.getDelta(_loc7_) == _loc6_)
                  {
                     _loc5_ = false;
                     break;
                  }
                  _loc7_++;
               }
               if(!_loc5_)
               {
                  ++this.precision;
                  this.factor *= 0.1;
               }
            }
         }
      }
      
      public function getValue(param1:int) : String
      {
         var _loc2_:Number = this.getRoundValue(param1);
         return this.valueToString(_loc2_);
      }
      
      public function getNumberValue(param1:int) : Number
      {
         return this.calculate(param1);
      }
      
      public function getDelta(param1:int) : String
      {
         var _loc2_:String = null;
         var _loc3_:Number = this.round(this.getRoundValue(param1 + 1) - this.getRoundValue(param1));
         if(_loc3_ < 0)
         {
            _loc2_ = "−";
            _loc3_ = -_loc3_;
         }
         else
         {
            _loc2_ = "+";
         }
         return _loc2_ + this.valueToString(_loc3_);
      }
      
      private function valueToString(param1:Number) : String
      {
         return String(param1);
      }
      
      private function getRoundValue(param1:int) : Number
      {
         return this.calculate(param1);
      }
      
      private function calculate(param1:int) : Number
      {
         if(param1 == 0)
         {
            return this.initialValue;
         }
         return this.initialValue + this.weight(param1) * (this.finalValue - this.initialValue) / this.maxWeight;
      }
      
      private function round(param1:Number) : Number
      {
         return Math.round(param1 / this.factor) * this.factor;
      }
      
      private function weight(param1:int) : Number
      {
         return Math.log(param1 + 1) / this.LN_2 + param1 * 5 / this.maxLevel;
      }
      
      public function getPrecision() : int
      {
         return this.precision;
      }
      
      public function setPrecision(param1:int) : void
      {
         this.precision = param1;
         this.factor = Math.pow(10,-this.precision);
      }
   }
}

