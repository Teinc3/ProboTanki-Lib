package Renamed200
{
   import Renamed479.Renamed2753;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import flash.events.Event;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed2749 implements AutoClosable
   {
      [Inject]
      public static var settings:ISettingsService;
      
      private var controller:Renamed2753;
      
      public function Renamed2749(param1:Renamed2753)
      {
         super();
         this.controller = param1;
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
      
      private function onSettingsAccepted(param1:Event) : void
      {
         this.controller.Renamed2836(settings.inverseBackDriving);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.controller = null;
         settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
   }
}

