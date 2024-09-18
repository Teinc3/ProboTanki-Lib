package alternativa.tanks.controller.commands.goto
{
   import alternativa.tanks.controller.events.showform.ShowRegistrationFormEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.model.RegistrationBackgroundModel;
   import alternativa.tanks.service.IEntranceServerFacade;
   import flash.display.Bitmap;
   import org.robotlegs.mvcs.Command;
   
   public class GoToRegistrationCommand extends Command
   {
      [Inject]
      public var backgroundModel:RegistrationBackgroundModel;
      
      [Inject]
      public var serverParams:EntranceServerParamsModel;
      
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      [Inject]
      public var paramsModel:EntranceUrlParamsModel;
      
      public function GoToRegistrationCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:Bitmap = this.backgroundModel.backgroundImage;
         dispatch(new ShowRegistrationFormEvent(_loc1_,this.serverParams.antiAddictionEnabled,true,this.serverParams.skipRegistrationEnabled,this.paramsModel.tutorialHash == null,this.serverParams.registrationThroughEmail));
      }
   }
}

