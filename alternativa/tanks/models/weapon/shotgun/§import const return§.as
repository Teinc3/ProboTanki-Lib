package alternativa.tanks.models.weapon.shotgun
{
   import §0#y§.§with package import§;
   import §;q§.§,§;
   import §="K§.§final catch false§;
   import §=#M§.§catch do§;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import flash.utils.getTimer;
   import §if package do§.§'!L§;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.§default for break§;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class §import const return§ extends §final catch false§
   {
      private var params:§,#1§;
      
      private var §static for finally§:int;
      
      private var §;!E§:int;
      
      private var §>w§:§ 5§;
      
      private var §with var const§:Number;
      
      private var §finally set each§:Vector3;
      
      private var §1#C§:§static package null§;
      
      private var §true const default§:int;
      
      private var effects:§with package import§;
      
      public function §import const return§(param1:§,#1§, param2:§static package null§, param3:§ 5§, param4:§with package import§)
      {
         this.§finally set each§ = new Vector3();
         this.params = param1;
         this.§1#C§ = param2;
         this.§>w§ = param3;
         this.§true const default§ = param2.§package var false§();
         var _loc5_:§catch do§ = param2.§use package dynamic§();
         this.§with var const§ = _loc5_.§package finally§();
         this.effects = param4;
         super(param2);
      }
      
      override public function getStatus() : Number
      {
         if(this.§static for finally§ == 0)
         {
            return 1 - (this.§;!E§ - getTimer()) / this.params.magazineReloadTime;
         }
         return this.§static for finally§ / Number(this.params.magazineSize);
      }
      
      override public function §var package implements§(param1:int, param2:int) : void
      {
         if(§5#T§() && param1 >= this.§;!E§)
         {
            this.§'!V§(param1);
         }
      }
      
      private function §'!V§(param1:int) : void
      {
         var _loc2_:Vector.<§default for break§> = null;
         if(this.§static for finally§ == 0)
         {
            this.§static for finally§ = this.params.magazineSize;
         }
         var _loc3_:§1"o§ = this.§2#N§();
         --this.§static for finally§;
         if(this.§static for finally§ == 0)
         {
            this.§;!E§ = param1 + this.params.magazineReloadTime;
            this.effects.§implements var do§(_loc3_.§2"F§(),this.params.magazineReloadTime);
         }
         else
         {
            this.§;!E§ = param1 + this.§true const default§;
            this.effects.§8!K§(_loc3_.§2"F§(),this.§true const default§);
         }
         _loc3_.§get var switch§(§=#0§);
         var _loc4_:§'!L§ = this.§1#C§.§extends catch with§();
         _loc3_.§0"t§().addWorldForceScaled(§=#0§.§if package var§,§=#0§.direction,-_loc4_.§get package set§());
         _loc3_.§6v§();
         if(§+$%§.§override var include§(_loc3_.§0"t§(),§=#0§))
         {
            _loc2_ = this.§>w§.§else const implements§(§=#0§,_loc3_.§0"t§(),this.§finally set each§);
            this.§1#C§.§^G§().§;# §(param1,this.§finally set each§,_loc2_);
         }
         else
         {
            this.§finally set each§.copy(§=#0§.direction);
            this.§1#C§.§^G§().§case break§(param1,this.§finally set each§);
         }
         this.effects.§ #'§(this.§1#C§,§=#0§,_loc3_,this.§finally set each§);
      }
      
      override public function reset() : void
      {
         super.reset();
         this.effects.§while set use§();
         this.§static for finally§ = this.params.magazineSize;
         this.§;!E§ = getTimer();
      }
      
      override public function §2#N§() : §1"o§
      {
         return super.§2#N§();
      }
      
      override public function destroy() : void
      {
         super.destroy();
         this.§1#C§ = null;
         this.§>w§ = null;
         this.params = null;
         this.effects.§while set use§();
         this.effects = null;
      }
      
      override public function disable(param1:Boolean) : void
      {
         super.disable(param1);
         this.effects.§while set use§();
      }
      
      override public function §catch var§() : ItemProperty
      {
         return ItemProperty.SHOTGUN_RESISTANCE;
      }
   }
}

