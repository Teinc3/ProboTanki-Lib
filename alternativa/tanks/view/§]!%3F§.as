package alternativa.tanks.view
{
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.SendNewPasswordAndEmailToChangeEvent;
   import alternativa.tanks.controller.events.SetPasswordChangeResultEvent;
   import alternativa.tanks.view.forms.§!"z§;
   import org.robotlegs.mvcs.Mediator;
   
   public class §]!?§ extends Mediator
   {
      [Inject]
      public var view:§!"z§;
      
      public function §]!?§()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         addViewListener(NavigationEvent.GO_TO_LOGIN_FORM,dispatch,NavigationEvent);
         addViewListener(SendNewPasswordAndEmailToChangeEvent.SEND,dispatch,SendNewPasswordAndEmailToChangeEvent);
         addContextListener(SetPasswordChangeResultEvent.SET,this.§>G§,SetPasswordChangeResultEvent);
      }
      
      private function §>G§(param1:SetPasswordChangeResultEvent) : void
      {
         this.view.§dynamic const do§(param1.success,param1.error);
      }
   }
}

