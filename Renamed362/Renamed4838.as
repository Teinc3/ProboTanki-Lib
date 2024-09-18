package Renamed362
{
   import Renamed4829.Renamed6212;
   import Renamed4829.Renamed4830;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.IEntranceClientFacade;
   import scpacker.gui.ConfirmEmailCode;
   
   public class Renamed4838 extends Renamed6212 implements Renamed4836, Renamed4830
   {
      [Inject]
      public static var entranceClientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed8182:String;
      
      public function Renamed4838()
      {
         super();
      }
      
      public function sendUsersRestorePasswordLink(param1:String) : void
      {
         server.sendUsersRestorePasswordLink(param1);
      }
      
      public function changePasswordAndEmail(param1:String, param2:String) : void
      {
         server.changePasswordAndEmail(this.Renamed8182,param1,param2);
      }
      
      public function Renamed8181(param1:String) : void
      {
         this.Renamed8182 = param1;
         server.Renamed6210(param1);
      }
      
      public function Renamed3578() : void
      {
         entranceClientFacade.Renamed3578();
      }
      
      public function Renamed7467() : void
      {
         display.cursorLayer.addChild(new ConfirmEmailCode(localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_ENTER_CODE),this.Renamed8181));
      }
      
      public function Renamed3579() : void
      {
         entranceClientFacade.Renamed3579();
      }
      
      public function Renamed6221(param1:String) : void
      {
         entranceClientFacade.Renamed3581(param1);
      }
      
      public function Renamed6222() : void
      {
         entranceClientFacade.Renamed3580();
      }
      
      public function Renamed3582(param1:Boolean, param2:String) : void
      {
         entranceClientFacade.Renamed3582(param1,param2);
      }
   }
}

