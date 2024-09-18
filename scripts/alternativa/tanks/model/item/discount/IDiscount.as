package alternativa.tanks.model.item.discount
{
   import controls.timer.CountDownTimer;
   
   public interface IDiscount
   {
      function getDiscountInPercent() : int;
      
      function applyDiscount(param1:int) : int;
      
      function getEndDiscountTimer() : CountDownTimer;
   }
}

