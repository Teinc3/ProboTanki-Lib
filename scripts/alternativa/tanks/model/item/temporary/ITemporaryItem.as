package alternativa.tanks.model.item.temporary
{
   public interface ITemporaryItem
   {
      function getStopDate() : Date;
      
      function startTiming(param1:int) : void;
      
      function getTimeRemainingInMSec() : Number;
   }
}

