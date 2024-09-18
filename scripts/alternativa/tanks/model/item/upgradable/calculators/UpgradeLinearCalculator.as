package alternativa.tanks.model.item.upgradable.calculators
{
   import projects.tanks.client.garage.models.item.upgradeable.calculators.LinearParams;
   
   public class UpgradeLinearCalculator
   {
      private var params:LinearParams;
      
      public function UpgradeLinearCalculator(param1:LinearParams)
      {
         super();
         this.params = param1;
      }
      
      public function calculate(param1:int) : int
      {
         return Math.round(this.params.initialValue + this.params.step * param1);
      }
   }
}

