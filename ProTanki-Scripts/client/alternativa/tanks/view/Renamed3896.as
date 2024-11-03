package alternativa.tanks.view
{
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.SendNewPasswordAndEmailToChangeEvent;
   import alternativa.tanks.controller.events.SetPasswordChangeResultEvent;
   import alternativa.tanks.view.forms.Renamed558;
   import org.robotlegs.mvcs.Mediator;
   
   public class Renamed557 extends Mediator
   {
      [Inject]
      public var view:Renamed558;
      
      public function Renamed557()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         addViewListener(NavigationEvent.GO_TO_LOGIN_FORM,dispatch,NavigationEvent);
         addViewListener(SendNewPasswordAndEmailToChangeEvent.SEND,dispatch,SendNewPasswordAndEmailToChangeEvent);
         addContextListener(SetPasswordChangeResultEvent.SET,this.Renamed3895,SetPasswordChangeResultEvent);
      }
      
      private function Renamed3895(param1:SetPasswordChangeResultEvent) : void
      {
         this.view.Renamed3582(param1.success,param1.error);
      }
   }
}

