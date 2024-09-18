package alternativa.tanks.controller.commands.goto
{
   import alternativa.tanks.controller.events.showform.ShowExternalEntranceFormEvent;
   import alternativa.tanks.controller.events.socialnetwork.NavigationExternalEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.service.§each const each§;
   import alternativa.tanks.service.§each package super§;
   import org.robotlegs.mvcs.Command;
   
   public class GoToExternalLoginCommand extends Command
   {
      [Inject]
      public var entranceUrlParamsModel:EntranceUrlParamsModel;
      
      [Inject]
      public var serverParamsModel:EntranceServerParamsModel;
      
      [Inject]
      public var sharedObjectsService:§each package super§;
      
      [Inject]
      public var event:NavigationExternalEvent;
      
      [Inject]
      public var captchaService:§each const each§;
      
      public function GoToExternalLoginCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:Boolean = false;
         if(this.serverParamsModel.loginCaptchaEnabled)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = this.captchaService.loginCaptchaEnabled;
         }
         dispatch(new ShowExternalEntranceFormEvent(ShowExternalEntranceFormEvent.LOGIN_FORM,this.event.socialNetworkId,this.entranceUrlParamsModel.passedCallsign || this.sharedObjectsService.§+"d§,_loc1_));
      }
   }
}

