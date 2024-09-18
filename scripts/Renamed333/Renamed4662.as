package Renamed333
{
   import Renamed136.Renamed663;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed883;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import platform.client.fp10.core.type.AutoClosable;
   import services.contextmenu.ContextMenuServiceEvent;
   import services.contextmenu.IContextMenuService;
   
   public class Renamed4662 implements Renamed7849, Renamed511, AutoClosable
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed2775:TankUsersRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      private var Renamed7899:Tank;
      
      private var Renamed7900:Renamed2382;
      
      public function Renamed4662(param1:Renamed2382)
      {
         super();
         this.Renamed7900 = param1;
         battleEventDispatcher.Renamed539(Renamed883,this);
         contextMenuService.addEventListener(ContextMenuServiceEvent.FOCUS_ON_USER,this.Renamed7901);
      }
      
      private function Renamed7901(param1:ContextMenuServiceEvent) : void
      {
         var _loc2_:ClientObject = Renamed2775.Renamed695(param1.userId);
         this.Renamed7902(this.getTank(_loc2_));
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Tank = Renamed883(param1).tank;
         if(this.Renamed7899 == _loc2_)
         {
            this.Renamed7892();
         }
      }
      
      public function Renamed7851(param1:KeyboardEvent) : void
      {
      }
      
      public function Renamed2516(param1:KeyboardEvent) : void
      {
         this.onKey(param1);
      }
      
      private function onKey(param1:KeyboardEvent) : void
      {
         var _loc2_:Tank = null;
         if(param1.ctrlKey)
         {
            switch(param1.keyCode)
            {
               case Keyboard.F:
                  _loc2_ = this.Renamed7903(null);
                  break;
               case Keyboard.R:
                  _loc2_ = this.Renamed7903(Renamed663.BLUE);
                  break;
               case Keyboard.B:
                  _loc2_ = this.Renamed7903(Renamed663.RED);
                  break;
               case Keyboard.U:
                  this.Renamed7892();
            }
            if(_loc2_)
            {
               this.Renamed7902(_loc2_);
            }
         }
         else if(this.Renamed7899)
         {
            switch(param1.keyCode)
            {
               case Keyboard.RIGHT:
                  this.Renamed7904();
                  break;
               case Keyboard.LEFT:
                  this.Renamed7905();
            }
         }
      }
      
      private function Renamed7903(param1:Renamed663) : Tank
      {
         var _loc2_:ClientObject = null;
         var _loc3_:Tank = null;
         var _loc4_:Number = NaN;
         var _loc5_:Tank = null;
         var _loc6_:Number = 100000000000000000000;
         var _loc7_:Renamed842 = this.Renamed1496().Renamed739();
         var _loc8_:Vector3 = new Vector3(_loc7_.x,_loc7_.y,_loc7_.z);
         for each(_loc2_ in Renamed2775.Renamed2895())
         {
            _loc3_ = this.getTank(_loc2_);
            if(_loc3_.teamType != param1 && _loc3_.state == Renamed841.Renamed854)
            {
               _loc4_ = _loc3_.Renamed696().state.position.distanceTo(_loc8_);
               if(_loc4_ < _loc6_)
               {
                  _loc6_ = _loc4_;
                  _loc5_ = _loc3_;
               }
            }
         }
         return _loc5_;
      }
      
      private function Renamed7902(param1:Tank) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.state != Renamed841.Renamed854)
         {
            return;
         }
         if(this.Renamed7899 == null)
         {
            battleService.Renamed639();
         }
         else
         {
            this.Renamed7906();
         }
         this.Renamed7899 = param1;
         battleService.Renamed635(param1);
      }
      
      public function Renamed7892() : void
      {
         if(this.Renamed7899)
         {
            this.Renamed7906();
            this.Renamed7899 = null;
            this.Renamed7900.activate();
            this.Renamed7900.Renamed7889();
         }
      }
      
      private function Renamed7906() : void
      {
      }
      
      private function Renamed7904() : void
      {
         this.Renamed7902(this.Renamed7907(1));
      }
      
      private function Renamed7905() : void
      {
         this.Renamed7902(this.Renamed7907(-1));
      }
      
      private function Renamed7907(param1:int) : Tank
      {
         var _loc2_:Tank = null;
         var _loc3_:Vector.<ClientObject> = Renamed2775.Renamed2895();
         var _loc4_:int = int(_loc3_.indexOf(this.Renamed7899.Renamed695()));
         if(_loc4_ == -1)
         {
            return null;
         }
         var _loc5_:int = _loc4_;
         while(true)
         {
            _loc5_ += param1;
            if(_loc5_ += param1 == -1)
            {
               _loc5_ = int(_loc3_.length - 1);
            }
            else if(_loc5_ == _loc3_.length)
            {
               _loc5_ = 0;
            }
            _loc2_ = this.getTank(_loc3_[_loc5_]);
            if(_loc2_.teamType == this.Renamed7899.teamType && _loc2_.state == Renamed841.Renamed854)
            {
               break;
            }
            if(_loc4_ == _loc5_)
            {
               return null;
            }
         }
         return _loc2_;
      }
      
      private function getTank(param1:ClientObject) : Tank
      {
         var _loc2_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         return _loc2_.getTankData(param1).tank;
      }
      
      private function Renamed1496() : Renamed610
      {
         return battleService.Renamed621();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         battleEventDispatcher.Renamed866(Renamed883,this);
         contextMenuService.removeEventListener(ContextMenuServiceEvent.FOCUS_ON_USER,this.Renamed7901);
      }
   }
}

