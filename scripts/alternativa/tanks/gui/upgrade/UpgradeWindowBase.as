package alternativa.tanks.gui.upgrade
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.TankWindowHeader;
   import controls.base.DefaultButtonBase;
   import flash.events.MouseEvent;
   import forms.base.BaseForm;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class UpgradeWindowBase extends BaseForm
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const VERTICAL_MARGIN:int = 8;
      
      private static const HORIZONTAL_MARGIN:int = 12;
      
      protected var cancelButton:DefaultButtonBase;
      
      public function UpgradeWindowBase(param1:int, param2:int)
      {
         super(param1,param2);
         bg.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         bg.header = TankWindowHeader.SETTINGS;
         this.cancelButton = new DefaultButtonBase();
         this.cancelButton.width = 95;
         this.cancelButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CLOSE_TEXT);
         this.cancelButton.y = param2 - 5 - this.cancelButton.height - VERTICAL_MARGIN;
         this.cancelButton.x = param1 - this.cancelButton.width - HORIZONTAL_MARGIN;
         this.cancelButton.addEventListener(MouseEvent.CLICK,this.onMouseClick);
         bg.addChild(this.cancelButton);
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      protected function onClose() : void
      {
      }
      
      protected function removeEvents() : void
      {
         this.cancelButton.removeEventListener(MouseEvent.CLICK,this.onClose);
      }
   }
}

