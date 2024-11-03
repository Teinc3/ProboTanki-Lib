package alternativa.model.timeperiod
{
   public interface TimePeriod
   {
      function isEnabled() : Boolean;
      
      function isTimeless() : Boolean;
      
      function getModelLoadingTimeInMillis() : int;
      
      function getTimeLeftInSeconds() : int;
      
      function getTimeToStartInSeconds() : int;
   }
}

