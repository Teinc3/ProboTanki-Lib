package alternativa.tanks.model.settings
{
   import §!#^§.§#"'§;
   import §!#^§.§8$ §;
   import §!#^§.§extends package for§;
   import §2!8§.§]"9§;
   import §@#3§.§"!y§;
   import §@#3§.§throw for use§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.gui.settings.SettingsWindowEvent;
   import alternativa.tanks.model.antiaddiction.IAntiAddictionAlert;
   import alternativa.tanks.model.useremailandpassword.IUserEmailAndPassword;
   import alternativa.tanks.model.useremailandpassword.PasswordService;
   import alternativa.tanks.servermodels.captcha.CaptchaParser;
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.view.events.RefreshCaptchaClickedEvent;
   import flash.display.Bitmap;
   import flash.events.Event;
   import forms.events.MainButtonBarEvents;
   import §function catch if§.§if package native§;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import services.alertservice.Alert;
   import services.alertservice.§get const use§;
   import §set static§.ReceivePersonalMessagesSettingEvent;
   
   public class SettingsModel extends §extends package for§ implements §#"'§, ObjectLoadPostListener, ObjectUnloadListener, §]"9§
   {
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var fullscreenService:FullscreenService;
      
      [Inject]
      public static var §true const native§:PasswordService;
      
      private var settingsWindow:SettingsWindow;
      
      private var emailConfirmed:Boolean;
      
      private var §false set get§:Boolean;
      
      private var §`"i§:Boolean;
      
      public function SettingsModel()
      {
         super();
      }
      
      public function openAntiAddictionSettings(param1:§if package native§, param2:String, param3:String) : void
      {
         this.openSettingsWindow(param1,true,param2,param3);
      }
      
      public function openSettings(param1:§if package native§) : void
      {
         this.openSettingsWindow(param1,false,"","");
      }
      
      private function openSettingsWindow(param1:§if package native§, param2:Boolean, param3:String, param4:String) : void
      {
         this.emailConfirmed = settingsService.§switch throw§();
         if(this.settingsWindow != null)
         {
            return;
         }
         this.§`"i§ = param1 == §if package native§.FRIENDS_ONLY;
         this.settingsWindow = new SettingsWindow(settingsService.getEmail(),this.emailConfirmed,this.§`"i§,param2,param3,param4);
         if(!this.emailConfirmed)
         {
            this.settingsWindow.addEventListener(§throw for use§.SET_EMAIL,this.§#"?§);
            this.settingsWindow.addEventListener(§throw for use§.CHANGE_PASSWORD,this.§super each§);
         }
         this.settingsWindow.addEventListener(SettingsWindowEvent.§[#5§,this.§#]§);
         this.settingsWindow.addEventListener(§throw for use§.§2"m§,this.§catch package null§);
         this.settingsWindow.addEventListener(§throw for use§.§7I§,this.§"N§);
         this.settingsWindow.addEventListener(§throw for use§.§finally static§,this.each);
         this.settingsWindow.addEventListener(ReceivePersonalMessagesSettingEvent.§if set get§,this.§`s§);
         panelView.unlock();
         if(!settingsService.§ Y§)
         {
            §true const native§.§package catch else§(this.§""=§);
         }
         else
         {
            this.settingsWindow.show();
         }
         IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).bindFacade(this);
         var _loc5_:§"!y§ = this.settingsWindow.§<9§();
         if(_loc5_)
         {
            _loc5_.addEventListener(RefreshCaptchaClickedEvent.CLICKED,this.onRefreshCaptcha);
            this.getNewCaptcha();
         }
      }
      
      private function §"N§(param1:§throw for use§) : void
      {
         §true const native§.§true const package§(this.settingsWindow.§<9§().§get null§(),this.§super each§);
      }
      
      private function each(param1:§throw for use§) : void
      {
         var _loc2_:§"!y§ = this.settingsWindow.§<9§();
         if(_loc2_.initialRealName != _loc2_.realName || _loc2_.idNumber != _loc2_.initialIDNumber)
         {
            IAntiAddictionAlert(object.adapt(IAntiAddictionAlert)).setIdNumberAndRealName(_loc2_.realName,_loc2_.idNumber);
         }
      }
      
      private function §break var extends§() : void
      {
         IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).unbindFacade();
         if(!this.emailConfirmed)
         {
            this.settingsWindow.removeEventListener(§throw for use§.SET_EMAIL,this.§#"?§);
            this.settingsWindow.removeEventListener(§throw for use§.CHANGE_PASSWORD,this.§super each§);
         }
         this.settingsWindow.removeEventListener(SettingsWindowEvent.§[#5§,this.§#]§);
         this.settingsWindow.removeEventListener(§throw for use§.§2"m§,this.§catch package null§);
         this.settingsWindow.removeEventListener(§throw for use§.§7I§,this.§"N§);
         this.settingsWindow.removeEventListener(ReceivePersonalMessagesSettingEvent.§if set get§,this.§`s§);
         this.settingsWindow.removeEventListener(§throw for use§.§finally static§,this.each);
         panelView.§+#,§().buttonBar.settingsButton.enable = true;
         this.§!!H§();
         this.settingsWindow.destroy();
         this.settingsWindow = null;
      }
      
      private function §catch package null§(param1:§throw for use§) : void
      {
         var _loc2_:§"!y§ = null;
         if(this.emailConfirmed)
         {
            _loc2_ = this.settingsWindow.§<9§();
            IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).checkCaptcha(_loc2_.§#"b§(),CaptchaLocation.ACCOUNT_SETTINGS_FORM);
         }
      }
      
      public function §#]§(param1:Event = null) : void
      {
         if(this.settingsWindow != null)
         {
            this.§break var extends§();
         }
      }
      
      private function §#"?§(param1:Event = null) : void
      {
         var _loc2_:§"!y§ = null;
         if(!this.emailConfirmed)
         {
            _loc2_ = this.settingsWindow.§<9§();
            if(_loc2_.email)
            {
               IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).checkCaptcha(_loc2_.§#"b§(),CaptchaLocation.ACCOUNT_SETTINGS_FORM);
            }
         }
      }
      
      private function §super each§(param1:Boolean) : void
      {
         var _loc2_:§"!y§ = null;
         if(param1)
         {
            _loc2_ = this.settingsWindow.§<9§();
            if(!this.emailConfirmed && _loc2_.password != "")
            {
               this.§for switch§();
            }
         }
         else
         {
            this.settingsWindow.§<9§().§5!v§();
         }
      }
      
      private function §for switch§() : void
      {
         var _loc1_:§"!y§ = this.settingsWindow.§<9§();
         if(_loc1_.§get null§() == "")
         {
            §true const native§.§-#f§(_loc1_.password);
         }
         else
         {
            this.§false set get§ = true;
            IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).checkCaptcha(_loc1_.§#"b§(),CaptchaLocation.ACCOUNT_SETTINGS_FORM);
         }
      }
      
      private function §`s§(param1:ReceivePersonalMessagesSettingEvent) : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         panelView.§+#,§().buttonBar.soundOn = !settingsService.muteSound;
         settingsService.§]l§();
         panelView.§+#,§().buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
         this.§!!H§();
      }
      
      private function §!!H§() : void
      {
         var _loc1_:§8$ § = new §8$ §();
         _loc1_.§dynamic const super§ = settingsService.showDamage;
         server.§#_§(_loc1_);
      }
      
      private function onButtonBarButtonClick(param1:MainButtonBarEvents) : void
      {
         switch(param1.typeButton)
         {
            case MainButtonBarEvents.SOUND:
               this.toggleSoundMute();
               break;
            case MainButtonBarEvents.SETTINGS:
               server.§@"O§();
         }
      }
      
      public function objectUnloaded() : void
      {
         if(panelView.§+#,§() != null)
         {
            panelView.§+#,§().buttonBar.removeEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
         }
      }
      
      private function toggleSoundMute() : void
      {
         settingsService.muteSound = !settingsService.muteSound;
         panelView.unlock();
      }
      
      public function §""=§(param1:Boolean) : void
      {
         if(param1)
         {
            settingsService.§ Y§ = true;
         }
         else
         {
            this.settingsWindow.§<9§().§include const if§();
         }
         this.settingsWindow.show();
      }
      
      public function §5#C§(param1:CaptchaLocation, param2:Vector.<int>) : void
      {
         CaptchaParser.parse(param2,this.§get set true§,param1);
      }
      
      private function §get set true§(param1:Bitmap, param2:CaptchaLocation) : void
      {
         var _loc3_:§"!y§ = null;
         if(param2 == CaptchaLocation.ACCOUNT_SETTINGS_FORM)
         {
            _loc3_ = this.settingsWindow.§<9§();
            _loc3_.§1P§(param1);
         }
      }
      
      public function §""Q§(param1:Vector.<CaptchaLocation>) : void
      {
      }
      
      public function §false var return§(param1:CaptchaLocation) : void
      {
         this.getNewCaptcha();
         var _loc2_:§"!y§ = this.settingsWindow.§<9§();
         if(this.emailConfirmed)
         {
            _loc2_.§do catch final§();
            alertService.showAlert(localeService.getText(TanksLocale.TEXT_SETTINGS_CHANGE_PASSWORD_CONFIRMATION_SENT_TEXT),Vector.<String>([§get const use§.OK]));
            IUserEmailAndPassword(modelRegistry.getModelsByInterface(IUserEmailAndPassword)[0]).sendChangeInstruction();
         }
         else if(this.§false set get§)
         {
            §true const native§.§false set get§(_loc2_.§get null§(),_loc2_.password);
            this.§false set get§ = false;
         }
         else
         {
            IUserEmailAndPassword(modelRegistry.getModelsByInterface(IUserEmailAndPassword)[0]).changeEmail(_loc2_.email);
         }
      }
      
      public function §!#!§(param1:CaptchaLocation, param2:Vector.<int>) : void
      {
         alertService.showAlertById(Alert.CAPTCHA_INCORRECT);
         this.§5#C§(param1,param2);
      }
      
      private function onRefreshCaptcha(param1:RefreshCaptchaClickedEvent) : void
      {
         this.getNewCaptcha();
      }
      
      private function getNewCaptcha() : void
      {
         IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).getNewCaptcha(CaptchaLocation.ACCOUNT_SETTINGS_FORM);
      }
   }
}

