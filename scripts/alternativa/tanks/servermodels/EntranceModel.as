package alternativa.tanks.servermodels
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IEntranceServerFacade;
   import flash.events.Event;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import projects.tanks.client.entrance.model.entrance.entrance.EntranceModelBase;
   import projects.tanks.client.entrance.model.entrance.entrance.IEntranceModelBase;
   
   public class EntranceModel extends EntranceModelBase implements IEntranceModelBase, ObjectLoadListener, ObjectLoadPostListener, ObjectUnloadListener, ObjectUnloadPostListener
   {
      [Inject]
      public static var serverFacade:IEntranceServerFacade;
      
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var display:IDisplay;
      
      public function EntranceModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clientFacade.antiAddictionEnabled = false;
         display.stage.dispatchEvent(new Event("EntranceModel.objectLoaded",true));
      }
      
      public function objectLoadedPost() : void
      {
         serverFacade.Renamed3539 = object;
         clientFacade.Renamed3539 = object;
         IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).bindFacade(clientFacade);
      }
      
      public function objectUnloaded() : void
      {
         IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).unbindFacade();
      }
      
      public function objectUnloadedPost() : void
      {
         clientFacade.Renamed3540();
      }
   }
}

