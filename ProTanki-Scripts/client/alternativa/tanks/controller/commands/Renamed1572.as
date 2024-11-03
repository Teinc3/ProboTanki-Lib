package alternativa.tanks.controller.commands
{
   import alternativa.tanks.controller.events.Renamed553;
   import alternativa.tanks.service.IEntranceServerFacade;
   import org.robotlegs.mvcs.Command;
   
   public class Renamed550 extends Command
   {
      [Inject]
      public var event:Renamed553;
      
      [Inject]
      public var entranceGateway:IEntranceServerFacade;
      
      public function Renamed550()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.entranceGateway.Renamed1570(this.event.Renamed1571);
      }
   }
}

