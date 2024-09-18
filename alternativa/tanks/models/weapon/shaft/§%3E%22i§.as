package alternativa.tanks.models.weapon.shaft
{
   import §;"?§.§#">§;
   import §=#M§.§'#B§;
   import §=#M§.§catch do§;
   import §]#R§.§else for include§;
   import §]#R§.§native var var§;
   import §]#R§.§switch var implements§;
   import §]#R§.§try set for§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
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
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§%"J§;
   import alternativa.tanks.models.weapon.§catch catch false§;
   import alternativa.tanks.models.weapon.§override var dynamic§;
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import alternativa.tanks.models.weapons.targeting.§each with§;
   import alternativa.tanks.models.weapons.targeting.§implements set false§;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.utils.Dictionary;
   import §if package do§.§'!L§;
   import §if package do§.§?"0§;
   import §return set use§.§6!g§;
   import scpacker.tanks.WeaponsManager;
   import §while const const§.§"!d§;
   import §while const const§.§^"x§;
   import §while const const§.§break var true§;
   
   public class §>"i§ extends §break var true§ implements §"!d§, §catch catch false§, §="D§, §throw package continue§, §native var var§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §9#A§:TankUsersRegistry;
      
      private static const §]^§:Number = 10000000000;
      
      private var §"&§:§var use§;
      
      private var §@y§:Dictionary;
      
      private var weapons:Dictionary;
      
      private var §^#A§:ClientObject;
      
      private var §!#W§:Dictionary;
      
      public function §>"i§()
      {
         this.§@y§ = new Dictionary();
         this.weapons = new Dictionary();
         this.§!#W§ = new Dictionary();
         super();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§,!7§,this.§if set try§);
         this.§"&§.§#"<§(§+#k§,this.§class var import§);
         this.§"&§.§#"<§(§case for null§,this.§1!%§);
         this.§"&§.§throw var set§();
      }
      
      private static function §0!_§(param1:ClientObject) : §catch do§
      {
         var _loc2_:§'#B§ = §'#B§(modelRegistry.getModelsByInterface(§'#B§)[0]);
         return _loc2_.§final const dynamic§(param1);
      }
      
      private static function §continue for each§(param1:ClientObject) : §=#n§
      {
         var _loc2_:§var var with§ = WeaponsManager.getShaftSFX(param1);
         return _loc2_.§continue for each§(param1);
      }
      
      private static function §@!%§(param1:Vector3, param2:Vector.<Body>, param3:Vector.<Vector3>) : §""x§
      {
         var _loc4_:Vector.<§#">§> = null;
         var _loc5_:Vector.<String> = null;
         var _loc6_:Vector.<int> = null;
         var _loc7_:Vector.<§#">§> = null;
         var _loc8_:Vector.<§#">§> = null;
         var _loc9_:uint = 0;
         var _loc10_:int = 0;
         var _loc11_:Body = null;
         var _loc12_:Tank = null;
         var _loc13_:Vector3 = null;
         if(param2 != null && param2.length > 0)
         {
            _loc9_ = param2.length;
            _loc4_ = new Vector.<§#">§>(_loc9_);
            _loc5_ = new Vector.<String>(_loc9_);
            _loc6_ = new Vector.<int>(_loc9_);
            _loc7_ = new Vector.<§#">§>(_loc9_);
            _loc8_ = new Vector.<§#">§>(_loc9_);
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               _loc11_ = param2[_loc10_];
               _loc12_ = Tank(_loc11_.tank);
               _loc6_[_loc10_] = _loc12_.incarnation;
               _loc5_[_loc10_] = _loc12_.§if for with§().id;
               _loc13_ = param3[_loc10_];
               _loc8_[_loc10_] = §+$%§.§,i§(_loc13_);
               §+$%§.globalToLocal(_loc11_,_loc13_);
               _loc4_[_loc10_] = §+$%§.§,i§(_loc13_);
               _loc7_[_loc10_] = §+$%§.§,i§(_loc11_.state.position);
               _loc10_++;
            }
         }
         return new §""x§(§+$%§.§throw catch with§(param1),_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:§^"x§ = getInitParam();
         _loc2_.§]<§ = §+$%§.§use final§(_loc2_.§]<§);
         _loc2_.§8l§ = §+$%§.§use final§(_loc2_.§8l§);
         param1.putParams(§^"x§,_loc2_);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      [Obfuscation(rename="false")]
      public function §static set const§(param1:ClientObject) : void
      {
         var _loc2_:§+!9§ = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.§dynamic package extends§();
         }
      }
      
      [Obfuscation(rename="false")]
      public function fire(param1:ClientObject, param2:§#">§, param3:Vector.<String>, param4:Vector.<§#">§>, param5:Number) : void
      {
         var _loc6_:Vector.<Vector3> = null;
         var _loc7_:Vector.<Body> = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:ClientObject = null;
         var _loc11_:Tank = null;
         var _loc12_:§+!9§ = this.weapons[param1];
         if(_loc12_ != null)
         {
            _loc12_.§dynamic package extends§();
            if(param3 != null)
            {
               _loc8_ = int(param4.length);
               _loc6_ = new Vector.<Vector3>(_loc8_);
               _loc7_ = new Vector.<Body>(_loc8_);
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc10_ = §9#A§.§if for with§(param3[_loc9_]);
                  _loc11_ = this.§!#W§[_loc10_];
                  if(_loc11_ == null)
                  {
                     _loc7_[_loc9_] = null;
                  }
                  else
                  {
                     _loc7_[_loc9_] = _loc11_.§0"t§();
                     _loc6_[_loc9_] = §+$%§.§?#T§(param4[_loc9_]);
                     §+$%§.localToGlobal(_loc11_.§0"t§(),_loc6_[_loc9_]);
                  }
                  _loc9_++;
               }
            }
            _loc12_.§var case§(§+$%§.§'!d§(param2),_loc7_,_loc6_,param5);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §1!f§(param1:ClientObject) : void
      {
         var _loc2_:§+!9§ = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.§+!4§();
         }
      }
      
      public function §return package set§(param1:ClientObject) : §4"3§
      {
         this.§^#A§ = param1;
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc3_:§^"x§ = _loc2_.turret.getParams(§^"x§) as §^"x§;
         var _loc4_:§?"0§ = §?"0§(OSGi.getInstance().getService(§?"0§));
         var _loc5_:§'!L§ = _loc4_.§each const false§(_loc2_.turret);
         var _loc6_:§6#L§ = new §6#L§();
         var _loc7_:§1!A§ = new §1!A§(param1);
         var _loc8_:§implements set false§ = new §each with§(param1,_loc2_.turret.id,_loc3_.weakeningCoeff);
         var _loc9_:§override var dynamic§ = new §override var dynamic§(_loc3_.aimingImpact * §%"J§.§^"j§.getNumber(),_loc5_.§get package set§());
         var _loc10_:§4"3§ = new §finally native§(_loc7_,battleService,battleEventDispatcher,this,_loc3_,_loc9_,_loc6_,this.§@y§,§else for include§(_loc4_.§class catch false§(_loc2_)),_loc8_,§0!_§(_loc2_.turret));
         this.weapons[param1] = _loc10_;
         return _loc10_;
      }
      
      public function §each package class§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc3_:§^"x§ = _loc2_.turret.getParams(§^"x§) as §^"x§;
         var _loc4_:§?"0§ = §?"0§(OSGi.getInstance().getService(§?"0§));
         var _loc5_:§'!L§ = _loc4_.§each const false§(_loc2_.turret);
         var _loc6_:§=#n§ = §continue for each§(param1);
         var _loc7_:§try set for§ = param1.getParams(§try set for§) as §try set for§;
         var _loc8_:TankSpecification = _loc2_.§import extends§;
         var _loc9_:§4"3§ = new §+!9§(_loc5_.§include package finally§(),_loc3_,_loc6_,_loc7_,_loc8_);
         this.weapons[param1] = _loc9_;
         return _loc9_;
      }
      
      public function §while const static§(param1:int, param2:Vector3, param3:Vector.<Body>, param4:Vector.<Vector3>) : void
      {
         var _loc5_:§""x§ = §@!%§(param2,param3,param4);
         this.§"&§.dispatchEvent(§##a§.§const for use§);
         server.§4!"§(param1,_loc5_.staticHitPoint,_loc5_.tanks,_loc5_.§class package const§,_loc5_.§<"_§,_loc5_.§#'§,_loc5_.§break const break§);
      }
      
      public function §!"n§(param1:int, param2:Vector3, param3:Vector.<Body>, param4:Vector.<Vector3>) : void
      {
         var _loc5_:§""x§ = §@!%§(param2,param3,param4);
         this.§"&§.dispatchEvent(§##a§.§const for use§);
         server.§`2§(param1,_loc5_.staticHitPoint,_loc5_.tanks,_loc5_.§class package const§,_loc5_.§<"_§,_loc5_.§#'§,_loc5_.§break const break§);
      }
      
      public function §throw var import§(param1:int) : void
      {
         server.§in package dynamic§(param1);
      }
      
      public function §,"$§() : void
      {
         server.§while package final§();
      }
      
      public function §3!!§(param1:int) : void
      {
         server.§static var try§(param1);
      }
      
      private function §if set try§(param1:§,!7§) : void
      {
         this.§59§(param1.tank);
         this.§!#W§[param1.tank.§if for with§()] = param1.tank;
      }
      
      private function §59§(param1:Tank) : void
      {
         var _loc2_:§false catch set§ = param1.§in package default§();
         this.§@y§[_loc2_.§7!T§()] = param1;
         this.§@y§[_loc2_.§2"F§()] = param1;
      }
      
      private function §class var import§(param1:§+#k§) : void
      {
         var _loc2_:ClientObject = param1.tank.§if for with§();
         if(_loc2_ == this.§^#A§)
         {
            this.§^#A§ = null;
         }
         delete this.weapons[_loc2_];
      }
      
      private function §1!%§(param1:§case for null§) : void
      {
         delete this.§!#W§[param1.tank.§if for with§()];
         this.§return var throw§(param1.tank.§in package default§());
      }
      
      private function §return var throw§(param1:§false catch set§) : void
      {
         delete this.§@y§[param1.§7!T§()];
         delete this.§@y§[param1.§2"F§()];
      }
      
      public function §#"3§() : void
      {
      }
      
      public function createLocalTurretController(param1:§try set for§, param2:§7!9§) : §switch var implements§
      {
         var _loc3_:§^"x§ = param2.turret.getParams(§^"x§) as §^"x§;
         var _loc4_:uint = §6!g§(modelRegistry.getModelsByInterface(§6!g§)[0]).getLaserPointerRedColor(param2.turret);
         var _loc5_:§9#D§ = new §9#D§(_loc3_.§in for default§,_loc4_);
         return new §else for include§(param1,_loc5_,_loc3_.§continue var true§);
      }
   }
}

