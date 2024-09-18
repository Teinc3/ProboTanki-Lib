package projects.tanks.clients.fp10.libraries.tanksservices.service.premium
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.clearInterval;
   import flash.utils.getTimer;
   import flash.utils.setInterval;
   
   public class §each const import§ extends EventDispatcher implements PremiumService
   {
      private const §case var for§:int = 3600;
      
      private const DAY_IN_SECONDS:int = 86400;
      
      private const UPDATE_INTERVAL:int = 60000;
      
      private var endTime:int;
      
      private var intervalId:uint = 0;
      
      public function §each const import§()
      {
         super();
      }
      
      private function update() : void
      {
         if(!this.hasPremium())
         {
            dispatchEvent(new Event(Event.CHANGE));
            this.§;!j§();
         }
      }
      
      public function hasPremium() : Boolean
      {
         return getTimer() < this.endTime;
      }
      
      public function updateTimeLeft(param1:int) : void
      {
         param1 = Math.min(param1,this.DAY_IN_SECONDS * 2);
         this.endTime = getTimer() + param1 * 1000;
         this.§;!j§();
         if(param1 > 0)
         {
            this.intervalId = setInterval(this.update,this.UPDATE_INTERVAL);
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function getTimeLeft() : int
      {
         return this.endTime - getTimer();
      }
      
      public function destroy() : void
      {
         this.§;!j§();
      }
      
      private function §;!j§() : void
      {
         if(this.intervalId != 0)
         {
            clearInterval(this.intervalId);
            this.intervalId = 0;
         }
      }
   }
}

