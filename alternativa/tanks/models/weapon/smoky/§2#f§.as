package alternativa.tanks.models.weapon.smoky
{
   import §=#M§.§catch do§;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§override var dynamic§;
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import alternativa.tanks.models.weapons.targeting.§implements set false§;
   import alternativa.tanks.models.weapons.targeting.§package for extends§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.utils.getTimer;
   import §if package do§.§%"Y§;
   
   public class §2#f§ extends §else package false§ implements §4"3§, §;!t§
   {
      private static const §=#0§:§ !8§ = new § !8§();
      
      private var enabled:Boolean;
      
      private var §break const case§:EncryptedInt;
      
      private var §else for each§:EncryptedInt;
      
      private var §7$$§:§override var dynamic§;
      
      private var controller:§6#L§;
      
      private var §in set implements§:§implements set false§;
      
      private var §try do§:§1"o§;
      
      private var §5"2§:§catch do§;
      
      private var callback:§,v§;
      
      private var effects:§<"=§;
      
      public function §2#f§(param1:int, param2:§override var dynamic§, param3:§implements set false§, param4:§catch do§, param5:§<"=§, param6:§,v§, param7:§6#L§)
      {
         this.§break const case§ = new EncryptedIntImpl();
         this.§else for each§ = new EncryptedIntImpl();
         super();
         this.§break const case§.setInt(param1);
         this.§7$$§ = param2;
         this.§in set implements§ = param3;
         this.§5"2§ = param4;
         this.effects = param5;
         this.callback = param6;
         this.controller = param7;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
         this.controller.init();
         this.reset();
      }
      
      public function destroy() : void
      {
         this.§7$$§ = null;
         this.§in set implements§ = null;
         this.§5"2§ = null;
         this.effects = null;
         this.callback = null;
         this.controller.destroy();
         this.controller = null;
      }
      
      public function activate() : void
      {
         §'x§().§%#9§(this);
      }
      
      public function deactivate() : void
      {
         §'x§().§%"7§(this);
      }
      
      public function enable() : void
      {
         this.enabled = true;
         this.controller.§with const function§();
      }
      
      public function disable(param1:Boolean) : void
      {
         this.enabled = false;
      }
      
      public function reset() : void
      {
         this.§else for each§.setInt(getTimer());
      }
      
      public function getStatus() : Number
      {
         var _loc1_:Number = 1 - (this.§else for each§.getInt() - getTimer()) / this.§break const case§.getInt();
         return _loc1_ > 1 ? Number(1) : Number(_loc1_);
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         if(this.controller.§-"'§())
         {
            if(this.enabled && param1 >= this.§else for each§.getInt())
            {
               this.§'!V§(param1);
            }
            this.controller.§with const function§();
         }
      }
      
      private function §'!V§(param1:int) : void
      {
         var _loc2_:Tank = null;
         var _loc3_:Number = NaN;
         this.§else for each§.setInt(param1 + this.§break const case§.getInt());
         this.§try do§.§get var switch§(§=#0§);
         this.§try do§.§0"t§().addWorldForceScaled(§=#0§.§if package var§,§=#0§.direction,-this.§7$$§.§get package set§());
         this.§try do§.§6v§();
         this.effects.§ #'§(this.§try do§.§else catch true§(),this.§try do§.§2"F§());
         var _loc4_:§%"Y§ = new §%"Y§();
         if(§+$%§.§override var include§(this.§try do§.§0"t§(),§=#0§) && this.§;!b§(§=#0§,_loc4_))
         {
            this.effects.§throw catch use§(_loc4_.position);
            if(§+$%§.§ #T§(_loc4_.body))
            {
               _loc2_ = _loc4_.body.tank;
               _loc3_ = this.§5"2§.§1"g§(_loc4_.distance);
               _loc2_.§case extends§(_loc4_.position,_loc4_.direction,this.§7$$§.§include package finally§() * _loc3_);
               this.callback.§default set continue§(param1,_loc4_.position,_loc4_.body);
            }
            else
            {
               this.effects.§!"F§(§=#0§.§if package var§,_loc4_.position);
               this.callback.§else package override§(param1,_loc4_.position);
            }
         }
         else
         {
            this.callback.§-!<§(param1);
         }
      }
      
      private function §;!b§(param1:§ !8§, param2:§%"Y§) : Boolean
      {
         var _loc3_:§package for extends§ = this.§in set implements§.target(param1);
         param2.setResult(param1,_loc3_);
         return _loc3_.§return const final§();
      }
      
      public function §6i§(param1:Vector3) : void
      {
         this.effects.§get for get§(param1);
      }
   }
}

