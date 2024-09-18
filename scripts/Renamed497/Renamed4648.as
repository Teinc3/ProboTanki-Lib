package Renamed2615
{
   import Renamed477.Renamed4632;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.Renamed2069;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.utils.removeDisplayObject;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed4648 implements AutoClosable
   {
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var Renamed2423:BattleGUIService;
      
      private var Renamed9668:Renamed4632;
      
      public function Renamed4648(param1:Renamed4632)
      {
         super();
         this.Renamed9668 = param1;
         settingsService.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
      
      private function onSettingsAccepted(param1:SettingsServiceEvent) : void
      {
         if(param1.Renamed2070() != Renamed2069.Renamed3734)
         {
            return;
         }
         if(settingsService.showFPS)
         {
            Renamed2423.Renamed2575().addChild(this.Renamed9668);
         }
         else
         {
            removeDisplayObject(this.Renamed9668);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed9668 = null;
         settingsService.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
   }
}

