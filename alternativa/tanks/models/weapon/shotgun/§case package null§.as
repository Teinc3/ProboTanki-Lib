package alternativa.tanks.models.weapon.shotgun
{
   import §0#y§.§with for§;
   import §0#y§.§with package import§;
   import §;q§.§else catch for§;
   import §;q§.§override const null§;
   import §=#M§.§catch do§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§&§;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§catch catch§;
   import alternativa.tanks.models.weapon.§catch catch false§;
   import alternativa.tanks.models.weapon.§extends for final§;
   import §continue package switch§.§6"?§;
   import §each throw§.§super set var§;
   import §in var super§.§9!T§;
   import scpacker.tanks.WeaponsManager;
   
   public class §case package null§ extends §else catch for§ implements §override const null§, §catch catch false§, §9!T§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var shooter:ClientObject;
      
      private var §=#0§:§ !8§;
      
      private var §break catch const§:§static package null§;
      
      public function §case package null§()
      {
         this.§=#0§ = new § !8§();
         super();
      }
      
      private static function §continue for each§(param1:ClientObject) : §with package import§
      {
         var _loc2_:§with for§ = WeaponsManager.§%!e§(param1);
         return _loc2_.§continue for each§(param1);
      }
      
      public function §return package set§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         this.shooter = param1;
         return new §import const return§(getInitParam(),this.§1#C§(param1),this.§8"v§(_loc2_.turret).§!$%§(param1),§continue for each§(param1));
      }
      
      public function §each package class§(param1:ClientObject) : §4"3§
      {
         return new §&#7§();
      }
      
      public function §-!<§(param1:ClientObject, param2:Vector3, param3:Vector.<§super set var§>) : void
      {
         this.§include const try§(param1);
         this.§42§(param1,param3);
      }
      
      private function §1#C§(param1:ClientObject) : §static package null§
      {
         if(this.§break catch const§ == null)
         {
            this.§break catch const§ = new §static package null§(param1);
         }
         else
         {
            this.§break catch const§.§4>§(param1);
         }
         return this.§break catch const§;
      }
      
      private function §8"v§(param1:ClientObject) : §6"?§
      {
         return §6"?§(param1.getParams(§6"?§));
      }
      
      private function §include const try§(param1:ClientObject) : void
      {
         var _loc2_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         var _loc3_:Tank = _loc2_.getTankData(param1).tank;
         §catch catch§.§^S§(_loc3_.§2"F§(),_loc3_.§else catch true§(),this.§=#0§);
      }
      
      private function §42§(param1:ClientObject, param2:Vector.<§super set var§>) : void
      {
         var _loc13_:Tank = null;
         var _loc3_:§super set var§ = null;
         var _loc4_:§2!s§ = null;
         var _loc5_:Tank = null;
         var _loc6_:Vector3 = null;
         var _loc7_:Number = NaN;
         var _loc8_:Vector3 = new Vector3();
         var _loc9_:§extends for final§ = new §extends for final§(param1);
         var _loc10_:Number = _loc9_.§extends catch with§().§include package finally§();
         var _loc11_:§catch do§ = _loc9_.§use package dynamic§();
         _loc4_ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         var _loc12_:§7!9§;
         if(!(_loc12_ = _loc4_.getTankData(param1)).local)
         {
            _loc13_ = _loc4_.getTank(param1);
            _loc13_.§case extends§(this.§=#0§.§if package var§,this.§=#0§.direction,-_loc9_.§extends catch with§().§get package set§());
         }
         for each(_loc3_ in param2)
         {
            _loc5_ = _loc4_.getTankData(_loc3_.target).tank;
            _loc6_ = §+$%§.§?#T§(_loc3_.§package var true§);
            §+$%§.localToGlobal(_loc5_.§0"t§(),_loc6_);
            _loc7_ = _loc11_.§1"g§(_loc6_.distanceTo(this.§=#0§.§if package var§));
            _loc5_.§case extends§(_loc6_,§+$%§.§?#T§(_loc3_.direction),_loc10_ * _loc7_ * _loc3_.§case const case§);
         }
      }
   }
}

