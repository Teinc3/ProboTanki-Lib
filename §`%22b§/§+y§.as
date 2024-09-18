package §`"b§
{
   import §]#1§.§^;§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.§[!;§;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.utils.removeDisplayObject;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §+y§ implements AutoClosable
   {
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var §]!W§:BattleGUIService;
      
      private var §switch var extends§:§^;§;
      
      public function §+y§(param1:§^;§)
      {
         super();
         this.§switch var extends§ = param1;
         settingsService.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
      
      private function onSettingsAccepted(param1:SettingsServiceEvent) : void
      {
         if(param1.§native set catch§() != §[!;§.§<!r§)
         {
            return;
         }
         if(settingsService.showFPS)
         {
            §]!W§.§break catch true§().addChild(this.§switch var extends§);
         }
         else
         {
            removeDisplayObject(this.§switch var extends§);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§switch var extends§ = null;
         settingsService.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.onSettingsAccepted);
      }
   }
}

