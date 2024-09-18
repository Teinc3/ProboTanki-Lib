package §+Q§
{
   import §=#M§.§catch do§;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§override var dynamic§;
   import §import catch function§.§package const override§;
   
   public class §package package dynamic§ implements §4"3§
   {
      private static const §4!9§:Vector3 = new Vector3();
      
      private static const §=#W§:§ !8§ = new § !8§();
      
      private var §7$$§:§override var dynamic§;
      
      private var effects:§7#'§;
      
      private var §try do§:§1"o§;
      
      private var §5"2§:§catch do§;
      
      private var §=!x§:§package const override§;
      
      public function §package package dynamic§(param1:§override var dynamic§, param2:§catch do§, param3:§package const override§, param4:§7#'§)
      {
         super();
         this.§7$$§ = param1;
         this.effects = param4;
         this.§=!x§ = param3;
         this.§5"2§ = param2;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
      }
      
      public function destroy() : void
      {
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
      }
      
      public function reset() : void
      {
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function §'!V§() : void
      {
         this.§try do§.§get var switch§(§=#W§);
         this.§'$!§(§=#W§);
      }
      
      private function §'$!§(param1:§ !8§) : void
      {
         this.§try do§.§0"t§().addWorldForceScaled(param1.§6u§,param1.direction,-this.§7$$§.§get package set§());
         this.§try do§.§6v§();
         this.effects.§ #'§(this.§try do§.§else catch true§(),this.§try do§.§2"F§());
      }
      
      public function §5";§(param1:Vector3) : void
      {
         this.§try do§.§get var switch§(§=#W§);
         this.§'$!§(§=#W§);
         this.effects.§throw catch use§(param1);
         this.effects.§!"F§(§=#W§.§if package var§,param1);
         this.§=#!§(param1,null);
      }
      
      public function §1$!§(param1:Tank, param2:Vector3) : void
      {
         this.§try do§.§get var switch§(§=#W§);
         this.§'$!§(§=#W§);
         this.effects.§throw catch use§(param2);
         this.§if catch set§(param1,param2,§=#W§.§6u§);
         this.§=#!§(param2,param1.§0"t§());
      }
      
      private function §if catch set§(param1:Tank, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Number = NaN;
         §4!9§.diff(param2,param3).normalize();
         if(Vector3.isFiniteVector(§4!9§))
         {
            _loc4_ = this.§with catch false§(param2);
            param1.§case extends§(param2,§4!9§,this.§7$$§.§include package finally§() * _loc4_);
         }
      }
      
      private function §with catch false§(param1:Vector3) : Number
      {
         return this.§5"2§.§1"g§(param1.distanceTo(§=#W§.§6u§));
      }
      
      private function §=#!§(param1:Vector3, param2:Body) : void
      {
         var _loc3_:Number = this.§with catch false§(param1);
         this.§=!x§.§switch class§(Tank(this.§try do§).tankData.turret,param1,_loc3_,param2);
      }
   }
}

