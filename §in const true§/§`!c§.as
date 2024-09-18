package §in const true§
{
   import §=#M§.§catch do§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§extends for final§;
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import alternativa.tanks.models.weapons.targeting.§#"1§;
   import alternativa.tanks.models.weapons.targeting.§implements set false§;
   import alternativa.tanks.models.weapons.targeting.§package for extends§;
   import §final var static§.§"#;§;
   import flash.utils.getTimer;
   import §for set super§.§super const continue§;
   import §if package do§.§'!L§;
   
   public class §`!c§ extends §else package false§ implements §4"3§, §;!t§
   {
      private static var shotId:int;
      
      private static const §=#W§:§ !8§ = new § !8§();
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private var §^!N§:int;
      
      private var §native const for§:int;
      
      private var §in const case§:Number;
      
      private var controller:§6#L§;
      
      private var §try do§:§1"o§;
      
      private var enabled:Boolean;
      
      private var §in set implements§:§implements set false§;
      
      private var §<#%§:int;
      
      private var callback:§continue package break§;
      
      private var §-D§:§2!K§;
      
      private var effects:§const var if§;
      
      private var §5"2§:§catch do§;
      
      public function §`!c§(param1:ClientObject, param2:ClientObject, param3:§"#;§, param4:§include var dynamic§, param5:§continue package break§)
      {
         super();
         var _loc6_:§extends for final§ = new §extends for final§(param1);
         var _loc7_:§catch do§ = _loc6_.§use package dynamic§();
         var _loc8_:§'!L§ = _loc6_.§extends catch with§();
         var _loc9_:§continue package break§ = param5;
         var _loc10_:§include var dynamic§ = param4;
         var _loc11_:§2!K§ = new §2!K§(_loc6_,param3,_loc10_.§@!1§(param1),_loc9_);
         var _loc12_:§implements set false§ = new §#"1§(param1,_loc6_,_loc7_.§6T§());
         _loc12_.§[#q§().§["v§();
         var _loc13_:§6#L§ = new §6#L§();
         this.§native const for§ = _loc6_.§package var false§();
         this.§in const case§ = _loc8_.§get package set§();
         this.controller = _loc13_;
         this.§in set implements§ = _loc12_;
         this.callback = _loc9_;
         this.§-D§ = _loc11_;
         this.effects = _loc10_.§%H§(param1);
         this.§5"2§ = _loc7_;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
         this.controller.init();
      }
      
      public function destroy() : void
      {
         this.§in set implements§ = null;
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
         if(!this.enabled)
         {
            this.enabled = true;
            this.controller.§with const function§();
         }
      }
      
      public function disable(param1:Boolean) : void
      {
         this.enabled = false;
      }
      
      public function reset() : void
      {
         this.controller.§with const function§();
         this.§^!N§ = 0;
         this.§<#%§ = 1;
      }
      
      public function getStatus() : Number
      {
         var _loc1_:Number = 1 - (this.§^!N§ - getTimer()) / this.§native const for§;
         return _loc1_ > 1 ? Number(1) : Number(_loc1_);
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         if(this.enabled)
         {
            if(this.controller.§-"'§() && param1 >= this.§^!N§)
            {
               this.§'!V§(param1);
            }
         }
         this.controller.§with const function§();
      }
      
      private function §'!V§(param1:int) : void
      {
         this.§^!N§ = param1 + this.§native const for§;
         this.§try do§.§get var switch§(§=#W§,this.§<#%§);
         this.§try do§.§0"t§().addWorldForceScaled(§=#W§.§6u§,§=#W§.direction,-this.§in const case§);
         this.§try do§.§6v§(1);
         this.effects.§ #'§(this.§try do§.§2"F§(),this.§try do§.§else catch true§(this.§<#%§));
         if(§+$%§.§override var include§(this.§try do§.§0"t§(),§=#W§))
         {
            this.§while var dynamic§(param1,§=#W§);
         }
         else
         {
            this.§ "q§(param1);
         }
         this.§<#%§ = (this.§<#%§ + 1) % this.§try do§.§+"B§();
      }
      
      private function §while var dynamic§(param1:int, param2:§ !8§) : void
      {
         var _loc3_:§package for extends§ = null;
         if(this.§0c§(param2.§if package var§,param2.direction,this.§try do§.§do const false§(this.§<#%§)))
         {
            shotDirection.copy(param2.direction);
         }
         else
         {
            _loc3_ = this.§in set implements§.target(param2);
            shotDirection.copy(_loc3_.§do var§());
         }
         var _loc4_:§?!j§ = this.§-D§.§import catch do§();
         _loc4_.§const const while§(param2,shotDirection,this.§try do§.§0"t§(),++shotId);
         this.callback.§-!<§(param1,_loc4_.§function final§(),this.§<#%§,shotDirection);
      }
      
      private function §0c§(param1:Vector3, param2:Vector3, param3:Number) : Boolean
      {
         return §'x§().§const const true§().raycastStatic(param1,param2,§super const continue§.§finally catch while§,param3,null,§extends const default§);
      }
      
      private function § "q§(param1:int) : void
      {
         this.callback.§`#Q§(param1,this.§<#%§);
      }
   }
}

