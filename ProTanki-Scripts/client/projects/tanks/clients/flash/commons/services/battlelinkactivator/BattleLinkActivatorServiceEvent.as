package projects.tanks.clients.flash.commons.services.battlelinkactivator
{
   import flash.events.Event;
   
   public class BattleLinkActivatorServiceEvent extends Event
   {
      public static const ACTIVATE_LINK:String = "BattleLinkActivatorServiceEvent.ACTIVATE_LINK";
      
      public static const CONFIRMED_NAVIGATE:String = "BattleLinkActivatorServiceEvent.CONFIRMED_NAVIGATE";
      
      public static const NOT_CONFIRMED_NAVIGATE:String = "BattleLinkActivatorServiceEvent.NOT_CONFIRMED_NAVIGATE";
      
      public var link:String;
      
      public function BattleLinkActivatorServiceEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         this.link = param2;
         super(param1,param3,param4);
      }
   }
}

