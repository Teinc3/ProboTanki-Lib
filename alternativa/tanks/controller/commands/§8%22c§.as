package alternativa.tanks.controller.commands
{
   import alternativa.tanks.controller.events.§<#l§;
   import alternativa.tanks.service.IEntranceServerFacade;
   import org.robotlegs.mvcs.Command;
   
   public class §8"c§ extends Command
   {
      [Inject]
      public var event:§<#l§;
      
      [Inject]
      public var entranceGateway:IEntranceServerFacade;
      
      public function §8"c§()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.entranceGateway.§""B§(this.event.§9!,§);
      }
   }
}

