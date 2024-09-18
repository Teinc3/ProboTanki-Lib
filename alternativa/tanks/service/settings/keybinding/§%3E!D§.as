package alternativa.tanks.service.settings.keybinding
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.events.EventDispatcher;
   import flash.net.SharedObject;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.§?O§;
   
   public class §>!D§ extends EventDispatcher implements KeysBindingService
   {
      public static const §]#<§:int = 3;
      
      public static const §throw set continue§:uint = 0;
      
      private var storageService:IStorageService;
      
      private var §in set case§:Dictionary;
      
      private var §0P§:Dictionary;
      
      private var §final catch break§:uint;
      
      private var §?F§:Dictionary;
      
      private var §<"1§:§const const catch§;
      
      public function §>!D§()
      {
         this.§in set case§ = new Dictionary();
         this.§0P§ = new Dictionary();
         this.§?F§ = new Dictionary();
         super();
         var _loc1_:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         this.storageService = IStorageService(OSGi.getInstance().getService(IStorageService));
         this.§final catch break§ = _loc1_.language == §?O§.§finally const dynamic§ ? uint(Keyboard.Y) : uint(Keyboard.Z);
         this.§8#H§();
         this.§%e§();
      }
      
      private static function §^K§(param1:uint) : Boolean
      {
         return param1 == §throw set continue§;
      }
      
      private static function §5F§() : Vector.<uint>
      {
         return new Vector.<uint>(§]#<§,true);
      }
      
      private function §^!H§() : §const const catch§
      {
         if(!this.§<"1§)
         {
            this.§<"1§ = new §const const catch§();
         }
         return this.§<"1§;
      }
      
      public function §get set if§(param1:uint) : Boolean
      {
         return this.§in set case§[param1] == null;
      }
      
      public function §class package package§(param1:§&7§, param2:uint, param3:int) : Boolean
      {
         var _loc4_:§&7§ = null;
         var _loc5_:Vector.<uint> = null;
         var _loc6_:int = 0;
         if(param3 >= §]#<§)
         {
            return false;
         }
         if(!this.§get set if§(param2))
         {
            _loc4_ = this.§in set case§[param2];
            _loc5_ = this.§0P§[_loc4_];
            _loc6_ = int(_loc5_.indexOf(param2));
            delete this.§in set case§[param2];
            _loc5_[_loc6_] = §throw set continue§;
            this.§@T§(_loc4_,_loc5_);
            dispatchEvent(new §for set static§(§for set static§.§try catch§ + _loc4_.name,_loc4_));
         }
         var _loc7_:uint = this.§;"R§(param1,param3);
         if(!§^K§(_loc7_) && _loc7_ != param2)
         {
            delete this.§in set case§[_loc7_];
         }
         this.§in set case§[param2] = param1;
         this.§0P§[param1][param3] = param2;
         this.§@T§(param1,this.§0P§[param1]);
         return true;
      }
      
      private function §@T§(param1:§&7§, param2:Vector.<uint> = null) : void
      {
         if(!param2)
         {
            param2 = §5F§();
         }
         var _loc3_:SharedObject = this.storageService.getStorage();
         _loc3_.data[param1.name] = param2;
         _loc3_.flush();
      }
      
      public function §;"R§(param1:§&7§, param2:uint) : uint
      {
         if(param2 >= §]#<§)
         {
            return §throw set continue§;
         }
         var _loc3_:Vector.<uint> = this.§0P§[param1];
         if(_loc3_)
         {
            return _loc3_[param2];
         }
         return §throw set continue§;
      }
      
      public function §package for catch§(param1:§&7§) : Vector.<uint>
      {
         return this.§0P§[param1];
      }
      
      public function §&!<§(param1:uint) : §&7§
      {
         return this.§in set case§[param1];
      }
      
      private function §8#H§() : void
      {
         this.§?F§[§&7§.ROTATE_TURRET_LEFT] = Vector.<uint>([this.§final catch break§,Keyboard.COMMA,§throw set continue§]);
         this.§?F§[§&7§.ROTATE_TURRET_RIGHT] = Vector.<uint>([Keyboard.X,Keyboard.PERIOD,§throw set continue§]);
         this.§?F§[§&7§.CENTER_TURRET] = Vector.<uint>([Keyboard.C,Keyboard.SLASH,§throw set continue§]);
         this.§?F§[§&7§.CHASSIS_LEFT_MOVEMENT] = Vector.<uint>([Keyboard.LEFT,Keyboard.A,§throw set continue§]);
         this.§?F§[§&7§.CHASSIS_RIGHT_MOVEMENT] = Vector.<uint>([Keyboard.RIGHT,Keyboard.D,§throw set continue§]);
         this.§?F§[§&7§.CHASSIS_FORWARD_MOVEMENT] = Vector.<uint>([Keyboard.UP,Keyboard.W,§throw set continue§]);
         this.§?F§[§&7§.CHASSIS_BACKWARD_MOVEMENT] = Vector.<uint>([Keyboard.DOWN,Keyboard.S,§throw set continue§]);
         this.§?F§[§&7§.FOLLOW_CAMERA_UP] = Vector.<uint>([Keyboard.PAGE_UP,Keyboard.LEFTBRACKET,Keyboard.Q]);
         this.§?F§[§&7§.FOLLOW_CAMERA_DOWN] = Vector.<uint>([Keyboard.PAGE_DOWN,Keyboard.RIGHTBRACKET,Keyboard.E]);
         this.§?F§[§&7§.DROP_FLAG] = Vector.<uint>([Keyboard.F,§throw set continue§,§throw set continue§]);
         this.§?F§[§&7§.BATTLE_PAUSE] = Vector.<uint>([Keyboard.P,§throw set continue§,§throw set continue§]);
         this.§?F§[§&7§.BATTLE_VIEW_INCREASE] = Vector.<uint>([Keyboard.NUMPAD_ADD,Keyboard.EQUAL,§throw set continue§]);
         this.§?F§[§&7§.BATTLE_VIEW_DECREASE] = Vector.<uint>([Keyboard.O,§throw set continue§,§throw set continue§]);
         this.§?F§[§&7§.FULL_SCREEN] = Vector.<uint>([Keyboard.O,Keyboard.F11,§throw set continue§]);
         this.§?F§[§&7§.BATTLE_VIEW_INCREASE] = Vector.<uint>([Keyboard.NUMPAD_ADD,§throw set continue§,§throw set continue§]);
         this.§?F§[§&7§.BATTLE_VIEW_DECREASE] = Vector.<uint>([Keyboard.NUMPAD_SUBTRACT,§throw set continue§,§throw set continue§]);
         this.§?F§[§&7§.SUICIDE] = Vector.<uint>([Keyboard.DELETE,§throw set continue§,§throw set continue§]);
         this.§?F§[§&7§.SHOW_TANK_PARAMETERS] = Vector.<uint>([Keyboard.V,Keyboard.R,§throw set continue§]);
         this.§?F§[§&7§.USE_FIRS_AID] = Vector.<uint>([Keyboard.NUMBER_1,Keyboard.NUMPAD_1,§throw set continue§]);
         this.§?F§[§&7§.USE_DOUBLE_ARMOR] = Vector.<uint>([Keyboard.NUMBER_2,Keyboard.NUMPAD_2,§throw set continue§]);
         this.§?F§[§&7§.USE_DOUBLE_DAMAGE] = Vector.<uint>([Keyboard.NUMBER_3,Keyboard.NUMPAD_3,§throw set continue§]);
         this.§?F§[§&7§.USE_NITRO] = Vector.<uint>([Keyboard.NUMBER_4,Keyboard.NUMPAD_4,§throw set continue§]);
         this.§?F§[§&7§.USE_MINE] = Vector.<uint>([Keyboard.NUMBER_5,Keyboard.NUMPAD_5,§throw set continue§]);
         this.§?F§[§&7§.DROP_GOLD_BOX] = Vector.<uint>([Keyboard.NUMBER_6,Keyboard.NUMPAD_6,§throw set continue§]);
         this.§?F§[§&7§.SHOT] = Vector.<uint>([Keyboard.SPACE,§throw set continue§,§throw set continue§]);
         this.§?F§[§&7§.ULTIMATE] = Vector.<uint>([Keyboard.SHIFT,§throw set continue§,§throw set continue§]);
         this.§?F§[§&7§.OPEN_GARAGE] = Vector.<uint>([Keyboard.G,§throw set continue§,§throw set continue§]);
      }
      
      private function §0!b§(param1:§&7§, param2:Vector.<uint>) : void
      {
         if(!param2)
         {
            param2 = this.§?F§[param1];
            if(!param2)
            {
               param2 = §5F§();
            }
         }
         this.§0P§[param1] = param2;
         var _loc3_:int = 0;
         while(_loc3_ < §]#<§)
         {
            this.§class package package§(param1,param2[_loc3_],_loc3_);
            _loc3_++;
         }
      }
      
      public function §finally package false§() : void
      {
         var _loc1_:§&7§ = null;
         this.§0P§ = new Dictionary();
         this.§in set case§ = new Dictionary();
         for each(_loc1_ in §&7§.values)
         {
            this.§0!b§(_loc1_,this.§?F§[_loc1_].concat());
         }
      }
      
      private function §%e§() : void
      {
         var _loc1_:§&7§ = null;
         var _loc2_:SharedObject = this.storageService.getStorage();
         for each(_loc1_ in §&7§.values)
         {
            this.§0!b§(_loc1_,_loc2_.data[_loc1_.name]);
         }
      }
      
      public function §get for override§(param1:uint) : String
      {
         return this.§^!H§().§var catch break§(param1);
      }
   }
}

