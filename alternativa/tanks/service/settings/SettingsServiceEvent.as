package alternativa.tanks.service.settings
{
   import flash.events.Event;
   
   public class SettingsServiceEvent extends Event
   {
      public static const SETTINGS_CHANGED:String = "SettingsServiceEvent.SETTINGS_CHANGED";
      
      private var §switch var for§:§[!;§;
      
      public function SettingsServiceEvent(param1:String, param2:§[!;§)
      {
         super(param1,true,false);
         this.§switch var for§ = param2;
      }
      
      public function §native set catch§() : §[!;§
      {
         return this.§switch var for§;
      }
   }
}

