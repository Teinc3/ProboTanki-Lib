package alternativa.tanks.service.settings
{
   import flash.events.Event;
   
   public class SettingsServiceEvent extends Event
   {
      public static const SETTINGS_CHANGED:String = "SettingsServiceEvent.SETTINGS_CHANGED";
      
      private var Renamed3727:Renamed2069;
      
      public function SettingsServiceEvent(param1:String, param2:Renamed2069)
      {
         super(param1,true,false);
         this.Renamed3727 = param2;
      }
      
      public function Renamed2070() : Renamed2069
      {
         return this.Renamed3727;
      }
   }
}

