package alternativa.tanks.controller.commands.socialnetwork
{
   import alternativa.tanks.controller.events.socialnetwork.StartExternalEntranceEvent;
   import alternativa.tanks.service.IEntranceServerFacade;
   import org.robotlegs.mvcs.Command;
   
   public class StartExternalRegisterUserCommand extends Command
   {
      [Inject]
      public var event:StartExternalEntranceEvent;
      
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      public function StartExternalRegisterUserCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         this.serverFacade.startExternalRegisterUser(this.event.socialNetworkId,this.event.rememberMe,"atanksonline.ru");
      }
   }
}

