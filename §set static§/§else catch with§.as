package §set static§
{
   import §"f§.§+#O§;
   import §"f§.§with for import§;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.§[!;§;
   import controls.Label;
   import controls.TankWindowInner;
   import controls.checkbox.§while var import§;
   import controls.containers.§if package get§;
   import controls.containers.§throw catch final§;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   
   public class §else catch with§ extends §with for import§
   {
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      private var §else catch const§:§while var import§;
      
      private var §try const each§:§while var import§;
      
      private var §3!g§:§+#O§;
      
      public function §else catch with§(param1:Boolean)
      {
         var _loc5_:§if package get§ = null;
         super();
         var _loc2_:§throw catch final§ = new §throw catch final§();
         _loc2_.x = MARGIN;
         _loc2_.y = MARGIN;
         _loc2_.§!!t§(MARGIN);
         _loc2_.addItem(createCheckBox(§[!;§.SHOW_DAMAGE,localeService.getText(TanksLocale.TEXT_SHOW_DAMAGE),settingsService.showDamage));
         _loc2_.addItem(createCheckBox(§[!;§.§true set var§,localeService.getText(TanksLocale.TEXT_SETTINGS_ALTERNATE_CAMERA_LABEL_TEXT),settingsService.alternateCamera));
         var _loc3_:§throw catch final§ = new §throw catch final§();
         _loc3_.§!!t§(MARGIN);
         _loc3_.y = MARGIN;
         _loc3_.x = SettingsWindow.§each package null§ * 0.5;
         this.§else catch const§ = this.§^#,§(localeService.getText(TanksLocale.TEXT_SETTINGS_MESSAGE_ONLY_FROM_FRIENDS),param1);
         this.§else catch const§.addEventListener(MouseEvent.CLICK,this.§with§);
         _loc3_.addItem(createCheckBox(§[!;§.§case for with§,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_CHAT_CHECKBOX_LABEL_TEXT),settingsService.showChat));
         this.§try const each§ = this.§^#,§(localeService.getText(TanksLocale.TEXT_SHOW_NOTIFICATIONS_LABEL),battleInviteService.receiveBattleInvite);
         this.§try const each§.addEventListener(MouseEvent.CLICK,this.§;#8§);
         _loc3_.addItem(this.§try const each§);
         var _loc4_:TankWindowInner = new TankWindowInner(SettingsWindow.§each package null§,_loc2_.height + 2 * MARGIN,TankWindowInner.TRANSPARENT);
         _loc4_.addChild(_loc2_);
         _loc4_.addChild(_loc3_);
         addChild(_loc4_);
         (_loc5_ = this.createSoundPanel()).y = _loc4_.y + _loc4_.height + §<#$§;
         addChild(_loc5_);
      }
      
      private function createSoundPanel() : §if package get§
      {
         var _loc1_:§throw catch final§ = new §throw catch final§();
         _loc1_.§!!t§(§,$%§);
         var _loc2_:Label = new Label();
         _loc2_.text = localeService.getText(TanksLocale.TEXT_SETTINGS_SOUND_VOLUME_LABEL_TEXT);
         _loc1_.addItem(_loc2_);
         this.§3!g§ = new §+#O§();
         _loc1_.addItem(this.§3!g§);
         return _loc1_;
      }
      
      private function §;#8§(param1:MouseEvent) : void
      {
         battleInviteService.receiveBattleInvite = this.§try const each§.§ !w§;
      }
      
      private function §with§(param1:MouseEvent) : void
      {
         dispatchEvent(new ReceivePersonalMessagesSettingEvent(ReceivePersonalMessagesSettingEvent.§if set get§,this.§else catch const§.§ !w§));
      }
      
      protected function §^#,§(param1:String, param2:Boolean, param3:int = 0, param4:int = 0) : §while var import§
      {
         var _loc5_:§while var import§;
         (_loc5_ = new §while var import§()).§ !w§ = param2;
         _loc5_.x = param3;
         _loc5_.y = param4;
         _loc5_.label = param1;
         return _loc5_;
      }
      
      override public function destroy() : void
      {
         this.§try const each§.removeEventListener(MouseEvent.CLICK,this.§;#8§);
         this.§else catch const§.removeEventListener(MouseEvent.CLICK,this.§with§);
         this.§3!g§.destroy();
         super.destroy();
      }
   }
}

