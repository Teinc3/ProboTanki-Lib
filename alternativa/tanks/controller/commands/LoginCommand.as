package alternativa.tanks.controller.commands
{
   import alternativa.tanks.controller.events.LoginEvent;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.Renamed555;
   import org.robotlegs.mvcs.Command;
   
   public class LoginCommand extends Command
   {
      [Inject]
      public var entranceGateway:IEntranceServerFacade;
      
      [Inject]
      public var loginEvent:LoginEvent;
      
      [Inject]
      public var sharedObjects:Renamed555;
      
      public function LoginCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.sharedObjects.Renamed1567 = this.loginEvent.callsign;
         this.entranceGateway.login(this.loginEvent.callsign,this.loginEvent.password,this.loginEvent.rememberMe);
      }
   }
}

