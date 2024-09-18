package alternativa.tanks.controller.commands.socialnetwork
{
   import alternativa.tanks.controller.events.socialnetwork.ExternalLoginEvent;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.§each package super§;
   import org.robotlegs.mvcs.Command;
   
   public class ExternalLoginCommand extends Command
   {
      [Inject]
      public var entranceGateway:IEntranceServerFacade;
      
      [Inject]
      public var loginEvent:ExternalLoginEvent;
      
      [Inject]
      public var sharedObjects:§each package super§;
      
      public function ExternalLoginCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.sharedObjects.§+"d§ = this.loginEvent.callsign;
         this.entranceGateway.§extends for super§(this.loginEvent.callsign,this.loginEvent.password);
      }
   }
}

