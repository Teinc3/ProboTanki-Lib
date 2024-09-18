package §in const true§
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§extends for final§;
   import §final var static§.§"#;§;
   import §if package do§.§'!L§;
   
   public class §native set override§ implements §4"3§
   {
      private static const §package const throw§:§ !8§ = new § !8§();
      
      private var §in const case§:Number;
      
      private var §-D§:§2!K§;
      
      private var effects:§const var if§;
      
      private var §try do§:§1"o§;
      
      public function §native set override§(param1:ClientObject, param2:§"#;§, param3:§include var dynamic§)
      {
         super();
         var _loc4_:§extends for final§ = new §extends for final§(param1);
         var _loc5_:§'!L§ = _loc4_.§extends catch with§();
         var _loc6_:§include var dynamic§ = param3;
         var _loc7_:§2!K§ = new §2!K§(_loc4_,param2,_loc6_.§@!1§(param1));
         this.§in const case§ = _loc5_.§get package set§();
         this.§-D§ = _loc7_;
         this.effects = _loc6_.§%H§(param1);
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
      }
      
      public function fire(param1:int, param2:int, param3:Vector3) : void
      {
         this.§try do§.§get var switch§(§package const throw§,param1);
         this.§ #'§(param1,§package const throw§);
         var _loc4_:§?!j§ = this.§-D§.§import catch do§();
         _loc4_.§const const while§(§package const throw§,param3,this.§try do§.§0"t§(),param2);
      }
      
      public function §false var each§(param1:int) : void
      {
         this.§try do§.§get var switch§(§package const throw§,param1);
         this.§ #'§(param1,§package const throw§);
      }
      
      private function § #'§(param1:int, param2:§ !8§) : void
      {
         this.§try do§.§0"t§().addWorldForceScaled(param2.§6u§,param2.direction,-this.§in const case§);
         this.§try do§.§6v§(1);
         this.effects.§ #'§(this.§try do§.§2"F§(),this.§try do§.§else catch true§(param1));
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
   }
}

