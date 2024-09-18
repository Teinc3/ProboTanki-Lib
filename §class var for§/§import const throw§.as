package §class var for§
{
   import § !g§.§class for case§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§+#k§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§continue var case§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import platform.client.fp10.core.type.AutoClosable;
   import services.contextmenu.ContextMenuServiceEvent;
   import services.contextmenu.IContextMenuService;
   
   public class §import const throw§ implements §override set static§, §throw package continue§, AutoClosable
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §9#A§:TankUsersRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      private var §"#r§:Tank;
      
      private var §`#]§:§const set default§;
      
      public function §import const throw§(param1:§const set default§)
      {
         super();
         this.§`#]§ = param1;
         battleEventDispatcher.§set for each§(§+#k§,this);
         contextMenuService.addEventListener(ContextMenuServiceEvent.FOCUS_ON_USER,this.§["X§);
      }
      
      private function §["X§(param1:ContextMenuServiceEvent) : void
      {
         var _loc2_:ClientObject = §9#A§.§if for with§(param1.userId);
         this.§ "7§(this.getTank(_loc2_));
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Tank = §+#k§(param1).tank;
         if(this.§"#r§ == _loc2_)
         {
            this.§#";§();
         }
      }
      
      public function §dynamic package override§(param1:KeyboardEvent) : void
      {
      }
      
      public function §-#8§(param1:KeyboardEvent) : void
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
                  _loc2_ = this.§function if§(null);
                  break;
               case Keyboard.R:
                  _loc2_ = this.§function if§(§class for case§.BLUE);
                  break;
               case Keyboard.B:
                  _loc2_ = this.§function if§(§class for case§.RED);
                  break;
               case Keyboard.U:
                  this.§#";§();
            }
            if(_loc2_)
            {
               this.§ "7§(_loc2_);
            }
         }
         else if(this.§"#r§)
         {
            switch(param1.keyCode)
            {
               case Keyboard.RIGHT:
                  this.§`+§();
                  break;
               case Keyboard.LEFT:
                  this.§,"d§();
            }
         }
      }
      
      private function §function if§(param1:§class for case§) : Tank
      {
         var _loc2_:ClientObject = null;
         var _loc3_:Tank = null;
         var _loc4_:Number = NaN;
         var _loc5_:Tank = null;
         var _loc6_:Number = 100000000000000000000;
         var _loc7_:§3!0§ = this.§@!!§().§super package§();
         var _loc8_:Vector3 = new Vector3(_loc7_.x,_loc7_.y,_loc7_.z);
         for each(_loc2_ in §9#A§.§ !c§())
         {
            _loc3_ = this.getTank(_loc2_);
            if(_loc3_.teamType != param1 && _loc3_.state == §continue var case§.§?!S§)
            {
               _loc4_ = _loc3_.§0"t§().state.position.distanceTo(_loc8_);
               if(_loc4_ < _loc6_)
               {
                  _loc6_ = _loc4_;
                  _loc5_ = _loc3_;
               }
            }
         }
         return _loc5_;
      }
      
      private function § "7§(param1:Tank) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.state != §continue var case§.§?!S§)
         {
            return;
         }
         if(this.§"#r§ == null)
         {
            battleService.§continue package try§();
         }
         else
         {
            this.§final case§();
         }
         this.§"#r§ = param1;
         battleService.§^!6§(param1);
      }
      
      public function §#";§() : void
      {
         if(this.§"#r§)
         {
            this.§final case§();
            this.§"#r§ = null;
            this.§`#]§.activate();
            this.§`#]§.§5"w§();
         }
      }
      
      private function §final case§() : void
      {
      }
      
      private function §`+§() : void
      {
         this.§ "7§(this.§super const else§(1));
      }
      
      private function §,"d§() : void
      {
         this.§ "7§(this.§super const else§(-1));
      }
      
      private function §super const else§(param1:int) : Tank
      {
         var _loc2_:Tank = null;
         var _loc3_:Vector.<ClientObject> = §9#A§.§ !c§();
         var _loc4_:int = int(_loc3_.indexOf(this.§"#r§.§if for with§()));
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
            if(_loc2_.teamType == this.§"#r§.teamType && _loc2_.state == §continue var case§.§?!S§)
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
         var _loc2_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         return _loc2_.getTankData(param1).tank;
      }
      
      private function §@!!§() : §[!r§
      {
         return battleService.§3l§();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         battleEventDispatcher.§7!3§(§+#k§,this);
         contextMenuService.removeEventListener(ContextMenuServiceEvent.FOCUS_ON_USER,this.§["X§);
      }
   }
}

