package alternativa.tanks.controller.commands.socialnetwork
{
   import alternativa.tanks.controller.events.socialnetwork.ExternalLoginEvent;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.Renamed555;
   import org.robotlegs.mvcs.Command;
   
   public class ExternalLoginCommand extends Command
   {
      [Inject]
      public var entranceGateway:IEntranceServerFacade;
      
      [Inject]
      public var loginEvent:ExternalLoginEvent;
      
      [Inject]
      public var sharedObjects:Renamed555;
      
      public function ExternalLoginCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.sharedObjects.Renamed1567 = this.loginEvent.callsign;
         this.entranceGateway.Renamed1575(this.loginEvent.callsign,this.loginEvent.password);
      }
   }
}

