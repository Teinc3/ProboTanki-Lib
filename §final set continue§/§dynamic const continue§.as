package §final set continue§
{
   import §-!?§.§for catch final§;
   import §-!?§.§for for true§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.IEntranceClientFacade;
   import scpacker.gui.ConfirmEmailCode;
   
   public class §dynamic const continue§ extends §for catch final§ implements §=n§, §for for true§
   {
      [Inject]
      public static var entranceClientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var §@#$§:String;
      
      public function §dynamic const continue§()
      {
         super();
      }
      
      public function sendUsersRestorePasswordLink(param1:String) : void
      {
         server.sendUsersRestorePasswordLink(param1);
      }
      
      public function changePasswordAndEmail(param1:String, param2:String) : void
      {
         server.changePasswordAndEmail(this.§@#$§,param1,param2);
      }
      
      public function §;#o§(param1:String) : void
      {
         this.§@#$§ = param1;
         server.§null set true§(param1);
      }
      
      public function §case var in§() : void
      {
         entranceClientFacade.§case var in§();
      }
      
      public function §1$$§() : void
      {
         display.cursorLayer.addChild(new ConfirmEmailCode(localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_ENTER_CODE),this.§;#o§));
      }
      
      public function §package var native§() : void
      {
         entranceClientFacade.§package var native§();
      }
      
      public function §import catch get§(param1:String) : void
      {
         entranceClientFacade.§super catch do§(param1);
      }
      
      public function §4"l§() : void
      {
         entranceClientFacade.§3"h§();
      }
      
      public function §dynamic const do§(param1:Boolean, param2:String) : void
      {
         entranceClientFacade.§dynamic const do§(param1,param2);
      }
   }
}

