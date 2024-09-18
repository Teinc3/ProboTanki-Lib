package §case include§
{
   import §;"?§.§#">§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§##a§;
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
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import §each throw§.§super set var§;
   import flash.utils.Dictionary;
   import scpacker.tanks.WeaponsManager;
   import §set break§.§%§;
   import §set break§.§^z§;
   import §set break§.§else package finally§;
   import §set break§.§try var finally§;
   
   public class §case native§ extends §%#0§ implements §^z§, §throw package continue§, §catch catch false§, §include set class§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var §@!c§:Vector3;
      
      private var §package var true§:§#">§;
      
      private var § "G§:Dictionary;
      
      private var §"&§:§var use§;
      
      public function §case native§()
      {
         this.§@!c§ = new Vector3();
         this.§package var true§ = new §#">§();
         this.§ "G§ = new Dictionary();
         super();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§,!7§,this.§&!X§);
         this.§"&§.§#"<§(§case for null§,this.§1!%§);
         this.§"&§.§throw var set§();
      }
      
      private static function §continue for each§(param1:ClientObject) : §finally set if§
      {
         var _loc2_:§!!U§ = WeaponsManager.getIsidaSFX(param1);
         return _loc2_.§else const const§(param1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:§else package finally§ = getInitParam();
         _loc2_.radius = §+$%§.§use final§(_loc2_.radius);
         param1.putParams(§else package finally§,_loc2_);
      }
      
      [Obfuscation(rename="false")]
      public function §return const do§(param1:ClientObject, param2:§try var finally§, param3:§super set var§) : void
      {
         this.§^">§(param1,param2,param3);
      }
      
      [Obfuscation(rename="false")]
      public function §;_§(param1:ClientObject) : void
      {
         var _loc2_:§for var native§ = this.§dynamic for finally§(param1);
         if(_loc2_ != null)
         {
            _loc2_.stop();
         }
      }
      
      [Obfuscation(rename="false")]
      public function §implements package for§(param1:ClientObject) : void
      {
         var _loc2_:§for var native§ = this.§dynamic for finally§(param1);
         _loc2_.§implements package for§();
      }
      
      public function §return package set§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§7!9§ = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1);
         var _loc3_:§finally set if§ = §continue for each§(param1);
         return new §@@§(param1,_loc2_.turret.getParams(§else package finally§) as §else package finally§,new §6#L§(),_loc3_,this);
      }
      
      public function §each package class§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§4"3§ = new §for var native§(§continue for each§(param1));
         param1.putParams(§for var native§,_loc2_);
         return _loc2_;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function §`#9§(param1:int, param2:RayHit) : void
      {
         var _loc3_:Body = null;
         var _loc4_:Tank = null;
         if(param2 != null)
         {
            _loc3_ = param2.shape.body;
            _loc4_ = _loc3_.tank;
            _loc4_.§final set const§(param2.position);
            server.§return const do§(param1,_loc4_.§if for with§(),_loc4_.incarnation,this.§with set import§(param2));
         }
         else
         {
            server.§implements package for§(param1);
         }
      }
      
      public function stop(param1:int) : void
      {
         server.§5#v§(param1);
      }
      
      public function onTick(param1:int, param2:RayHit) : void
      {
         this.§"&§.dispatchEvent(§##a§.§const for use§);
         var _loc3_:Body = param2.shape.body;
         var _loc4_:Tank = _loc3_.tank;
         server.§'3§(param1,_loc4_.incarnation,§+$%§.§,i§(_loc3_.state.position),this.§with set import§(param2));
      }
      
      private function §^">§(param1:ClientObject, param2:§try var finally§, param3:§super set var§) : void
      {
         var _loc4_:Tank = null;
         var _loc5_:Vector3 = null;
         var _loc6_:§#">§ = null;
         var _loc7_:§for var native§ = this.§dynamic for finally§(param1);
         if(_loc7_ != null)
         {
            if(param2 != §try var finally§.IDLE)
            {
               if(param3 != null && param3.target != null)
               {
                  _loc4_ = this.§ "G§[param3.target.id];
               }
            }
            if(param2 == §try var finally§.IDLE || _loc4_ != null)
            {
               _loc5_ = this.§@!c§;
               _loc6_ = param3.§package var true§;
               _loc5_.reset(_loc6_.x,_loc6_.y,_loc6_.z);
               _loc7_.§override var try§(param2,_loc4_,_loc5_);
            }
            else
            {
               _loc7_.stop();
            }
         }
      }
      
      private function §with set import§(param1:RayHit) : §#">§
      {
         var _loc2_:Body = param1.shape.body;
         var _loc3_:Vector3 = §+$%§.§@!c§;
         _loc3_.copy(param1.position);
         §+$%§.globalToLocal(_loc2_,_loc3_);
         §+$%§.§default var super§(_loc3_,this.§package var true§);
         return this.§package var true§;
      }
      
      private function §&!X§(param1:§,!7§) : void
      {
         this.§ "G§[param1.tank.§if for with§().id] = param1.tank;
      }
      
      private function §1!%§(param1:§case for null§) : void
      {
         delete this.§ "G§[param1.tank.§if for with§().id];
      }
      
      private function §dynamic for finally§(param1:ClientObject) : §for var native§
      {
         return §for var native§(param1.getParams(§for var native§));
      }
   }
}

