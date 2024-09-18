package §class for§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§final set var§;
   import alternativa.tanks.models.weapon.§override var dynamic§;
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import alternativa.tanks.models.weapons.targeting.§implements set false§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.getTimer;
   
   public class §class set with§ extends §else package false§ implements §4"3§, §;!t§
   {
      private static const §=#W§:§ !8§ = new § !8§();
      
      private static const §-">§:§final set var§ = new §final set var§();
      
      private var controller:§6#L§;
      
      private var §in set implements§:§implements set false§;
      
      private var §break const case§:EncryptedInt;
      
      private var §7$$§:§override var dynamic§;
      
      private var weakeningCoeff:Number;
      
      private var §<"B§:EncryptedInt;
      
      private var effects:§7#c§;
      
      private var callback:§[#f§;
      
      private var §try do§:§1"o§;
      
      private var enabled:Boolean;
      
      private var §else for each§:EncryptedInt;
      
      private var §#!A§:Boolean;
      
      public function §class set with§(param1:§implements set false§, param2:§6#L§, param3:int, param4:§override var dynamic§, param5:Number, param6:int, param7:§7#c§, param8:§[#f§)
      {
         this.§break const case§ = new EncryptedIntImpl();
         this.§<"B§ = new EncryptedIntImpl();
         this.§else for each§ = new EncryptedIntImpl();
         super();
         this.§in set implements§ = param1;
         this.controller = param2;
         this.§break const case§.setInt(param3);
         this.§7$$§ = param4;
         this.weakeningCoeff = param5;
         this.§<"B§.setInt(param6);
         this.effects = param7;
         this.callback = param8;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
         this.controller.init();
      }
      
      public function destroy() : void
      {
         this.deactivate();
         this.effects.§while set use§();
         this.controller.destroy();
         this.controller = null;
         this.effects = null;
         this.§7$$§ = null;
         this.§in set implements§ = null;
         this.callback = null;
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
         if(this.enabled)
         {
            this.enabled = false;
            this.effects.§while set use§();
         }
      }
      
      public function reset() : void
      {
         this.enabled = false;
         this.effects.§while set use§();
         this.§else for each§.setInt(0);
         this.§#!A§ = false;
      }
      
      public function getStatus() : Number
      {
         if(this.§#!A§)
         {
            return MathUtils.clamp((this.§else for each§.getInt() - getTimer()) / this.§<"B§.getInt(),0,1);
         }
         return MathUtils.clamp(1 - (this.§else for each§.getInt() - getTimer()) / this.§break const case§.getInt(),0,1);
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         if(this.§#!A§)
         {
            if(param1 >= this.§else for each§.getInt())
            {
               this.§'!V§(param1);
            }
         }
         else if(this.enabled)
         {
            if(param1 >= this.§else for each§.getInt() && this.controller.§-"'§())
            {
               this.§override catch use§(param1);
            }
         }
         this.controller.§with const function§();
      }
      
      private function §override catch use§(param1:int) : void
      {
         this.§#!A§ = true;
         this.§else for each§.setInt(param1 + this.§<"B§.getInt());
         this.effects.§8#%§(this.§try do§.§else catch true§(),this.§try do§.§2"F§(),this.§<"B§.getInt());
         this.§try do§.§else set return§(§-">§);
         this.effects.§`#y§(§-">§.§6u§);
         this.callback.§%#$§(param1);
      }
      
      private function §'!V§(param1:int) : void
      {
         var _loc2_:§override for continue§ = null;
         this.§#!A§ = false;
         this.§else for each§.setInt(param1 + this.§break const case§.getInt());
         this.§try do§.§get var switch§(§=#W§);
         this.§try do§.§0"t§().addWorldForceScaled(§=#W§.§6u§,§=#W§.direction,-this.§7$$§.§get package set§());
         this.§try do§.§6v§();
         if(§+$%§.§override var include§(this.§try do§.§0"t§(),§=#W§))
         {
            _loc2_ = new §override for continue§();
            _loc2_.§in try§(this.§in set implements§.target(§=#W§));
            if(_loc2_.§class package const§.length > 0)
            {
               this.§throw package if§(_loc2_);
            }
            this.§1@§(_loc2_,§=#W§);
            this.callback.§-!<§(param1,_loc2_.§set use§(),_loc2_.targets,_loc2_.§class package const§);
         }
         else
         {
            this.callback.§return catch set§(param1);
         }
      }
      
      private function §throw package if§(param1:§override for continue§) : void
      {
         var _loc2_:Body = null;
         var _loc3_:Tank = null;
         var _loc4_:Number = 1;
         var _loc5_:int = 0;
         while(_loc5_ < param1.targets.length)
         {
            _loc2_ = param1.targets[_loc5_];
            _loc3_ = _loc2_.tank;
            _loc3_.§case extends§(param1.§class package const§[_loc5_],param1.shotDirection,this.§7$$§.§include package finally§() * _loc4_);
            _loc4_ *= this.weakeningCoeff;
            _loc5_++;
         }
      }
      
      private function §1@§(param1:§override for continue§, param2:§ !8§) : void
      {
         var _loc3_:Vector3 = param1.§set use§();
         if(_loc3_ == null && param1.targets.length > 0)
         {
            _loc3_ = §,"W§.§^#Y§(param2.§if package var§,param1.shotDirection);
         }
         this.effects.§each set for§(param2.§6u§,_loc3_,param2.direction);
         this.effects.§extends package while§(param2.§if package var§,param1.§set use§());
         if(_loc3_ != null)
         {
            if(param1.hasStaticHit)
            {
               this.effects.§continue var import§(param2.§6u§,param1.staticHitPoint,param1.§!"!§);
            }
            if(param1.targets.length > 0)
            {
               this.effects.§null var final§(param2.§6u§,_loc3_,param1.§class package const§,param1.targets);
            }
         }
      }
   }
}

