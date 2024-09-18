package alternativa.tanks.models.tank
{
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.DialogWindowsDispatcherServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   
   public class §var catch§ implements AutoClosable
   {
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var §9!U§:TargetingInputManager;
      
      public function §var catch§()
      {
         super();
         this.init();
      }
      
      public function init() : void
      {
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.§get var for§);
         dialogWindowsDispatcherService.addEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.§static package package§);
      }
      
      private function §static package package§(param1:DialogWindowsDispatcherServiceEvent) : void
      {
         §9!U§.§return const class§();
      }
      
      private function §get var for§(param1:DialogWindowsDispatcherServiceEvent) : void
      {
         §9!U§.§6c§();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.OPEN,this.§get var for§);
         dialogWindowsDispatcherService.removeEventListener(DialogWindowsDispatcherServiceEvent.CLOSE,this.§static package package§);
      }
   }
}

