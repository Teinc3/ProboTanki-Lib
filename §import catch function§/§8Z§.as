package §import catch function§
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§continue var case§;
   import alternativa.tanks.models.weapon.§%"J§;
   import §catch var function§.§>@§;
   import §catch var function§.§@"#§;
   import §catch var function§.§import set case§;
   import §for set super§.§!"N§;
   import §for set super§.§=-§;
   import §for set super§.§super const continue§;
   
   public class §8Z§ extends §@"#§ implements §import set case§, §package const override§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §super set in§:Vector3 = new Vector3();
      
      private static const §4"u§:Vector3 = new Vector3();
      
      private static const vector:Vector3 = new Vector3();
      
      private static const §extends const default§:RayHit = new RayHit();
      
      public function §8Z§()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:§>@§ = getInitParam();
         var _loc3_:§+"!§ = null;
         if(_loc2_ != null)
         {
            _loc3_ = new §+"!§(§+$%§.§use final§(_loc2_.radiusOfMaxSplashDamage),§+$%§.§use final§(_loc2_.splashDamageRadius),_loc2_.minSplashDamagePercent,_loc2_.impactForce * §%"J§.§^"j§.getNumber());
         }
         param1.putParams(§+"!§,_loc3_);
      }
      
      public function §switch class§(param1:ClientObject, param2:Vector3, param3:Number, param4:Body) : Boolean
      {
         var _loc5_:§=-§ = null;
         var _loc6_:Body = null;
         var _loc7_:Tank = null;
         var _loc8_:Vector3 = null;
         var _loc9_:Number = NaN;
         var _loc10_:§+"!§ = §+"!§(param1.getParams(§+"!§));
         if(_loc10_ == null)
         {
            return false;
         }
         var _loc11_:Number = _loc10_.§?,§() * _loc10_.§?,§();
         var _loc12_:§!"N§ = battleService.§'x§().§const const true§();
         for each(_loc5_ in _loc12_.getTankBodies())
         {
            _loc6_ = _loc5_.body;
            if((_loc7_ = _loc6_.tank).state == §continue var case§.§?!S§ && _loc6_ != param4)
            {
               _loc8_ = _loc7_.§0"t§().state.position;
               §super set in§.diff(_loc8_,param2);
               _loc9_ = §super set in§.lengthSqr();
               if(_loc9_ <= _loc11_)
               {
                  if(!this.§continue package native§(_loc7_,param2))
                  {
                     §4"u§.copy(§super set in§);
                     §4"u§.normalize();
                     _loc7_.§case extends§(_loc7_.§0"t§().state.position,§4"u§,param3 * _loc10_.§include package finally§(Math.sqrt(_loc9_)));
                  }
               }
            }
         }
         return true;
      }
      
      private function §continue package native§(param1:Tank, param2:Vector3) : Boolean
      {
         var _loc3_:Body = param1.§0"t§();
         var _loc4_:Number = 0.75 * param1.§set const dynamic§();
         return this.§try set null§(param2,_loc3_,0) && this.§try set null§(param2,_loc3_,-_loc4_) && this.§try set null§(param2,_loc3_,_loc4_);
      }
      
      private function §try set null§(param1:Vector3, param2:Body, param3:Number) : Boolean
      {
         vector.reset(0,param3,0);
         vector.transform3(param2.baseMatrix);
         vector.add(param2.state.position);
         vector.subtract(param1);
         var _loc4_:§!"N§ = battleService.§'x§().§const const true§();
         return _loc4_.raycastStatic(param1,vector,§super const continue§.§finally catch while§,1,null,§extends const default§);
      }
   }
}

