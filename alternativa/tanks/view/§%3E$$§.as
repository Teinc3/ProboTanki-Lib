package alternativa.tanks.view
{
   import alternativa.tanks.controller.events.§<#l§;
   import alternativa.tanks.controller.events.InviteCheckResultEvent;
   import alternativa.tanks.view.events.§'""§;
   import alternativa.tanks.view.forms.§case do§;
   import org.robotlegs.mvcs.Mediator;
   
   public class §>$$§ extends Mediator
   {
      [Inject]
      public var view:§case do§;
      
      public function §>$$§()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         addViewListener(§'""§.OK_BUTTON_CLICKED,this.§return catch switch§,§'""§);
         addContextListener(InviteCheckResultEvent.INVITE_CODE_DOES_NOT_EXIST,this.§const package continue§,InviteCheckResultEvent);
      }
      
      private function §const package continue§(param1:InviteCheckResultEvent) : void
      {
         this.view.§override package var§();
      }
      
      private function §return catch switch§(param1:§'""§) : void
      {
         dispatch(new §<#l§(this.view.code));
      }
   }
}

