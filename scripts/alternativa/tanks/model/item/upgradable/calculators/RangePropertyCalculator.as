package alternativa.tanks.model.item.upgradable.calculators
{
   public class RangePropertyCalculator implements IGaragePropertyCalculator
   {
      private var minValue:GaragePropertyCalculator;
      
      private var maxValue:GaragePropertyCalculator;
      
      public function RangePropertyCalculator(param1:GaragePropertyCalculator, param2:GaragePropertyCalculator)
      {
         super();
         if(param1.getNumberValue(0) < param2.getNumberValue(0))
         {
            this.minValue = param1;
            this.maxValue = param2;
         }
         else
         {
            this.minValue = param2;
            this.maxValue = param1;
         }
         this.minValue.setPrecision(this.maxValue.getPrecision());
      }
      
      public function getValue(param1:int) : String
      {
         return this.minValue.getValue(param1) + "-" + this.maxValue.getValue(param1);
      }
      
      public function getDelta(param1:int) : String
      {
         return this.maxValue.getDelta(param1);
      }
      
      public function getPrecision() : int
      {
         return this.maxValue.getPrecision();
      }
      
      public function setPrecision(param1:int) : void
      {
         this.minValue.setPrecision(param1);
         this.maxValue.setPrecision(param1);
      }
   }
}

