package Renamed479
{
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed895;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.utils.MathUtils;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class Renamed2753 extends Renamed2756 implements Renamed511
   {
      [Inject]
      public static var commandService:CommandService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed4732:KeysBindingService;
      
      private static const Renamed9421:int = 1 << Renamed9422;
      
      private var listener:Renamed2774;
      
      private var Renamed9423:int;
      
      private var Renamed9424:Boolean = true;
      
      public function Renamed2753(param1:Tank, param2:Renamed2774)
      {
         super(param1);
         this.listener = param2;
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.addEventListener(Event.DEACTIVATE,this.Renamed3405);
         battleEventDispatcher.Renamed539(Renamed895,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Renamed895 = null;
         if(param1 is Renamed895)
         {
            _loc2_ = Renamed895(param1);
            if(!this.Renamed9424 && _loc2_.enabled && !_loc2_.Renamed896)
            {
               Renamed2848(0);
            }
            this.Renamed9424 = _loc2_.enabled;
         }
      }
      
      private function onKey(param1:KeyboardEvent) : void
      {
         var _loc2_:* = 0;
         var _loc3_:Renamed717 = Renamed4732.Renamed729(param1.keyCode);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:int = Renamed9425;
         var _loc5_:* = param1.type == KeyboardEvent.KEY_DOWN;
         switch(_loc3_)
         {
            case Renamed717.CHASSIS_FORWARD_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(Renamed9425,Renamed7863,_loc5_);
               break;
            case Renamed717.CHASSIS_BACKWARD_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(Renamed9425,Renamed7864,_loc5_);
               break;
            case Renamed717.CHASSIS_LEFT_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(Renamed9425,Renamed7865,_loc5_);
               break;
            case Renamed717.CHASSIS_RIGHT_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(Renamed9425,Renamed7866,_loc5_);
         }
         if(_loc4_ != Renamed9425)
         {
            _loc2_ = _loc4_ | this.Renamed9423;
            Renamed2848(_loc2_);
         }
      }
      
      private function Renamed3405(param1:Event) : void
      {
         Renamed2848(0);
      }
      
      override protected function Renamed9426(param1:int) : void
      {
         this.listener.Renamed2927(param1);
      }
      
      public function Renamed2836(param1:Boolean) : void
      {
         if(param1)
         {
            this.Renamed9423 = Renamed9421;
         }
         else
         {
            this.Renamed9423 = 0;
            Renamed9425 &= ~Renamed9421;
         }
      }
      
      [Obfuscation(rename="false")]
      override public function close() : void
      {
         super.close();
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.removeEventListener(Event.DEACTIVATE,this.Renamed3405);
         battleEventDispatcher.Renamed866(Renamed895,this);
      }
   }
}

