package alternativa.tanks.service.dailyquest
{
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import §return const for§.§%,§;
   import §return const for§.§4#a§;
   
   public class §include set set§ extends §%,§ implements §4#a§, ObjectLoadPostListener, ObjectUnloadPostListener
   {
      [Inject]
      public static var §2!M§:DailyQuestNotifierService;
      
      public function §include set set§()
      {
         super();
      }
      
      public function §@"4§() : void
      {
         §2!M§.showNotification();
      }
      
      public function objectLoadedPost() : void
      {
         §2!M§.addEventListener(§import for case§.§8"I§,this.§!!&§);
      }
      
      private function §!!&§(param1:§import for case§) : void
      {
         server.§native var dynamic§();
      }
      
      public function objectUnloadedPost() : void
      {
         §2!M§.removeEventListener(§import for case§.§8"I§,this.§!!&§);
      }
      
      public function §?"9§() : void
      {
         §2!M§.showNotification();
      }
   }
}

