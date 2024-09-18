package alternativa.tanks.view
{
   import alternativa.tanks.controller.events.Renamed553;
   import alternativa.tanks.controller.events.InviteCheckResultEvent;
   import alternativa.tanks.view.events.Renamed3890;
   import alternativa.tanks.view.forms.Renamed559;
   import org.robotlegs.mvcs.Mediator;
   
   public class Renamed556 extends Mediator
   {
      [Inject]
      public var view:Renamed559;
      
      public function Renamed556()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         addViewListener(Renamed3890.OK_BUTTON_CLICKED,this.Renamed3891,Renamed3890);
         addContextListener(InviteCheckResultEvent.INVITE_CODE_DOES_NOT_EXIST,this.Renamed3892,InviteCheckResultEvent);
      }
      
      private function Renamed3892(param1:InviteCheckResultEvent) : void
      {
         this.view.Renamed3893();
      }
      
      private function Renamed3891(param1:Renamed3890) : void
      {
         dispatch(new Renamed553(this.view.code));
      }
   }
}

