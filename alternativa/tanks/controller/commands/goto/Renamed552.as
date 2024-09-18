package alternativa.tanks.controller.commands.goto
{
   import alternativa.tanks.controller.events.showform.ShowFormEvent;
   import org.robotlegs.mvcs.Command;
   
   public class Renamed552 extends Command
   {
      public function Renamed552()
      {
         super();
      }
      
      override public function execute() : void
      {
         dispatch(new ShowFormEvent(ShowFormEvent.SHOW_INVITE_FORM));
      }
   }
}

