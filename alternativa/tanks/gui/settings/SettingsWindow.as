package alternativa.tanks.gui.settings
{
   import §"f§.§[#-§;
   import §"f§.§with for import§;
   import §@#3§.§"!y§;
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
   import §set static§.§else catch with§;
   import §try const return§.§break implements§;
   
   public class SettingsWindow extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var helperService:IHelpService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      public static const §7E§:int = WINDOW_HEIGHT - 2 * WINDOW_MARGIN - 2 * §switch package try§ - MARGIN;
      
      public static const §each package null§:int = WINDOW_WIDTH - 2 * WINDOW_MARGIN;
      
      public static const WINDOW_MARGIN:int = 12;
      
      public static const §switch package try§:int = 33;
      
      public static const BUTTON_WIDTH:int = 104;
      
      private static const WINDOW_WIDTH:int = 775;
      
      private static const WINDOW_HEIGHT:int = 560;
      
      private static const MARGIN:int = 8;
      
      private var closeButton:DefaultButtonBase;
      
      private var §return set implements§:§"#Y§;
      
      private var §include for import§:Dictionary;
      
      private var §9"w§:§with for import§ = null;
      
      public function SettingsWindow(param1:String, param2:Boolean, param3:Boolean, param4:Boolean, param5:String, param6:String)
      {
         var _loc7_:TankWindow = null;
         var _loc8_:Boolean = false;
         var _loc9_:§"!y§ = null;
         this.§include for import§ = new Dictionary();
         super();
         (_loc7_ = new TankWindow(WINDOW_WIDTH,WINDOW_HEIGHT)).headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         _loc7_.header = TankWindowHeader.SETTINGS;
         addChild(_loc7_);
         this.§return set implements§ = new §"#Y§();
         this.§return set implements§.§<!Q§(§const const const§.GAME);
         this.§return set implements§.§<!Q§(§const const const§.GRAPHIC);
         _loc8_ = !partnersService.isRunningInsidePartnerEnvironment() || param4;
         if(_loc8_)
         {
            this.§return set implements§.§<!Q§(§const const const§.ACCOUNT);
         }
         this.§return set implements§.§<!Q§(§const const const§.CONTROL);
         this.§return set implements§.§ !Y§(§const const const§.GAME);
         this.§return set implements§.x = this.§return set implements§.y = WINDOW_MARGIN;
         this.§return set implements§.addEventListener(SelectTabEvent.§@=§,this.§`#D§);
         addChild(this.§return set implements§);
         var _loc10_:§[#-§;
         (_loc10_ = new §[#-§()).y = this.§return set implements§.y + this.§return set implements§.height + MARGIN;
         _loc10_.x = WINDOW_MARGIN;
         this.§include for import§[§const const const§.GRAPHIC] = _loc10_;
         var _loc11_:§else catch with§;
         (_loc11_ = new §else catch with§(param3)).y = this.§return set implements§.y + this.§return set implements§.height + MARGIN;
         _loc11_.x = WINDOW_MARGIN;
         this.§include for import§[§const const const§.GAME] = _loc11_;
         if(_loc8_)
         {
            (_loc9_ = new §"!y§(param1,param2,param4,param5,param6)).y = this.§return set implements§.y + this.§return set implements§.height + MARGIN;
            _loc9_.x = WINDOW_MARGIN;
            this.§include for import§[§const const const§.ACCOUNT] = _loc9_;
         }
         var _loc12_:§break implements§;
         (_loc12_ = new §break implements§()).y = this.§return set implements§.y + this.§return set implements§.height + MARGIN;
         _loc12_.x = WINDOW_MARGIN;
         this.§include for import§[§const const const§.CONTROL] = _loc12_;
         this.§return set implements§.§ !Y§(§const const const§.GAME);
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.x = WINDOW_WIDTH - this.closeButton.width - WINDOW_MARGIN;
         this.closeButton.y = WINDOW_HEIGHT - this.closeButton.height - WINDOW_MARGIN;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.§class in§);
         _loc7_.height = WINDOW_HEIGHT;
      }
      
      private function §`#D§(param1:SelectTabEvent) : void
      {
         if(this.§9"w§ != null && contains(this.§9"w§))
         {
            this.§9"w§.hide();
            removeChild(this.§9"w§);
         }
         var _loc2_:§with for import§ = this.§include for import§[param1.getSelectedCategory()];
         if(_loc2_ != null)
         {
            this.§9"w§ = _loc2_;
            addChild(this.§9"w§);
            this.§9"w§.show();
         }
      }
      
      public function show() : void
      {
         dialogService.addDialog(this);
      }
      
      private function §class in§(param1:MouseEvent = null) : void
      {
         this.§default set use§();
      }
      
      private function §default set use§() : void
      {
         helperService.hideAllHelpers();
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.§[#5§));
      }
      
      public function §<9§() : §"!y§
      {
         return this.§include for import§[§const const const§.ACCOUNT];
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.§default set use§();
      }
      
      public function destroy() : void
      {
         var _loc1_:§with for import§ = null;
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.§class in§);
         this.§return set implements§.removeEventListener(SelectTabEvent.§@=§,this.§`#D§);
         this.§return set implements§.destroy();
         for each(_loc1_ in this.§include for import§)
         {
            _loc1_.destroy();
         }
         dialogService.removeDialog(this);
         display.stage.focus = null;
      }
   }
}

