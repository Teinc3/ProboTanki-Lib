package alternativa.tanks.gui.settings
{
   import Renamed1959.Renamed1960;
   import Renamed1959.Renamed1961;
   import Renamed303.Renamed1962;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.base.DefaultButtonBase;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import Renamed419.Renamed1963;
   import Renamed445.Renamed1964;
   
   public class SettingsWindow extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var helperService:IHelpService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      public static const Renamed1965:int = WINDOW_HEIGHT - 2 * WINDOW_MARGIN - 2 * Renamed1966 - MARGIN;
      
      public static const Renamed1967:int = WINDOW_WIDTH - 2 * WINDOW_MARGIN;
      
      public static const WINDOW_MARGIN:int = 12;
      
      public static const Renamed1966:int = 33;
      
      public static const BUTTON_WIDTH:int = 104;
      
      private static const WINDOW_WIDTH:int = 775;
      
      private static const WINDOW_HEIGHT:int = 560;
      
      private static const MARGIN:int = 8;
      
      private var closeButton:DefaultButtonBase;
      
      private var Renamed1968:Renamed1969;
      
      private var Renamed1970:Dictionary;
      
      private var Renamed1971:Renamed1961 = null;
      
      public function SettingsWindow(param1:String, param2:Boolean, param3:Boolean, param4:Boolean, param5:String, param6:String)
      {
         var _loc7_:TankWindow = null;
         var _loc8_:Boolean = false;
         var _loc9_:Renamed1962 = null;
         this.Renamed1970 = new Dictionary();
         super();
         (_loc7_ = new TankWindow(WINDOW_WIDTH,WINDOW_HEIGHT)).headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         _loc7_.header = TankWindowHeader.SETTINGS;
         addChild(_loc7_);
         this.Renamed1968 = new Renamed1969();
         this.Renamed1968.Renamed1972(Renamed1958.GAME);
         this.Renamed1968.Renamed1972(Renamed1958.GRAPHIC);
         _loc8_ = !partnersService.isRunningInsidePartnerEnvironment() || param4;
         if(_loc8_)
         {
            this.Renamed1968.Renamed1972(Renamed1958.ACCOUNT);
         }
         this.Renamed1968.Renamed1972(Renamed1958.CONTROL);
         this.Renamed1968.Renamed1973(Renamed1958.GAME);
         this.Renamed1968.x = this.Renamed1968.y = WINDOW_MARGIN;
         this.Renamed1968.addEventListener(SelectTabEvent.Renamed1957,this.Renamed1974);
         addChild(this.Renamed1968);
         var _loc10_:Renamed1960;
         (_loc10_ = new Renamed1960()).y = this.Renamed1968.y + this.Renamed1968.height + MARGIN;
         _loc10_.x = WINDOW_MARGIN;
         this.Renamed1970[Renamed1958.GRAPHIC] = _loc10_;
         var _loc11_:Renamed1963;
         (_loc11_ = new Renamed1963(param3)).y = this.Renamed1968.y + this.Renamed1968.height + MARGIN;
         _loc11_.x = WINDOW_MARGIN;
         this.Renamed1970[Renamed1958.GAME] = _loc11_;
         if(_loc8_)
         {
            (_loc9_ = new Renamed1962(param1,param2,param4,param5,param6)).y = this.Renamed1968.y + this.Renamed1968.height + MARGIN;
            _loc9_.x = WINDOW_MARGIN;
            this.Renamed1970[Renamed1958.ACCOUNT] = _loc9_;
         }
         var _loc12_:Renamed1964;
         (_loc12_ = new Renamed1964()).y = this.Renamed1968.y + this.Renamed1968.height + MARGIN;
         _loc12_.x = WINDOW_MARGIN;
         this.Renamed1970[Renamed1958.CONTROL] = _loc12_;
         this.Renamed1968.Renamed1973(Renamed1958.GAME);
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.x = WINDOW_WIDTH - this.closeButton.width - WINDOW_MARGIN;
         this.closeButton.y = WINDOW_HEIGHT - this.closeButton.height - WINDOW_MARGIN;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.Renamed1975);
         _loc7_.height = WINDOW_HEIGHT;
      }
      
      private function Renamed1974(param1:SelectTabEvent) : void
      {
         if(this.Renamed1971 != null && contains(this.Renamed1971))
         {
            this.Renamed1971.hide();
            removeChild(this.Renamed1971);
         }
         var _loc2_:Renamed1961 = this.Renamed1970[param1.getSelectedCategory()];
         if(_loc2_ != null)
         {
            this.Renamed1971 = _loc2_;
            addChild(this.Renamed1971);
            this.Renamed1971.show();
         }
      }
      
      public function show() : void
      {
         dialogService.addDialog(this);
      }
      
      private function Renamed1975(param1:MouseEvent = null) : void
      {
         this.Renamed1976();
      }
      
      private function Renamed1976() : void
      {
         helperService.hideAllHelpers();
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.Renamed1977));
      }
      
      public function Renamed1978() : Renamed1962
      {
         return this.Renamed1970[Renamed1958.ACCOUNT];
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.Renamed1976();
      }
      
      public function destroy() : void
      {
         var _loc1_:Renamed1961 = null;
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.Renamed1975);
         this.Renamed1968.removeEventListener(SelectTabEvent.Renamed1957,this.Renamed1974);
         this.Renamed1968.destroy();
         for each(_loc1_ in this.Renamed1970)
         {
            _loc1_.destroy();
         }
         dialogService.removeDialog(this);
         display.stage.focus = null;
      }
   }
}

