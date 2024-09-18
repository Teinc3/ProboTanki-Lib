package projects.tanks.clients.flash.commons.services.battlelinkactivator
{
   import flash.events.IEventDispatcher;
   
   public interface IBattleLinkActivatorService extends IEventDispatcher
   {
      function activateLink(param1:String) : void;
      
      function navigateToBattleUrl(param1:String, param2:Boolean, param3:Boolean) : void;
      
      function navigateToBattleUrlWithoutAvailableBattle(param1:String, param2:Boolean) : void;
      
      function isAlive(param1:String) : void;
      
      function alive(param1:String) : void;
      
      function dead(param1:String) : void;
   }
}

