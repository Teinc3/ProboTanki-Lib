package Renamed445
{
   import Renamed1959.Renamed1961;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import base.DiscreteSprite;
   import controls.base.DefaultButtonBase;
   import controls.containers.Renamed4027;
   import controls.containers.Renamed2259;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4824 extends DiscreteSprite
   {
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed8961:Renamed2259;
      
      private var Renamed8962:Vector.<Renamed4825>;
      
      private var Renamed8963:DefaultButtonBase;
      
      public function Renamed4824()
      {
         this.Renamed8961 = new Renamed2259();
         this.Renamed8962 = new Vector.<Renamed4825>();
         this.Renamed8963 = new DefaultButtonBase();
         super();
         this.Renamed8963.label = localeService.getText(TanksLocale.TEXT_BUTTON_LABEL_RESTORE_DEFAULT_BUTTONS);
         this.Renamed8963.width = 250;
         this.Renamed8963.addEventListener(MouseEvent.CLICK,this.Renamed3759);
         addChild(this.Renamed8963);
         this.Renamed8961.Renamed1987(Renamed1961.MARGIN * 2);
         this.Renamed8961.addItem(this.Renamed8964());
         this.Renamed8961.addItem(this.Renamed8965());
         this.Renamed8961.addItem(this.Renamed8966());
         this.Renamed8961.addItem(this.Renamed8967());
         this.Renamed8961.addItem(this.Renamed8968());
         this.Renamed8961.addItem(this.Renamed8969());
         this.Renamed8961.y = Renamed1961.MARGIN + this.Renamed8963.height;
         addChild(this.Renamed8961);
      }
      
      private function Renamed3759(param1:MouseEvent) : void
      {
         var _loc2_:Renamed4825 = null;
         Renamed719.Renamed3759();
         for each(_loc2_ in this.Renamed8962)
         {
            _loc2_.Renamed8970();
         }
      }
      
      private function Renamed8964() : Renamed4027
      {
         var _loc1_:Renamed4027 = new Renamed2259();
         _loc1_.addItem(this.Renamed8971(Renamed717.ROTATE_TURRET_LEFT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TURRET_TURN_LEFT)));
         _loc1_.addItem(this.Renamed8971(Renamed717.ROTATE_TURRET_RIGHT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TURRET_TURN_RIGHT)));
         _loc1_.addItem(this.Renamed8971(Renamed717.CENTER_TURRET,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TURRET_CENTER)));
         _loc1_.addItem(this.Renamed8971(Renamed717.SHOT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_SHOOT)));
         return _loc1_;
      }
      
      private function Renamed8965() : Renamed4027
      {
         var _loc1_:Renamed4027 = new Renamed2259();
         _loc1_.addItem(this.Renamed8971(Renamed717.CHASSIS_LEFT_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_TURN_LEFT)));
         _loc1_.addItem(this.Renamed8971(Renamed717.CHASSIS_FORWARD_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_MOVE_FORWARD)));
         _loc1_.addItem(this.Renamed8971(Renamed717.CHASSIS_RIGHT_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_TURN_RIGHT)));
         _loc1_.addItem(this.Renamed8971(Renamed717.CHASSIS_BACKWARD_MOVEMENT,localeService.getText(TanksLocale.TEXT_GAME_ACTION_TANK_MOVE_BACKWARD)));
         return _loc1_;
      }
      
      private function Renamed8966() : Renamed4027
      {
         var _loc1_:Renamed4027 = new Renamed2259();
         _loc1_.addItem(this.Renamed8971(Renamed717.USE_FIRS_AID,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_FIRST_AID)));
         _loc1_.addItem(this.Renamed8971(Renamed717.USE_DOUBLE_ARMOR,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_DOUBLE_ARMOR)));
         _loc1_.addItem(this.Renamed8971(Renamed717.USE_DOUBLE_DAMAGE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_DOBLE_DAMAGE)));
         _loc1_.addItem(this.Renamed8971(Renamed717.USE_NITRO,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_NITRO)));
         _loc1_.addItem(this.Renamed8971(Renamed717.USE_MINE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_USE_MINE)));
         return _loc1_;
      }
      
      private function Renamed8968() : Renamed4027
      {
         var _loc1_:Renamed4027 = new Renamed2259();
         _loc1_.addItem(this.Renamed8971(Renamed717.BATTLE_VIEW_INCREASE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_SCREEN_SIZE_INCREASE)));
         _loc1_.addItem(this.Renamed8971(Renamed717.BATTLE_VIEW_DECREASE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_SCREEN_SIZE_DECREASE)));
         _loc1_.addItem(this.Renamed8971(Renamed717.OPEN_GARAGE,localeService.getText(TanksLocale.TEXT_OPEN_GARAGE)));
         return _loc1_;
      }
      
      private function Renamed8967() : Renamed4027
      {
         var _loc1_:Renamed4027 = new Renamed2259();
         _loc1_.addItem(this.Renamed8971(Renamed717.DROP_FLAG,localeService.getText(TanksLocale.TEXT_GAME_ACTION_DROP_FLAG)));
         _loc1_.addItem(this.Renamed8971(Renamed717.BATTLE_PAUSE,localeService.getText(TanksLocale.TEXT_GAME_ACTION_PAUSE)));
         return _loc1_;
      }
      
      private function Renamed8969() : Renamed4027
      {
         var _loc1_:Renamed4027 = new Renamed2259();
         _loc1_.addItem(this.Renamed8971(Renamed717.FOLLOW_CAMERA_UP,localeService.getText(TanksLocale.TEXT_GAME_ACTION_CAMERA_UP)));
         _loc1_.addItem(this.Renamed8971(Renamed717.FOLLOW_CAMERA_DOWN,localeService.getText(TanksLocale.TEXT_GAME_ACTION_CAMERA_DOWN)));
         return _loc1_;
      }
      
      private function Renamed8971(param1:Renamed717, param2:String) : Renamed4825
      {
         var _loc3_:Renamed4825 = new Renamed4825(param1,param2,Renamed1961.MARGIN,SettingsWindow.Renamed1967);
         this.Renamed8962.push(_loc3_);
         return _loc3_;
      }
      
      public function destroy() : void
      {
         var _loc1_:Renamed4825 = null;
         this.Renamed8963.removeEventListener(MouseEvent.CLICK,this.Renamed3759);
         for each(_loc1_ in this.Renamed8962)
         {
            _loc1_.destroy();
         }
         this.Renamed8961 = null;
         this.Renamed8962 = null;
      }
   }
}

