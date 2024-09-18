package alternativa.tanks.model.item.upgradable.calculators
{
   public interface IGaragePropertyCalculator
   {
      function getValue(param1:int) : String;
      
      function getPrecision() : int;
      
      function setPrecision(param1:int) : void;
      
      function getDelta(param1:int) : String;
   }
}

