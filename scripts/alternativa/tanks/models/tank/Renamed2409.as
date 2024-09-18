package alternativa.tanks.models.tank
{
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   
   public class Renamed2409 implements AutoClosable
   {
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var Renamed1499:TargetingInputManager;
      
      public function Renamed2409()
      {
         super();
         this.init();
      }
      
      public function init() : void
      {
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.Renamed3019);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.Renamed3020);
      }
      
      private function Renamed3020(param1:DialogWindowsDispatcherServiceEvent) : void
      {
         Renamed1499.Renamed2637();
      }
      
      private function Renamed3019(param1:DialogWindowsDispatcherServiceEvent) : void
      {
         Renamed1499.Renamed2632();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.Renamed3019);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.Renamed3020);
      }
   }
}

