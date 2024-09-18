package §false const case§
{
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
   import flash.utils.Dictionary;
   import scpacker.tanks.WeaponsManager;
   import §use var final§.§4#m§;
   import §use var final§.§implements each§;
   import §use var final§.§set const final§;
   
   public class §'!U§ extends §4#m§ implements §set const final§, §catch catch false§, §throw native§, §throw package continue§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private var §"&§:§var use§;
      
      private var weapons:Dictionary;
      
      public function §'!U§()
      {
         this.weapons = new Dictionary();
         super();
         this.§use package const§();
      }
      
      private static function §do extends§(param1:Number) : Number
      {
         return param1 * 32767;
      }
      
      private static function §extends catch for§(param1:Number) : Number
      {
         return param1 / 32767;
      }
      
      private static function §continue for each§(param1:ClientObject) : § #K§
      {
         return WeaponsManager.getRicochetSFXModel(param1);
      }
      
      private function §use package const§() : void
      {
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§+#k§,this.§class var import§);
         this.§"&§.§throw var set§();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      [Obfuscation(rename="false")]
      public function fire(param1:ClientObject, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:§for var each§ = this.weapons[param1];
         if(_loc5_ != null)
         {
            shotDirection.reset(§extends catch for§(param2),§extends catch for§(param3),§extends catch for§(param4)).normalize();
            _loc5_.§'!V§(shotDirection);
         }
      }
      
      [Obfuscation(rename="false")]
      public function §false var each§(param1:ClientObject) : void
      {
         var _loc2_:§for var each§ = this.weapons[param1];
         if(_loc2_ != null)
         {
            _loc2_.§5"[§();
         }
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:§implements each§ = getInitParam();
         _loc2_.shellRadius = §+$%§.§use final§(_loc2_.shellRadius);
         _loc2_.shellSpeed = §+$%§.§use final§(_loc2_.shellSpeed);
         _loc2_.shotDistance = §+$%§.§use final§(_loc2_.shotDistance);
         param1.putParams(§implements each§,_loc2_);
      }
      
      public function §return package set§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc3_:§4"3§ = new §,y§(param1,_loc2_.turret.getParams(§implements each§) as §implements each§,§continue for each§(param1),this);
         this.weapons[param1] = _loc3_;
         return _loc3_;
      }
      
      public function §each package class§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc3_:§4"3§ = new §for var each§(param1,_loc2_.turret.getParams(§implements each§) as §implements each§,§continue for each§(param1));
         this.weapons[param1] = _loc3_;
         return _loc3_;
      }
      
      public function §-!<§(param1:int, param2:int, param3:Vector3) : void
      {
         if(battleService.§each set use§())
         {
            this.§"&§.dispatchEvent(§##a§.§const for use§);
            server.§super var throw§(param1,param2,§do extends§(param3.x),§do extends§(param3.y),§do extends§(param3.z));
         }
      }
      
      public function §`#Q§(param1:int) : void
      {
         if(battleService.§each set use§())
         {
            this.§"&§.dispatchEvent(§##a§.§const for use§);
            server.§[r§(param1);
         }
      }
      
      public function §=#e§(param1:int, param2:Body, param3:Vector.<Vector3>) : void
      {
         var _loc4_:Tank = null;
         if(battleService.§each set use§())
         {
            _loc4_ = param2.tank;
            server.§1b§(battleService.§]"d§(),_loc4_.§if for with§(),param1,§+$%§.§,i§(param2.state.position),§+$%§.§const package with§(param3));
         }
      }
      
      public function §dynamic var const§(param1:int, param2:Vector.<Vector3>) : void
      {
         if(battleService.§each set use§())
         {
            server.§if for continue§(battleService.§]"d§(),param1,§+$%§.§const package with§(param2));
         }
      }
      
      private function §class var import§(param1:§+#k§) : void
      {
         delete this.weapons[param1.tank.§if for with§()];
      }
   }
}

