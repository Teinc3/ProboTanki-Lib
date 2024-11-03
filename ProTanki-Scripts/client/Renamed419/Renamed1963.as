package Renamed419
{
   import Renamed1959.Renamed4797;
   import Renamed1959.Renamed1961;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.Renamed2069;
   import controls.Label;
   import controls.TankWindowInner;
   import controls.checkbox.Renamed3902;
   import controls.containers.Renamed4027;
   import controls.containers.Renamed2259;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   
   public class Renamed1963 extends Renamed1961
   {
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      private var Renamed8710:Renamed3902;
      
      private var Renamed8711:Renamed3902;
      
      private var Renamed8712:Renamed4797;
      
      public function Renamed1963(param1:Boolean)
      {
         var _loc5_:Renamed4027 = null;
         super();
         var _loc2_:Renamed2259 = new Renamed2259();
         _loc2_.x = MARGIN;
         _loc2_.y = MARGIN;
         _loc2_.Renamed1987(MARGIN);
         _loc2_.addItem(createCheckBox(Renamed2069.SHOW_DAMAGE,localeService.getText(TanksLocale.TEXT_SHOW_DAMAGE),settingsService.showDamage));
         _loc2_.addItem(createCheckBox(Renamed2069.Renamed3736,localeService.getText(TanksLocale.TEXT_SETTINGS_ALTERNATE_CAMERA_LABEL_TEXT),settingsService.alternateCamera));
         var _loc3_:Renamed2259 = new Renamed2259();
         _loc3_.Renamed1987(MARGIN);
         _loc3_.y = MARGIN;
         _loc3_.x = SettingsWindow.Renamed1967 * 0.5;
         this.Renamed8710 = this.Renamed8713(localeService.getText(TanksLocale.TEXT_SETTINGS_MESSAGE_ONLY_FROM_FRIENDS),param1);
         this.Renamed8710.addEventListener(MouseEvent.CLICK,this.Renamed8714);
         _loc3_.addItem(createCheckBox(Renamed2069.Renamed2071,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_CHAT_CHECKBOX_LABEL_TEXT),settingsService.showChat));
         this.Renamed8711 = this.Renamed8713(localeService.getText(TanksLocale.TEXT_SHOW_NOTIFICATIONS_LABEL),battleInviteService.receiveBattleInvite);
         this.Renamed8711.addEventListener(MouseEvent.CLICK,this.Renamed8715);
         _loc3_.addItem(this.Renamed8711);
         var _loc4_:TankWindowInner = new TankWindowInner(SettingsWindow.Renamed1967,_loc2_.height + 2 * MARGIN,TankWindowInner.TRANSPARENT);
         _loc4_.addChild(_loc2_);
         _loc4_.addChild(_loc3_);
         addChild(_loc4_);
         (_loc5_ = this.createSoundPanel()).y = _loc4_.y + _loc4_.height + Renamed5303;
         addChild(_loc5_);
      }
      
      private function createSoundPanel() : Renamed4027
      {
         var _loc1_:Renamed2259 = new Renamed2259();
         _loc1_.Renamed1987(Renamed5304);
         var _loc2_:Label = new Label();
         _loc2_.text = localeService.getText(TanksLocale.TEXT_SETTINGS_SOUND_VOLUME_LABEL_TEXT);
         _loc1_.addItem(_loc2_);
         this.Renamed8712 = new Renamed4797();
         _loc1_.addItem(this.Renamed8712);
         return _loc1_;
      }
      
      private function Renamed8715(param1:MouseEvent) : void
      {
         battleInviteService.receiveBattleInvite = this.Renamed8711.Renamed1878;
      }
      
      private function Renamed8714(param1:MouseEvent) : void
      {
         dispatchEvent(new ReceivePersonalMessagesSettingEvent(ReceivePersonalMessagesSettingEvent.Renamed2193,this.Renamed8710.Renamed1878));
      }
      
      protected function Renamed8713(param1:String, param2:Boolean, param3:int = 0, param4:int = 0) : Renamed3902
      {
         var _loc5_:Renamed3902;
         (_loc5_ = new Renamed3902()).Renamed1878 = param2;
         _loc5_.x = param3;
         _loc5_.y = param4;
         _loc5_.label = param1;
         return _loc5_;
      }
      
      override public function destroy() : void
      {
         this.Renamed8711.removeEventListener(MouseEvent.CLICK,this.Renamed8715);
         this.Renamed8710.removeEventListener(MouseEvent.CLICK,this.Renamed8714);
         this.Renamed8712.destroy();
         super.destroy();
      }
   }
}

