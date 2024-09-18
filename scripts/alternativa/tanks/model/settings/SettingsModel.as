package alternativa.tanks.model.settings
{
   import Renamed145.Renamed2175;
   import Renamed145.Renamed2176;
   import Renamed145.Renamed2177;
   import Renamed236.Renamed2178;
   import Renamed303.Renamed1962;
   import Renamed303.Renamed2179;
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
   import Renamed374.Renamed2180;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import services.alertservice.Alert;
   import services.alertservice.Renamed1616;
   import Renamed419.ReceivePersonalMessagesSettingEvent;
   
   public class SettingsModel extends Renamed2177 implements Renamed2175, ObjectLoadPostListener, ObjectUnloadListener, Renamed2178
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
      public static var Renamed2181:PasswordService;
      
      private var settingsWindow:SettingsWindow;
      
      private var emailConfirmed:Boolean;
      
      private var Renamed2182:Boolean;
      
      private var Renamed2183:Boolean;
      
      public function SettingsModel()
      {
         super();
      }
      
      public function openAntiAddictionSettings(param1:Renamed2180, param2:String, param3:String) : void
      {
         this.openSettingsWindow(param1,true,param2,param3);
      }
      
      public function openSettings(param1:Renamed2180) : void
      {
         this.openSettingsWindow(param1,false,"","");
      }
      
      private function openSettingsWindow(param1:Renamed2180, param2:Boolean, param3:String, param4:String) : void
      {
         this.emailConfirmed = settingsService.Renamed2184();
         if(this.settingsWindow != null)
         {
            return;
         }
         this.Renamed2183 = param1 == Renamed2180.FRIENDS_ONLY;
         this.settingsWindow = new SettingsWindow(settingsService.getEmail(),this.emailConfirmed,this.Renamed2183,param2,param3,param4);
         if(!this.emailConfirmed)
         {
            this.settingsWindow.addEventListener(Renamed2179.SET_EMAIL,this.Renamed2185);
            this.settingsWindow.addEventListener(Renamed2179.CHANGE_PASSWORD,this.Renamed2186);
         }
         this.settingsWindow.addEventListener(SettingsWindowEvent.Renamed1977,this.Renamed2187);
         this.settingsWindow.addEventListener(Renamed2179.Renamed2188,this.Renamed2189);
         this.settingsWindow.addEventListener(Renamed2179.Renamed2190,this.Renamed2191);
         this.settingsWindow.addEventListener(Renamed2179.Renamed2192,this.each);
         this.settingsWindow.addEventListener(ReceivePersonalMessagesSettingEvent.Renamed2193,this.Renamed2194);
         panelView.unlock();
         if(!settingsService.Renamed2195)
         {
            Renamed2181.Renamed2196(this.Renamed2197);
         }
         else
         {
            this.settingsWindow.show();
         }
         IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).bindFacade(this);
         var _loc5_:Renamed1962 = this.settingsWindow.Renamed1978();
         if(_loc5_)
         {
            _loc5_.addEventListener(RefreshCaptchaClickedEvent.CLICKED,this.onRefreshCaptcha);
            this.getNewCaptcha();
         }
      }
      
      private function Renamed2191(param1:Renamed2179) : void
      {
         Renamed2181.Renamed2198(this.settingsWindow.Renamed1978().Renamed2199(),this.Renamed2186);
      }
      
      private function each(param1:Renamed2179) : void
      {
         var _loc2_:Renamed1962 = this.settingsWindow.Renamed1978();
         if(_loc2_.initialRealName != _loc2_.realName || _loc2_.idNumber != _loc2_.initialIDNumber)
         {
            IAntiAddictionAlert(object.adapt(IAntiAddictionAlert)).setIdNumberAndRealName(_loc2_.realName,_loc2_.idNumber);
         }
      }
      
      private function Renamed2200() : void
      {
         IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).unbindFacade();
         if(!this.emailConfirmed)
         {
            this.settingsWindow.removeEventListener(Renamed2179.SET_EMAIL,this.Renamed2185);
            this.settingsWindow.removeEventListener(Renamed2179.CHANGE_PASSWORD,this.Renamed2186);
         }
         this.settingsWindow.removeEventListener(SettingsWindowEvent.Renamed1977,this.Renamed2187);
         this.settingsWindow.removeEventListener(Renamed2179.Renamed2188,this.Renamed2189);
         this.settingsWindow.removeEventListener(Renamed2179.Renamed2190,this.Renamed2191);
         this.settingsWindow.removeEventListener(ReceivePersonalMessagesSettingEvent.Renamed2193,this.Renamed2194);
         this.settingsWindow.removeEventListener(Renamed2179.Renamed2192,this.each);
         panelView.Renamed2160().buttonBar.settingsButton.enable = true;
         this.Renamed2201();
         this.settingsWindow.destroy();
         this.settingsWindow = null;
      }
      
      private function Renamed2189(param1:Renamed2179) : void
      {
         var _loc2_:Renamed1962 = null;
         if(this.emailConfirmed)
         {
            _loc2_ = this.settingsWindow.Renamed1978();
            IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).checkCaptcha(_loc2_.Renamed1576(),CaptchaLocation.ACCOUNT_SETTINGS_FORM);
         }
      }
      
      public function Renamed2187(param1:Event = null) : void
      {
         if(this.settingsWindow != null)
         {
            this.Renamed2200();
         }
      }
      
      private function Renamed2185(param1:Event = null) : void
      {
         var _loc2_:Renamed1962 = null;
         if(!this.emailConfirmed)
         {
            _loc2_ = this.settingsWindow.Renamed1978();
            if(_loc2_.email)
            {
               IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).checkCaptcha(_loc2_.Renamed1576(),CaptchaLocation.ACCOUNT_SETTINGS_FORM);
            }
         }
      }
      
      private function Renamed2186(param1:Boolean) : void
      {
         var _loc2_:Renamed1962 = null;
         if(param1)
         {
            _loc2_ = this.settingsWindow.Renamed1978();
            if(!this.emailConfirmed && _loc2_.password != "")
            {
               this.Renamed2202();
            }
         }
         else
         {
            this.settingsWindow.Renamed1978().Renamed2203();
         }
      }
      
      private function Renamed2202() : void
      {
         var _loc1_:Renamed1962 = this.settingsWindow.Renamed1978();
         if(_loc1_.Renamed2199() == "")
         {
            Renamed2181.Renamed2204(_loc1_.password);
         }
         else
         {
            this.Renamed2182 = true;
            IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).checkCaptcha(_loc1_.Renamed1576(),CaptchaLocation.ACCOUNT_SETTINGS_FORM);
         }
      }
      
      private function Renamed2194(param1:ReceivePersonalMessagesSettingEvent) : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         panelView.Renamed2160().buttonBar.soundOn = !settingsService.muteSound;
         settingsService.Renamed2205();
         panelView.Renamed2160().buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
         this.Renamed2201();
      }
      
      private function Renamed2201() : void
      {
         var _loc1_:Renamed2176 = new Renamed2176();
         _loc1_.Renamed2206 = settingsService.showDamage;
         server.Renamed2207(_loc1_);
      }
      
      private function onButtonBarButtonClick(param1:MainButtonBarEvents) : void
      {
         switch(param1.typeButton)
         {
            case MainButtonBarEvents.SOUND:
               this.toggleSoundMute();
               break;
            case MainButtonBarEvents.SETTINGS:
               server.Renamed2208();
         }
      }
      
      public function objectUnloaded() : void
      {
         if(panelView.Renamed2160() != null)
         {
            panelView.Renamed2160().buttonBar.removeEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
         }
      }
      
      private function toggleSoundMute() : void
      {
         settingsService.muteSound = !settingsService.muteSound;
         panelView.unlock();
      }
      
      public function Renamed2197(param1:Boolean) : void
      {
         if(param1)
         {
            settingsService.Renamed2195 = true;
         }
         else
         {
            this.settingsWindow.Renamed1978().Renamed2209();
         }
         this.settingsWindow.show();
      }
      
      public function Renamed2210(param1:CaptchaLocation, param2:Vector.<int>) : void
      {
         CaptchaParser.parse(param2,this.Renamed2211,param1);
      }
      
      private function Renamed2211(param1:Bitmap, param2:CaptchaLocation) : void
      {
         var _loc3_:Renamed1962 = null;
         if(param2 == CaptchaLocation.ACCOUNT_SETTINGS_FORM)
         {
            _loc3_ = this.settingsWindow.Renamed1978();
            _loc3_.Renamed2212(param1);
         }
      }
      
      public function Renamed2213(param1:Vector.<CaptchaLocation>) : void
      {
      }
      
      public function Renamed2214(param1:CaptchaLocation) : void
      {
         this.getNewCaptcha();
         var _loc2_:Renamed1962 = this.settingsWindow.Renamed1978();
         if(this.emailConfirmed)
         {
            _loc2_.Renamed2215();
            alertService.showAlert(localeService.getText(TanksLocale.TEXT_SETTINGS_CHANGE_PASSWORD_CONFIRMATION_SENT_TEXT),Vector.<String>([Renamed1616.OK]));
            IUserEmailAndPassword(modelRegistry.getModelsByInterface(IUserEmailAndPassword)[0]).sendChangeInstruction();
         }
         else if(this.Renamed2182)
         {
            Renamed2181.Renamed2182(_loc2_.Renamed2199(),_loc2_.password);
            this.Renamed2182 = false;
         }
         else
         {
            IUserEmailAndPassword(modelRegistry.getModelsByInterface(IUserEmailAndPassword)[0]).changeEmail(_loc2_.email);
         }
      }
      
      public function Renamed2216(param1:CaptchaLocation, param2:Vector.<int>) : void
      {
         alertService.showAlertById(Alert.CAPTCHA_INCORRECT);
         this.Renamed2210(param1,param2);
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

