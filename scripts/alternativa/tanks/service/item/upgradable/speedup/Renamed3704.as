package alternativa.tanks.service.item.upgradable.speedup
{
   public class Renamed563 implements SpeedUpCostCalculatorService
   {
      private var Renamed3703:Number;
      
      public function Renamed563()
      {
         super();
      }
      
      public function calculate(param1:int, param2:int) : int
      {
         var _loc3_:Number = Math.round(param1 * (1 + this.Renamed3703 / Math.log(param1 + 10)) * 0.5);
         return this.evaluateValueWithDiscount(_loc3_,param2);
      }
      
      public function init(param1:Number) : void
      {
         this.Renamed3703 = param1 * Math.log(10);
      }
      
      private function evaluateValueWithDiscount(param1:int, param2:int) : int
      {
         return param1 * (100 - param2) * 0.01 + 0.001;
      }
   }
}

