package alternativa.tanks.controller.commands
{
   import alternativa.tanks.controller.events.LoginEvent;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.§each package super§;
   import org.robotlegs.mvcs.Command;
   
   public class LoginCommand extends Command
   {
      [Inject]
      public var entranceGateway:IEntranceServerFacade;
      
      [Inject]
      public var loginEvent:LoginEvent;
      
      [Inject]
      public var sharedObjects:§each package super§;
      
      public function LoginCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.sharedObjects.§+"d§ = this.loginEvent.callsign;
         this.entranceGateway.login(this.loginEvent.callsign,this.loginEvent.password,this.loginEvent.rememberMe);
      }
   }
}

