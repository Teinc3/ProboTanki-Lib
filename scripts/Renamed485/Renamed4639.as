package Renamed485
{
   import Renamed142.Renamed2740;
   import Renamed142.Renamed2741;
   import Renamed5227.Renamed4707;
   import Renamed5227.Renamed5235;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed885;
   import alternativa.tanks.battle.events.Renamed889;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed907;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.utils.Renamed3883;
   import controls.InventoryIcon;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class Renamed4639 extends Renamed5235 implements Renamed4707, Renamed4642, Renamed2741, Renamed511
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed718:BattleInputService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed2423:BattleGUIService;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed9557:int = 50;
      
      private var container:DisplayObjectContainer;
      
      private var Renamed9558:Vector.<Renamed9559>;
      
      private var Renamed9560:Dictionary;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed9561:Renamed3883;
      
      private var Renamed5158:Renamed4640;
      
      private var Renamed9562:int;
      
      public function Renamed4639()
      {
         this.Renamed9560 = new Dictionary();
         super();
         this.Renamed9561 = new Renamed3883();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed885,this.Renamed9563);
         this.Renamed2432.Renamed904(Renamed907,this.Renamed9564);
         this.Renamed2432.Renamed904(Renamed894,this.Renamed2830);
         this.Renamed2432.Renamed904(Renamed889,this.Renamed5463);
      }
      
      public function Renamed5463(param1:Renamed889) : void
      {
         var _loc2_:Renamed9559 = null;
         var _loc3_:Renamed9565 = null;
         if(param1.isLocal)
         {
            for each(_loc2_ in this.Renamed9558)
            {
               _loc3_ = _loc2_.getItem();
               if(_loc3_ != null)
               {
                  _loc3_.Renamed9566();
               }
            }
         }
      }
      
      public function Renamed9564(param1:Object) : void
      {
         this.Renamed4954(Renamed2740.Renamed4956,true);
      }
      
      private function Renamed2830(param1:Renamed894) : void
      {
         var _loc2_:Renamed9559 = null;
         var _loc3_:Renamed9565 = null;
         this.Renamed4954(Renamed2740.Renamed4956,true);
         for each(_loc2_ in this.Renamed9558)
         {
            _loc3_ = _loc2_.getItem();
            if(_loc3_ != null)
            {
               _loc3_.Renamed9566();
            }
         }
      }
      
      public function objectLoaded() : void
      {
         this.Renamed5158 = Renamed4640(modelRegistry.getModelsByInterface(Renamed4640)[0]);
         this.container = new Sprite();
         this.container.visible = false;
         Renamed2423.Renamed3799();
         Renamed2423.Renamed2575().addChild(this.container);
         this.Renamed2432.Renamed905();
         this.Renamed9567();
         this.Renamed9568();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      public function objectUnloaded() : void
      {
         if(this.Renamed9558 == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.Renamed9558.length)
         {
            this.Renamed9569(_loc1_);
            _loc1_++;
         }
         this.Renamed9558 = null;
         Renamed2423.Renamed2575().removeChild(this.container);
         this.container = null;
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.Renamed2432.Renamed906();
         Renamed718.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.Renamed2385);
         Renamed718.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.Renamed2386);
      }
      
      public function Renamed9570(param1:Renamed9565, param2:int) : void
      {
         if(this.Renamed9571() == 0)
         {
            display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         Renamed9559(this.Renamed9558[param2]).setItem(param1);
         if(param1.count > 0 || param1.count == -1)
         {
            this.container.visible = true;
         }
      }
      
      public function itemUpdateCount(param1:Renamed9565) : void
      {
         var _loc2_:Renamed9559 = null;
         if(param1.count > 0 && !this.container.visible)
         {
            this.container.visible = true;
         }
         for each(_loc2_ in this.Renamed9558)
         {
            if(_loc2_.getItem() == param1)
            {
               _loc2_.Renamed9572();
            }
         }
      }
      
      public function initItemSlot(param1:Renamed9565) : void
      {
         var _loc2_:Renamed9559 = null;
         for each(_loc2_ in this.Renamed9558)
         {
            if(_loc2_.getItem() == param1)
            {
               _loc2_.Renamed9573();
            }
         }
      }
      
      public function Renamed9574(param1:Renamed9565) : void
      {
         var _loc2_:Renamed9559 = null;
         for each(_loc2_ in this.Renamed9558)
         {
            if(_loc2_.getItem() == param1)
            {
               _loc2_.Renamed9572();
            }
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed9575(param1:Renamed9565) : void
      {
         var _loc2_:Renamed9559 = null;
         for each(_loc2_ in this.Renamed9558)
         {
            if(_loc2_.getItem() == param1)
            {
               _loc2_.Renamed9572();
            }
         }
      }
      
      public function Renamed2941(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:Renamed9559 = null;
         var _loc5_:Renamed9565 = null;
         for each(_loc4_ in this.Renamed9558)
         {
            _loc5_ = _loc4_.getItem();
            if(_loc5_ != null && _loc5_.getId() == param1)
            {
               _loc4_.Renamed9576(param2,param3);
            }
         }
      }
      
      private function Renamed2385(param1:BattleInputLockEvent) : void
      {
         this.Renamed4954(Renamed2740.Renamed4957,true);
      }
      
      private function Renamed2386(param1:BattleInputLockEvent) : void
      {
         this.Renamed4954(Renamed2740.Renamed4957,false);
      }
      
      private function Renamed9563(param1:Object) : void
      {
         var _loc2_:Renamed9559 = null;
         var _loc3_:Renamed9565 = null;
         for each(_loc2_ in this.Renamed9558)
         {
            _loc2_.Renamed9576(Renamed2740.Renamed4956,false);
            _loc2_.Renamed9577(getTimer());
            _loc2_.Renamed9578(getTimer());
            _loc3_ = _loc2_.getItem();
            if(_loc3_ != null && _loc3_.Renamed9579() <= 75000)
            {
               _loc3_.Renamed9566();
            }
         }
      }
      
      public function Renamed4954(param1:int, param2:Boolean) : void
      {
         var _loc3_:Renamed9559 = null;
         for each(_loc3_ in this.Renamed9558)
         {
            _loc3_.Renamed9576(param1,param2);
         }
      }
      
      private function onResize(param1:Event) : void
      {
         this.container.x = 0;
         this.container.y = display.stage.stageHeight - Renamed9557;
      }
      
      private function Renamed9567() : void
      {
         var _loc5_:Renamed9559 = null;
         var _loc6_:DisplayObject = null;
         var _loc1_:int = 5;
         this.Renamed9558 = new Vector.<Renamed9559>(_loc1_);
         var _loc2_:int = 10 + new InventoryIcon(InventoryIcon.EMPTY).width;
         var _loc3_:int = 10;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc5_ = new Renamed9559(_loc4_ + 1);
            this.Renamed9558[_loc4_] = _loc5_;
            (_loc6_ = _loc5_.Renamed9580()).x = _loc3_;
            this.container.addChild(_loc6_);
            _loc3_ += _loc2_;
            _loc4_++;
         }
         Renamed718.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.Renamed2385);
         Renamed718.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.Renamed2386);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(this.Renamed9561.Renamed3885(param1.keyCode))
         {
            return;
         }
         var _loc2_:Renamed717 = Renamed719.Renamed729(param1.keyCode);
         var _loc3_:* = this.Renamed9560[_loc2_];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = _loc3_;
         var _loc5_:Renamed9559 = this.Renamed9558[_loc4_];
         if(_loc5_.isLocked())
         {
            return;
         }
         var _loc6_:Renamed9565 = _loc5_.getItem();
         if(_loc6_ != null)
         {
            this.Renamed9561.Renamed3886(param1.keyCode);
            this.Renamed5158.Renamed9581(_loc6_);
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(this.Renamed9561.Renamed3885(param1.keyCode))
         {
            this.Renamed9561.Renamed3887(param1.keyCode);
         }
      }
      
      private function Renamed9571() : int
      {
         var _loc1_:int = 0;
         var _loc2_:Renamed9559 = null;
         for each(_loc2_ in this.Renamed9558)
         {
            if(_loc2_.getItem() != null)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function Renamed9569(param1:int) : void
      {
         var _loc2_:Renamed9559 = this.Renamed9558[param1];
         _loc2_.setItem(null);
         if(this.Renamed9571() == 0)
         {
            display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc3_:Renamed9559 = null;
         var _loc2_:int = getTimer();
         for each(_loc3_ in this.Renamed9558)
         {
            _loc3_.update(_loc2_);
         }
      }
      
      private function Renamed9568() : void
      {
         this.Renamed9560[49] = 0;
         this.Renamed9560[Renamed717.USE_FIRS_AID] = 0;
         this.Renamed9560[50] = 1;
         this.Renamed9560[Renamed717.USE_DOUBLE_ARMOR] = 1;
         this.Renamed9560[51] = 2;
         this.Renamed9560[Renamed717.USE_DOUBLE_DAMAGE] = 2;
         this.Renamed9560[52] = 3;
         this.Renamed9560[Renamed717.USE_NITRO] = 3;
         this.Renamed9560[53] = 4;
         this.Renamed9560[Renamed717.USE_MINE] = 4;
      }
   }
}

