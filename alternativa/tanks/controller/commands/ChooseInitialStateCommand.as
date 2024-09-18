package alternativa.tanks.controller.commands
{
   import alternativa.tanks.controller.events.EntranceErrorEvent;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.§each package super§;
   import org.robotlegs.mvcs.Command;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   
   public class ChooseInitialStateCommand extends Command
   {
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      [Inject]
      public var urlParams:EntranceUrlParamsModel;
      
      [Inject]
      public var sharedObjectsService:§each package super§;
      
      [Inject]
      public var serverParams:EntranceServerParamsModel;
      
      [Inject]
      public var partnerService:IPartnerService;
      
      public function ChooseInitialStateCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:String = null;
         if(this.serverParams.serverHalt)
         {
            dispatch(new EntranceErrorEvent(EntranceErrorEvent.SERVER_HALT));
         }
         else if(this.serverParams.inviteEnabled)
         {
            dispatch(new NavigationEvent(NavigationEvent.GO_TO_INVITE_FORM));
         }
         else if(Boolean(this.urlParams.entranceHash) || Boolean(this.sharedObjectsService.entranceHash))
         {
            _loc1_ = this.urlParams.entranceHash || this.sharedObjectsService.entranceHash;
            this.serverFacade.loginByHash(_loc1_);
         }
         else if(this.sharedObjectsService.§use catch switch§)
         {
            dispatch(new NavigationEvent(NavigationEvent.GO_TO_LOGIN_FORM));
         }
         else
         {
            this.sharedObjectsService.§use catch switch§ = true;
            dispatch(new NavigationEvent(NavigationEvent.GO_TO_REGISTRATION_FORM));
         }
      }
   }
}

