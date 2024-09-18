package §case var include§
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import §dynamic use§.§>#M§;
   import §dynamic use§.§dynamic const for§;
   import platform.client.fp10.core.model.IObjectLoadListener;
   
   public class §for set do§ extends §dynamic const for§ implements §>#M§, §switch set false§, IObjectLoadListener
   {
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      public function §for set do§()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clientFacade.inviteEnabled = getInitParam().enabled;
      }
      
      public function §3"_§() : void
      {
         clientFacade.§3"_§();
      }
      
      public function §for catch switch§() : void
      {
         clientFacade.§with continue§();
      }
      
      public function §=#"§(param1:String) : void
      {
         clientFacade.§=#"§(param1);
      }
      
      public function checkInvite(param1:String) : void
      {
         server.§%!!§(param1);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

