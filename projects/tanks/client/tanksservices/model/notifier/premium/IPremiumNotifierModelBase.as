package projects.tanks.client.tanksservices.model.notifier.premium
{
   public interface IPremiumNotifierModelBase
   {
      function setPremiumTimeLeft(param1:Vector.<PremiumNotifierData>) : void;
      
      function updateTimeLeft(param1:int) : void;
   }
}

