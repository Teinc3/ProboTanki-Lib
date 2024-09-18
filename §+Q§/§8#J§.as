package §+Q§
{
   import §=#M§.§catch do§;
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
   import §import catch function§.§package const override§;
   
   public class §8#J§ extends §else package false§ implements §4"3§, §;!t§
   {
      private static const §=#0§:§ !8§ = new § !8§();
      
      private static const §set var function§:§%"Y§ = new §%"Y§();
      
      private var enabled:Boolean;
      
      private var §break const case§:EncryptedInt;
      
      private var §else for each§:EncryptedInt;
      
      private var §7$$§:§override var dynamic§;
      
      private var controller:§6#L§;
      
      private var §in set implements§:§implements set false§;
      
      private var §try do§:§1"o§;
      
      private var §5"2§:§catch do§;
      
      private var §=!x§:§package const override§;
      
      private var callback:§<#f§;
      
      private var effects:§7#'§;
      
      public function §8#J§(param1:int, param2:§override var dynamic§, param3:§catch do§, param4:§implements set false§, param5:§package const override§, param6:§7#'§, param7:§<#f§)
      {
         this.§break const case§ = new EncryptedIntImpl();
         this.§else for each§ = new EncryptedIntImpl();
         super();
         this.§break const case§.setInt(param1);
         this.§7$$§ = param2;
         this.controller = new §6#L§();
         this.§in set implements§ = param4;
         this.§5"2§ = param3;
         this.§=!x§ = param5;
         this.callback = param7;
         this.effects = param6;
      }
      
      private static function §6#T§(param1:§%"Y§) : void
      {
         param1.position.add(param1.normal);
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
         this.§=!x§ = null;
         this.callback = null;
         this.effects = null;
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
         var _loc2_:Number = NaN;
         var _loc3_:Tank = null;
         this.§else for each§.setInt(param1 + this.§break const case§.getInt());
         this.§try do§.§get var switch§(§=#0§);
         this.§try do§.§0"t§().addWorldForceScaled(§=#0§.§if package var§,§=#0§.direction,-this.§7$$§.§get package set§());
         this.§try do§.§6v§();
         this.effects.§ #'§(this.§try do§.§else catch true§(),this.§try do§.§2"F§());
         if(§+$%§.§override var include§(this.§try do§.§0"t§(),§=#0§) && this.§;!b§(§=#0§,§set var function§))
         {
            §6#T§(§set var function§);
            this.effects.§throw catch use§(§set var function§.position);
            _loc2_ = this.§5"2§.§1"g§(§set var function§.distance);
            this.§=!x§.§switch class§(Tank(this.§try do§).tankData.turret,§set var function§.position,_loc2_,§set var function§.body);
            if(§+$%§.§ #T§(§set var function§.body))
            {
               _loc3_ = §set var function§.body.tank;
               _loc3_.§case extends§(§set var function§.position,§set var function§.direction,this.§7$$§.§include package finally§() * _loc2_);
               this.callback.§default set continue§(param1,§set var function§.position,§set var function§.body);
            }
            else
            {
               this.effects.§!"F§(§=#0§.§if package var§,§set var function§.position);
               this.callback.§else package override§(param1,§set var function§.position);
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
   }
}

