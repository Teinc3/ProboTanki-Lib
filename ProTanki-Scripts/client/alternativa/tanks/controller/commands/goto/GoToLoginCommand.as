package alternativa.tanks.controller.commands.goto
{
   import alternativa.tanks.controller.events.showform.ShowLoginFormEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.service.Renamed554;
   import alternativa.tanks.service.Renamed555;
   import org.robotlegs.mvcs.Command;
   
   public class GoToLoginCommand extends Command
   {
      [Inject]
      public var entranceUrlParamsModel:EntranceUrlParamsModel;
      
      [Inject]
      public var sharedObjectsService:Renamed555;
      
      [Inject]
      public var serverParamsModel:EntranceServerParamsModel;
      
      [Inject]
      public var captchaService:Renamed554;
      
      public function GoToLoginCommand()
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
         dispatch(new ShowLoginFormEvent(this.entranceUrlParamsModel.passedCallsign || this.sharedObjectsService.Renamed1567,true,_loc1_,this.entranceUrlParamsModel.passedPassword));
      }
   }
}

