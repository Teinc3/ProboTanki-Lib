package alternativa.tanks.service.settings.keybinding
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.events.EventDispatcher;
   import flash.net.SharedObject;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.Renamed3761;
   
   public class Renamed575 extends EventDispatcher implements KeysBindingService
   {
      public static const Renamed3762:int = 3;
      
      public static const Renamed3763:uint = 0;
      
      private var storageService:IStorageService;
      
      private var Renamed3764:Dictionary;
      
      private var Renamed3765:Dictionary;
      
      private var Renamed3766:uint;
      
      private var Renamed3767:Dictionary;
      
      private var Renamed3768:Renamed3769;
      
      public function Renamed575()
      {
         this.Renamed3764 = new Dictionary();
         this.Renamed3765 = new Dictionary();
         this.Renamed3767 = new Dictionary();
         super();
         var _loc1_:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         this.storageService = IStorageService(OSGi.getInstance().getService(IStorageService));
         this.Renamed3766 = _loc1_.language == Renamed3761.Renamed3770 ? uint(Keyboard.Y) : uint(Keyboard.Z);
         this.Renamed3771();
         this.Renamed3772();
      }
      
      private static function Renamed3773(param1:uint) : Boolean
      {
         return param1 == Renamed3763;
      }
      
      private static function Renamed3774() : Vector.<uint>
      {
         return new Vector.<uint>(Renamed3762,true);
      }
      
      private function Renamed3775() : Renamed3769
      {
         if(!this.Renamed3768)
         {
            this.Renamed3768 = new Renamed3769();
         }
         return this.Renamed3768;
      }
      
      public function Renamed3755(param1:uint) : Boolean
      {
         return this.Renamed3764[param1] == null;
      }
      
      public function Renamed3756(param1:Renamed717, param2:uint, param3:int) : Boolean
      {
         var _loc4_:Renamed717 = null;
         var _loc5_:Vector.<uint> = null;
         var _loc6_:int = 0;
         if(param3 >= Renamed3762)
         {
            return false;
         }
         if(!this.Renamed3755(param2))
         {
            _loc4_ = this.Renamed3764[param2];
            _loc5_ = this.Renamed3765[_loc4_];
            _loc6_ = int(_loc5_.indexOf(param2));
            delete this.Renamed3764[param2];
            _loc5_[_loc6_] = Renamed3763;
            this.Renamed3776(_loc4_,_loc5_);
            dispatchEvent(new Renamed3777(Renamed3777.Renamed3778 + _loc4_.name,_loc4_));
         }
         var _loc7_:uint = this.Renamed3757(param1,param3);
         if(!Renamed3773(_loc7_) && _loc7_ != param2)
         {
            delete this.Renamed3764[_loc7_];
         }
         this.Renamed3764[param2] = param1;
         this.Renamed3765[param1][param3] = param2;
         this.Renamed3776(param1,this.Renamed3765[param1]);
         return true;
      }
      
      private function Renamed3776(param1:Renamed717, param2:Vector.<uint> = null) : void
      {
         if(!param2)
         {
            param2 = Renamed3774();
         }
         var _loc3_:SharedObject = this.storageService.getStorage();
         _loc3_.data[param1.name] = param2;
         _loc3_.flush();
      }
      
      public function Renamed3757(param1:Renamed717, param2:uint) : uint
      {
         if(param2 >= Renamed3762)
         {
            return Renamed3763;
         }
         var _loc3_:Vector.<uint> = this.Renamed3765[param1];
         if(_loc3_)
         {
            return _loc3_[param2];
         }
         return Renamed3763;
      }
      
      public function Renamed3758(param1:Renamed717) : Vector.<uint>
      {
         return this.Renamed3765[param1];
      }
      
      public function Renamed729(param1:uint) : Renamed717
      {
         return this.Renamed3764[param1];
      }
      
      private function Renamed3771() : void
      {
         this.Renamed3767[Renamed717.ROTATE_TURRET_LEFT] = Vector.<uint>([this.Renamed3766,Keyboard.COMMA,Renamed3763]);
         this.Renamed3767[Renamed717.ROTATE_TURRET_RIGHT] = Vector.<uint>([Keyboard.X,Keyboard.PERIOD,Renamed3763]);
         this.Renamed3767[Renamed717.CENTER_TURRET] = Vector.<uint>([Keyboard.C,Keyboard.SLASH,Renamed3763]);
         this.Renamed3767[Renamed717.CHASSIS_LEFT_MOVEMENT] = Vector.<uint>([Keyboard.LEFT,Keyboard.A,Renamed3763]);
         this.Renamed3767[Renamed717.CHASSIS_RIGHT_MOVEMENT] = Vector.<uint>([Keyboard.RIGHT,Keyboard.D,Renamed3763]);
         this.Renamed3767[Renamed717.CHASSIS_FORWARD_MOVEMENT] = Vector.<uint>([Keyboard.UP,Keyboard.W,Renamed3763]);
         this.Renamed3767[Renamed717.CHASSIS_BACKWARD_MOVEMENT] = Vector.<uint>([Keyboard.DOWN,Keyboard.S,Renamed3763]);
         this.Renamed3767[Renamed717.FOLLOW_CAMERA_UP] = Vector.<uint>([Keyboard.PAGE_UP,Keyboard.LEFTBRACKET,Keyboard.Q]);
         this.Renamed3767[Renamed717.FOLLOW_CAMERA_DOWN] = Vector.<uint>([Keyboard.PAGE_DOWN,Keyboard.RIGHTBRACKET,Keyboard.E]);
         this.Renamed3767[Renamed717.DROP_FLAG] = Vector.<uint>([Keyboard.F,Renamed3763,Renamed3763]);
         this.Renamed3767[Renamed717.BATTLE_PAUSE] = Vector.<uint>([Keyboard.P,Renamed3763,Renamed3763]);
         this.Renamed3767[Renamed717.BATTLE_VIEW_INCREASE] = Vector.<uint>([Keyboard.NUMPAD_ADD,Keyboard.EQUAL,Renamed3763]);
         this.Renamed3767[Renamed717.BATTLE_VIEW_DECREASE] = Vector.<uint>([Keyboard.O,Renamed3763,Renamed3763]);
         this.Renamed3767[Renamed717.FULL_SCREEN] = Vector.<uint>([Keyboard.O,Keyboard.F11,Renamed3763]);
         this.Renamed3767[Renamed717.BATTLE_VIEW_INCREASE] = Vector.<uint>([Keyboard.NUMPAD_ADD,Renamed3763,Renamed3763]);
         this.Renamed3767[Renamed717.BATTLE_VIEW_DECREASE] = Vector.<uint>([Keyboard.NUMPAD_SUBTRACT,Renamed3763,Renamed3763]);
         this.Renamed3767[Renamed717.SUICIDE] = Vector.<uint>([Keyboard.DELETE,Renamed3763,Renamed3763]);
         this.Renamed3767[Renamed717.SHOW_TANK_PARAMETERS] = Vector.<uint>([Keyboard.V,Keyboard.R,Renamed3763]);
         this.Renamed3767[Renamed717.USE_FIRS_AID] = Vector.<uint>([Keyboard.NUMBER_1,Keyboard.NUMPAD_1,Renamed3763]);
         this.Renamed3767[Renamed717.USE_DOUBLE_ARMOR] = Vector.<uint>([Keyboard.NUMBER_2,Keyboard.NUMPAD_2,Renamed3763]);
         this.Renamed3767[Renamed717.USE_DOUBLE_DAMAGE] = Vector.<uint>([Keyboard.NUMBER_3,Keyboard.NUMPAD_3,Renamed3763]);
         this.Renamed3767[Renamed717.USE_NITRO] = Vector.<uint>([Keyboard.NUMBER_4,Keyboard.NUMPAD_4,Renamed3763]);
         this.Renamed3767[Renamed717.USE_MINE] = Vector.<uint>([Keyboard.NUMBER_5,Keyboard.NUMPAD_5,Renamed3763]);
         this.Renamed3767[Renamed717.DROP_GOLD_BOX] = Vector.<uint>([Keyboard.NUMBER_6,Keyboard.NUMPAD_6,Renamed3763]);
         this.Renamed3767[Renamed717.SHOT] = Vector.<uint>([Keyboard.SPACE,Renamed3763,Renamed3763]);
         this.Renamed3767[Renamed717.ULTIMATE] = Vector.<uint>([Keyboard.SHIFT,Renamed3763,Renamed3763]);
         this.Renamed3767[Renamed717.OPEN_GARAGE] = Vector.<uint>([Keyboard.G,Renamed3763,Renamed3763]);
      }
      
      private function Renamed3779(param1:Renamed717, param2:Vector.<uint>) : void
      {
         if(!param2)
         {
            param2 = this.Renamed3767[param1];
            if(!param2)
            {
               param2 = Renamed3774();
            }
         }
         this.Renamed3765[param1] = param2;
         var _loc3_:int = 0;
         while(_loc3_ < Renamed3762)
         {
            this.Renamed3756(param1,param2[_loc3_],_loc3_);
            _loc3_++;
         }
      }
      
      public function Renamed3759() : void
      {
         var _loc1_:Renamed717 = null;
         this.Renamed3765 = new Dictionary();
         this.Renamed3764 = new Dictionary();
         for each(_loc1_ in Renamed717.values)
         {
            this.Renamed3779(_loc1_,this.Renamed3767[_loc1_].concat());
         }
      }
      
      private function Renamed3772() : void
      {
         var _loc1_:Renamed717 = null;
         var _loc2_:SharedObject = this.storageService.getStorage();
         for each(_loc1_ in Renamed717.values)
         {
            this.Renamed3779(_loc1_,_loc2_.data[_loc1_.name]);
         }
      }
      
      public function Renamed3760(param1:uint) : String
      {
         return this.Renamed3775().Renamed3780(param1);
      }
   }
}

