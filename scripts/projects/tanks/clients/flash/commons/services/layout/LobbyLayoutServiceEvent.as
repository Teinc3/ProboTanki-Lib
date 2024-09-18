package projects.tanks.clients.flash.commons.services.layout
{
   import flash.events.Event;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class LobbyLayoutServiceEvent extends Event
   {
      public static const BEGIN_LAYOUT_SWITCH:String = "LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH";
      
      public static const END_LAYOUT_SWITCH:String = "LobbyLayoutServiceEvent.END_LAYOUT_SWITCH";
      
      public var state:LayoutState;
      
      public function LobbyLayoutServiceEvent(param1:String, param2:LayoutState, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.state = param2;
      }
   }
}

