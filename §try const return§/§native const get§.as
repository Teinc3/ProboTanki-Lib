package §try const return§
{
   import §"f§.§with for import§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import base.DiscreteSprite;
   import controls.base.DefaultButtonBase;
   import controls.containers.§if package get§;
   import controls.containers.§throw catch final§;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §native const get§ extends DiscreteSprite
   {
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var §^!C§:§throw catch final§;
      
      private var §>!l§:Vector.<§override set null§>;
      
      private var §null var try§:DefaultButtonBase;
      
      public function §native const get§()
      {
         this.§^!C§ = new §throw catch final§();
         this.§>!l§ = new Vector.<§override set null§>();
         this.§null var try§ = new DefaultButtonBase();
         super();
         this.§null var try§.label = localeService.getText(TanksLocale.TEXT_BUTTON_LABEL_RESTORE_DEFAULT_BUTTONS);
         this.§null var try§.width = 250;
         this.§null var try§.addEventListener(MouseEvent.CLICK,this.§finally package false§);
         addChild(this.§null var try§);
         this.§^!C§.§!!t§(§with for import§.MARGIN * 2);
         this.§^!C§.addItem(this.§class for function§());
         this.§^!C§.addItem(this.§%b§());
         this.§^!C§.addItem(this.§#!c§());
         this.§^!C§.addItem(this.§class set extends§());
         this.§^!C§.addItem(this.§,"6§());
         this.§^!C§.addItem(this.§true§());
         this.§^!C§.y = §with for import§.MARGIN + this.§null var try§.height;
         addChild(this.§^!C§);
      }
      
      private function §finally package false§(param1:MouseEvent) : void
      {
         var _loc2_:§override set null§ = null;
         §5!$§.§finally package false§();
         for each(_loc2_ in this.§>!l§)
         {
            _loc2_.§^b§();
         }
      }
      
      private function §class for function§() : §if package get§
      {
         var _loc1_:§if package get§ = new §throw catch final§();
         _loc1_.addItem(this.§else for in§(§&7§.ROTATE_TURRET_LEFT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TURRET_TURN_LEFT)));
         _loc1_.addItem(this.§else for in§(§&7§.ROTATE_TURRET_RIGHT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TURRET_TURN_RIGHT)));
         _loc1_.addItem(this.§else for in§(§&7§.CENTER_TURRET,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TURRET_CENTER)));
         _loc1_.addItem(this.§else for in§(§&7§.SHOT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_SHOOT)));
         return _loc1_;
      }
      
      private function §%b§() : §if package get§
      {
         var _loc1_:§if package get§ = new §throw catch final§();
         _loc1_.addItem(this.§else for in§(§&7§.CHASSIS_LEFT_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_TURN_LEFT)));
         _loc1_.addItem(this.§else for in§(§&7§.CHASSIS_FORWARD_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_MOVE_FORWARD)));
         _loc1_.addItem(this.§else for in§(§&7§.CHASSIS_RIGHT_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_TURN_RIGHT)));
         _loc1_.addItem(this.§else for in§(§&7§.CHASSIS_BACKWARD_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_MOVE_BACKWARD)));
         return _loc1_;
      }
      
      private function §#!c§() : §if package get§
      {
         var _loc1_:§if package get§ = new §throw catch final§();
         _loc1_.addItem(this.§else for in§(§&7§.USE_FIRS_AID,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_FIRST_AID)));
         _loc1_.addItem(this.§else for in§(§&7§.USE_DOUBLE_ARMOR,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_DOUBLE_ARMOR)));
         _loc1_.addItem(this.§else for in§(§&7§.USE_DOUBLE_DAMAGE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_DOBLE_DAMAGE)));
         _loc1_.addItem(this.§else for in§(§&7§.USE_NITRO,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_NITRO)));
         _loc1_.addItem(this.§else for in§(§&7§.USE_MINE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_MINE)));
         return _loc1_;
      }
      
      private function §,"6§() : §if package get§
      {
         var _loc1_:§if package get§ = new §throw catch final§();
         _loc1_.addItem(this.§else for in§(§&7§.BATTLE_VIEW_INCREASE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_SCREEN_SIZE_INCREASE)));
         _loc1_.addItem(this.§else for in§(§&7§.BATTLE_VIEW_DECREASE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_SCREEN_SIZE_DECREASE)));
         _loc1_.addItem(this.§else for in§(§&7§.OPEN_GARAGE,localeService.getText(TanksLocale.TEXT_OPEN_GARAGE)));
         return _loc1_;
      }
      
      private function §class set extends§() : §if package get§
      {
         var _loc1_:§if package get§ = new §throw catch final§();
         _loc1_.addItem(this.§else for in§(§&7§.DROP_FLAG,localeService.getText(TanksLocale.TEXT_GAME_ACTION_DROP_FLAG)));
         _loc1_.addItem(this.§else for in§(§&7§.BATTLE_PAUSE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_PAUSE)));
         return _loc1_;
      }
      
      private function §true§() : §if package get§
      {
         var _loc1_:§if package get§ = new §throw catch final§();
         _loc1_.addItem(this.§else for in§(§&7§.FOLLOW_CAMERA_UP,localeService.getText(TanksLocale.TEXT_GAME_ACTION_CAMERA_UP)));
         _loc1_.addItem(this.§else for in§(§&7§.FOLLOW_CAMERA_DOWN,localeService.getText(TanksLocale.TEXT_GAME_ACTION_CAMERA_DOWN)));
         return _loc1_;
      }
      
      private function §else for in§(param1:§&7§, param2:String) : §override set null§
      {
         var _loc3_:§override set null§ = new §override set null§(param1,param2,§with for import§.MARGIN,SettingsWindow.§each package null§);
         this.§>!l§.push(_loc3_);
         return _loc3_;
      }
      
      public function destroy() : void
      {
         var _loc1_:§override set null§ = null;
         this.§null var try§.removeEventListener(MouseEvent.CLICK,this.§finally package false§);
         for each(_loc1_ in this.§>!l§)
         {
            _loc1_.destroy();
         }
         this.§^!C§ = null;
         this.§>!l§ = null;
      }
   }
}

