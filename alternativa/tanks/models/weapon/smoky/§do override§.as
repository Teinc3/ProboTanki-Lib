package alternativa.tanks.models.weapon.smoky
{
   import §0#1§.§7§;
   import §0#1§.§try catch static§;
   import §4E§.§use var break§;
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
   import alternativa.tanks.battle.events.§,!7§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§case for null§;
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
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import alternativa.tanks.models.weapons.targeting.§#"1§;
   import alternativa.tanks.models.weapons.targeting.§implements set false§;
   import flash.utils.Dictionary;
   import §if package do§.§'!L§;
   import §if package do§.§?"0§;
   import scpacker.tanks.WeaponsManager;
   import §super var native§.§return for while§;
   
   public class §do override§ extends §7§ implements §try catch static§, §catch catch false§, §,v§, §throw package continue§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const §4P§:Number = 1000000;
      
      private var §"&§:§var use§;
      
      private var weapons:Dictionary;
      
      private var § "G§:Dictionary;
      
      private var §set var in§:§2#f§;
      
      public function §do override§()
      {
         this.weapons = new Dictionary();
         this.§ "G§ = new Dictionary();
         super();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§,!7§,this.§&!X§);
         this.§"&§.§#"<§(§case for null§,this.§1!%§);
         this.§"&§.§#"<§(§+#k§,this.§class var import§);
         this.§"&§.§throw var set§();
      }
      
      private static function §do final§(param1:ClientObject) : §'!L§
      {
         var _loc2_:§?"0§ = §?"0§(OSGi.getInstance().getService(§?"0§));
         return _loc2_.§each const false§(param1);
      }
      
      private static function §0!_§(param1:ClientObject) : §catch do§
      {
         var _loc2_:§'#B§ = §'#B§(modelRegistry.getModelsByInterface(§'#B§)[0]);
         return _loc2_.§final const dynamic§(param1);
      }
      
      private static function §continue for each§(param1:ClientObject) : §<"=§
      {
         var _loc2_:§use var break§ = WeaponsManager.getSmokySFX(param1);
         return _loc2_.§continue for each§(param1);
      }
      
      [Obfuscation(rename="false")]
      public function §'!V§(param1:ClientObject) : void
      {
         var _loc2_:§&A§ = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.§native const while§();
         }
      }
      
      [Obfuscation(rename="false")]
      public function §5";§(param1:ClientObject, param2:§#">§) : void
      {
         var _loc3_:§&A§ = this.weapons[param1];
         if(_loc3_ != null)
         {
            _loc3_.§true const final§(§+$%§.§?#T§(param2));
         }
      }
      
      [Obfuscation(rename="false")]
      public function §1$!§(param1:ClientObject, param2:ClientObject, param3:§#">§, param4:Number, param5:Boolean) : void
      {
         var _loc6_:Tank = null;
         var _loc7_:Vector3 = null;
         var _loc8_:§&A§ = this.weapons[param1];
         if(_loc8_ != null)
         {
            _loc6_ = this.§ "G§[param2];
            if(_loc6_ != null)
            {
               _loc7_ = §+$%§.§?#T§(param3);
               §+$%§.localToGlobal(_loc6_.§0"t§(),_loc7_);
               _loc8_.§'W§(_loc6_,_loc7_,param4,param5);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function §>"6§(param1:ClientObject) : void
      {
         var _loc2_:Tank = this.§ "G§[param1];
         this.§set var in§.§6i§(_loc2_.§0"t§().state.position);
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
         var _loc5_:§implements set false§ = new §#"1§(param1,_loc2_,§4P§);
         var _loc6_:§'!L§ = §do final§(_loc3_.turret);
         var _loc7_:§override var dynamic§ = new §override var dynamic§(_loc6_.§include package finally§(),_loc6_.§get package set§());
         this.§set var in§ = new §2#f§(_loc4_.§case catch set§.getInt(),_loc7_,_loc5_,§0!_§(_loc3_.turret),§continue for each§(param1),this,new §6#L§());
         this.weapons[param1] = this.§set var in§;
         return this.§set var in§;
      }
      
      public function §each package class§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc3_:§'!L§ = §do final§(_loc2_.turret);
         var _loc4_:§override var dynamic§ = new §override var dynamic§(_loc3_.§include package finally§(),_loc3_.§get package set§());
         var _loc5_:§4"3§ = new §&A§(_loc4_,§continue for each§(param1));
         this.weapons[param1] = _loc5_;
         return _loc5_;
      }
      
      public function §-!<§(param1:int) : void
      {
         server.§super var throw§(param1);
      }
      
      public function §else package override§(param1:int, param2:Vector3) : void
      {
         server.§catch const import§(param1,§+$%§.§,i§(param2));
      }
      
      public function §default set continue§(param1:int, param2:Vector3, param3:Body) : void
      {
         var _loc4_:Tank = param3.tank;
         var _loc5_:Vector3 = param2.clone();
         §+$%§.globalToLocal(param3,_loc5_);
         this.§"&§.dispatchEvent(§##a§.§const for use§);
         server.§class const include§(param1,_loc4_.§if for with§(),_loc4_.incarnation,§+$%§.§,i§(param3.state.position),§+$%§.§,i§(_loc5_),§+$%§.§,i§(param2));
      }
      
      private function §&!X§(param1:§,!7§) : void
      {
         this.§ "G§[param1.tank.tankData.user] = param1.tank;
      }
      
      private function §1!%§(param1:§case for null§) : void
      {
         delete this.§ "G§[param1.tank.tankData.user];
      }
      
      private function §class var import§(param1:§+#k§) : void
      {
         var _loc2_:§4"3§ = this.weapons[param1.tank.tankData.user];
         if(_loc2_ == this.§set var in§)
         {
            this.§set var in§ = null;
         }
         delete this.weapons[param1.tank.tankData.user];
      }
   }
}

