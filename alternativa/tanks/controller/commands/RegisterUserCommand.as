package alternativa.tanks.controller.commands
{
   import alternativa.tanks.controller.events.RegisterEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.§each package super§;
   import org.robotlegs.mvcs.Command;
   
   public class RegisterUserCommand extends Command
   {
      [Inject]
      public var event:RegisterEvent;
      
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      [Inject]
      public var urlParams:EntranceUrlParamsModel;
      
      [Inject]
      public var sharedObjects:§each package super§;
      
      [Inject]
      public var serverParams:EntranceServerParamsModel;
      
      public function RegisterUserCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.sharedObjects.§+"d§ = this.event.callsign;
         this.serverFacade.§finally const else§(this.event.callsign,this.event.password,this.urlParams.domain,this.event.rememberMe,this.urlParams.referralHash,this.event.realName,this.event.idNumber,this.event.captchaAnswer);
      }
   }
}

