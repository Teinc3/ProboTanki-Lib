package alternativa.tanks.controller.commands
{
   import alternativa.tanks.controller.events.SendNewPasswordAndEmailToChangeEvent;
   import alternativa.tanks.service.IEntranceServerFacade;
   import org.robotlegs.mvcs.Command;
   
   public class Renamed549 extends Command
   {
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      [Inject]
      public var event:SendNewPasswordAndEmailToChangeEvent;
      
      public function Renamed549()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.serverFacade.changePasswordAndEmail(this.event.password,this.event.email);
      }
   }
}

