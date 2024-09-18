package §+!e§
{
   import §]#R§.§&!r§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import flash.events.Event;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §6"0§ implements AutoClosable
   {
      [Inject]
      public static var settings:ISettingsService;
      
      private var controller:§&!r§;
      
      public function §6"0§(param1:§&!r§)
      {
         super();
         this.controller = param1;
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
      
      private function onSettingsAccepted(param1:Event) : void
      {
         this.controller.§"!w§(settings.inverseBackDriving);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.controller = null;
         settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
   }
}

