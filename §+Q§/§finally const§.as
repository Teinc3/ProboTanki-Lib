package §+Q§
{
   import §;"?§.§#">§;
   import §=#M§.§'#B§;
   import §=#M§.§catch do§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§##a§;
   import alternativa.tanks.battle.events.§+#k§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§catch catch false§;
   import alternativa.tanks.models.weapon.§extends for final§;
   import alternativa.tanks.models.weapon.§override var dynamic§;
   import alternativa.tanks.models.weapons.targeting.§#"1§;
   import alternativa.tanks.models.weapons.targeting.§implements set false§;
   import §catch set dynamic§.§@!Z§;
   import §catch set dynamic§.§in const dynamic§;
   import §catch var function§.§>@§;
   import flash.utils.Dictionary;
   import §if package do§.§'!L§;
   import §if package do§.§?"0§;
   import §import catch function§.§8Z§;
   import scpacker.tanks.WeaponsManager;
   import §super var native§.§return for while§;
   
   public class §finally const§ extends §in const dynamic§ implements §@!Z§, §catch catch false§, §throw package continue§, §<#f§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const §]^§:Number = 1000000;
      
      private var weapons:Dictionary;
      
      private var §"&§:§var use§;
      
      public function §finally const§()
      {
         this.weapons = new Dictionary();
         super();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§+#k§,this.§class var import§);
         this.§"&§.§throw var set§();
      }
      
      private static function §each const false§(param1:ClientObject) : §'!L§
      {
         var _loc2_:§?"0§ = §?"0§(OSGi.getInstance().getService(§?"0§));
         return _loc2_.§each const false§(param1);
      }
      
      private static function §0!_§(param1:ClientObject) : §catch do§
      {
         var _loc2_:§'#B§ = §'#B§(modelRegistry.getModelsByInterface(§'#B§)[0]);
         return _loc2_.§final const dynamic§(param1);
      }
      
      private static function §continue for each§(param1:ClientObject) : §7#'§
      {
         var _loc2_:§40§ = WeaponsManager.getThunderSFX(param1);
         return _loc2_.§continue for each§(param1);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function §return package set§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§extends for final§ = new §extends for final§(param1);
         var _loc3_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc4_:§return for while§ = WeaponsManager.shotDatas[_loc3_.turret.id];
         var _loc5_:§'!L§ = §each const false§(_loc3_.turret);
         var _loc6_:§catch do§ = §0!_§(_loc3_.turret);
         var _loc7_:§8Z§ = new §8Z§();
         _loc7_.putInitParams(§>@§(_loc3_.turret.getParams(§>@§)));
         _loc7_.objectLoaded(_loc3_.turret);
         var _loc8_:§7#'§ = §continue for each§(param1);
         var _loc9_:§implements set false§ = new §#"1§(param1,_loc2_,§]^§);
         var _loc10_:§override var dynamic§ = new §override var dynamic§(_loc5_.§include package finally§(),_loc5_.§get package set§());
         var _loc11_:§4"3§ = new §8#J§(_loc4_.§case catch set§.getInt(),_loc10_,_loc6_,_loc9_,_loc7_,_loc8_,this);
         this.weapons[param1] = _loc11_;
         return _loc11_;
      }
      
      public function §each package class§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc3_:§'!L§ = §each const false§(_loc2_.turret);
         var _loc4_:§catch do§ = §0!_§(_loc2_.turret);
         var _loc5_:§7#'§ = §continue for each§(param1);
         var _loc6_:§8Z§ = new §8Z§();
         _loc6_.putInitParams(§>@§(_loc2_.turret.getParams(§>@§)));
         _loc6_.objectLoaded(_loc2_.turret);
         var _loc7_:§override var dynamic§ = new §override var dynamic§(_loc3_.§include package finally§(),_loc3_.§get package set§());
         var _loc8_:§4"3§ = new §package package dynamic§(_loc7_,_loc4_,_loc6_,_loc5_);
         this.weapons[param1] = _loc8_;
         return _loc8_;
      }
      
      private function §class var import§(param1:§+#k§) : void
      {
         delete this.weapons[param1.tank.§if for with§()];
      }
      
      [Obfuscation(rename="false")]
      public function §'!V§(param1:ClientObject) : void
      {
         var _loc2_:§package package dynamic§ = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.§'!V§();
         }
      }
      
      [Obfuscation(rename="false")]
      public function §5";§(param1:ClientObject, param2:§#">§) : void
      {
         var _loc3_:§package package dynamic§ = this.weapons[param1];
         if(_loc3_ != null)
         {
            _loc3_.§5";§(§+$%§.§?#T§(param2));
         }
      }
      
      [Obfuscation(rename="false")]
      public function §1$!§(param1:ClientObject, param2:ClientObject, param3:§#">§) : void
      {
         var _loc4_:§finally var return§ = null;
         var _loc5_:Tank = null;
         var _loc6_:Vector3 = null;
         var _loc7_:§package package dynamic§ = this.weapons[param1];
         if(_loc7_ != null)
         {
            _loc4_ = §2!s§(OSGi.getInstance().getService(§finally var return§));
            if((_loc5_ = _loc4_.getTankData(param2).tank).§0"t§() != null)
            {
               _loc6_ = §+$%§.§?#T§(param3);
               §+$%§.localToGlobal(_loc5_.§0"t§(),_loc6_);
               _loc7_.§1$!§(_loc5_,_loc6_);
            }
         }
      }
      
      public function §-!<§(param1:int) : void
      {
         server.§native package while§(param1);
      }
      
      public function §else package override§(param1:int, param2:Vector3) : void
      {
         this.§"&§.dispatchEvent(§##a§.§const for use§);
         server.§function set continue§(param1,§+$%§.§,i§(param2));
      }
      
      public function §default set continue§(param1:int, param2:Vector3, param3:Body) : void
      {
         var _loc4_:Vector3 = param2.clone();
         §+$%§.globalToLocal(param3,_loc4_);
         var _loc5_:§#">§ = §+$%§.§,i§(_loc4_);
         var _loc6_:Tank = param3.tank;
         var _loc7_:int = _loc6_.incarnation;
         var _loc8_:§#">§ = §+$%§.§,i§(param3.state.position);
         this.§"&§.dispatchEvent(§##a§.§const for use§);
         server.§0!2§(param1,_loc5_,_loc6_.§if for with§(),_loc7_,_loc8_,§+$%§.§,i§(param2));
      }
   }
}

