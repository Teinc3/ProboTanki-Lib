package §class for§
{
   import § "u§.§7"R§;
   import § "u§.§in package try§;
   import § "u§.§static set class§;
   import §;"?§.§#">§;
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
   import alternativa.tanks.models.weapon.§override var dynamic§;
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import alternativa.tanks.models.weapons.targeting.§each with§;
   import alternativa.tanks.models.weapons.targeting.§implements set false§;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import flash.utils.Dictionary;
   import §if package do§.§'!L§;
   import §if package do§.§?"0§;
   import scpacker.tanks.WeaponsManager;
   import §super var native§.§return for while§;
   
   public class §each var var§ extends §7"R§ implements §static set class§, §catch catch false§, §throw package continue§, §[#f§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §9#A§:TankUsersRegistry;
      
      private var weapons:Dictionary;
      
      private var §!#W§:Dictionary;
      
      private var §"&§:§var use§;
      
      public function §each var var§()
      {
         this.weapons = new Dictionary();
         this.§!#W§ = new Dictionary();
         super();
         this.§use package const§();
      }
      
      private static function §do final§(param1:ClientObject) : §'!L§
      {
         var _loc2_:§?"0§ = §?"0§(OSGi.getInstance().getService(§?"0§));
         return _loc2_.§each const false§(param1);
      }
      
      private static function §continue for each§(param1:ClientObject) : §7#c§
      {
         var _loc2_:§`#3§ = WeaponsManager.getRailgunSFX(param1);
         return _loc2_.§continue for each§(param1);
      }
      
      private static function §native package final§(param1:Vector.<§#">§>) : Vector.<Vector3>
      {
         var _loc2_:Vector.<Vector3> = null;
         var _loc3_:int = 0;
         var _loc4_:§#">§ = null;
         if(param1 != null)
         {
            _loc2_ = new Vector.<Vector3>(param1.length);
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               _loc4_ = param1[_loc3_];
               if(!§+$%§.§@#z§(_loc4_))
               {
                  return null;
               }
               _loc2_[_loc3_] = §+$%§.§?#T§(_loc4_);
               _loc3_++;
            }
            return _loc2_;
         }
         return null;
      }
      
      private static function §!"5§(param1:Vector.<String>, param2:Dictionary) : Vector.<Body>
      {
         var _loc3_:Vector.<Body> = null;
         var _loc4_:int = 0;
         var _loc5_:Tank = null;
         if(param1 != null)
         {
            _loc3_ = new Vector.<Body>(param1.length);
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc5_ = param2[§9#A§.§if for with§(param1[_loc4_])];
               if(_loc5_ == null)
               {
                  _loc3_[_loc4_] = null;
               }
               else
               {
                  _loc3_[_loc4_] = _loc5_.§0"t§();
               }
               _loc4_++;
            }
            return _loc3_;
         }
         return null;
      }
      
      private function §use package const§() : void
      {
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§,!7§,this.§&!X§);
         this.§"&§.§#"<§(§case for null§,this.§1!%§);
         this.§"&§.§#"<§(§+#k§,this.§class var import§);
         this.§"&§.§throw var set§();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:§in package try§ = getInitParam();
         param1.putParams(§3!z§,new §3!z§(_loc2_.chargingTimeMsec,_loc2_.weakeningCoeff));
      }
      
      [Obfuscation(rename="false")]
      public function §override catch use§(param1:ClientObject) : void
      {
         var _loc2_:§9"@§ = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.§override catch use§();
         }
      }
      
      [Obfuscation(rename="false")]
      public function fire(param1:ClientObject, param2:§#">§, param3:Vector.<String>, param4:Vector.<§#">§>) : void
      {
         var _loc5_:Vector.<Vector3> = null;
         var _loc6_:Vector.<Body> = null;
         var _loc7_:int = 0;
         var _loc8_:Body = null;
         var _loc9_:§9"@§ = this.weapons[param1];
         if(_loc9_ != null)
         {
            _loc5_ = §native package final§(param4);
            if(_loc5_ != null)
            {
               _loc6_ = §!"5§(param3,this.§!#W§);
               if(param3 != null)
               {
                  if(param3.length == _loc5_.length)
                  {
                     _loc7_ = 0;
                     while(_loc7_ < param3.length)
                     {
                        _loc8_ = _loc6_[_loc7_];
                        if(_loc8_ != null && _loc8_.tank != null)
                        {
                           §+$%§.localToGlobal(_loc8_,_loc5_[_loc7_]);
                        }
                        _loc7_++;
                     }
                  }
                  else
                  {
                     param3 = null;
                     _loc5_ = null;
                  }
               }
            }
            _loc9_.fire(§+$%§.§'!d§(param2),_loc6_,_loc5_);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §false var each§(param1:ClientObject) : void
      {
         var _loc2_:§9"@§ = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.§false var each§();
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function §return package set§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc3_:§return for while§ = WeaponsManager.shotDatas[_loc2_.turret.id];
         var _loc4_:§'!L§ = §do final§(_loc2_.turret);
         var _loc5_:§3!z§ = §3!z§(_loc2_.turret.getParams(§3!z§));
         var _loc6_:§7#c§ = §continue for each§(param1);
         var _loc7_:§implements set false§ = new §each with§(param1,_loc2_.turret.id,_loc5_.§implements var get§());
         var _loc8_:§override var dynamic§ = new §override var dynamic§(_loc4_.§include package finally§(),_loc4_.§get package set§());
         var _loc9_:§4"3§ = new §class set with§(_loc7_,new §6#L§(),_loc3_.§case catch set§.getInt(),_loc8_,_loc5_.§implements var get§(),_loc5_.§-G§(),_loc6_,this);
         this.weapons[param1] = _loc9_;
         return _loc9_;
      }
      
      public function §each package class§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc3_:§'!L§ = §do final§(_loc2_.turret);
         var _loc4_:§3!z§ = §3!z§(_loc2_.turret.getParams(§3!z§));
         var _loc5_:§7#c§ = §continue for each§(param1);
         var _loc6_:§override var dynamic§ = new §override var dynamic§(_loc3_.§include package finally§(),_loc3_.§get package set§());
         var _loc7_:§4"3§ = new §9"@§(_loc6_,_loc4_,_loc5_);
         this.weapons[param1] = _loc7_;
         return _loc7_;
      }
      
      public function §%#$§(param1:int) : void
      {
         server.§0t§(param1);
      }
      
      public function §-!<§(param1:int, param2:Vector3, param3:Vector.<Body>, param4:Vector.<Vector3>) : void
      {
         var _loc5_:Vector.<String> = null;
         var _loc6_:Vector.<§#">§> = null;
         var _loc7_:Vector.<int> = null;
         var _loc8_:Vector.<§#">§> = null;
         var _loc9_:Vector.<§#">§> = null;
         var _loc10_:int = 0;
         var _loc11_:Body = null;
         var _loc12_:Vector3 = null;
         var _loc13_:Vector3 = null;
         var _loc14_:Tank = null;
         var _loc15_:int = int(param3.length);
         if(_loc15_ > 0)
         {
            _loc5_ = new Vector.<String>(_loc15_);
            _loc6_ = new Vector.<§#">§>(_loc15_);
            _loc7_ = new Vector.<int>(_loc15_);
            _loc8_ = new Vector.<§#">§>(_loc15_);
            _loc9_ = new Vector.<§#">§>(_loc15_);
            _loc10_ = 0;
            while(_loc10_ < _loc15_)
            {
               _loc11_ = param3[_loc10_];
               _loc12_ = param4[_loc10_];
               _loc13_ = new Vector3();
               _loc13_.copy(_loc12_);
               §+$%§.globalToLocal(_loc11_,_loc12_);
               _loc14_ = _loc11_.tank;
               _loc7_[_loc10_] = _loc14_.incarnation;
               _loc5_[_loc10_] = _loc14_.§if for with§().id;
               _loc6_[_loc10_] = §+$%§.§,i§(_loc12_);
               _loc8_[_loc10_] = §+$%§.§,i§(_loc11_.state.position);
               _loc9_[_loc10_] = §+$%§.§,i§(_loc13_);
               _loc10_++;
            }
         }
         var _loc16_:§#">§ = §+$%§.§throw catch with§(param2);
         this.§"&§.dispatchEvent(§##a§.§const for use§);
         server.§super var throw§(param1,_loc16_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function §return catch set§(param1:int) : void
      {
         server.§[r§(param1);
      }
      
      private function §&!X§(param1:§,!7§) : void
      {
         this.§!#W§[param1.tank.§if for with§()] = param1.tank;
      }
      
      private function §1!%§(param1:§case for null§) : void
      {
         delete this.§!#W§[param1.tank.§if for with§()];
      }
      
      private function §class var import§(param1:§+#k§) : void
      {
         delete this.§!#W§[param1.tank.§if for with§()];
      }
   }
}

