package Renamed388
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.models.weapon.Renamed3026;
   import Renamed54.Renamed55;
   import Renamed54.Renamed8398;
   import Renamed54.Renamed8399;
   import Renamed373.Renamed665;
   import Renamed373.Renamed606;
   import Renamed373.Renamed666;
   
   public class Renamed4685 extends Renamed8398 implements Renamed8399, Renamed5834
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed8400:Vector3 = new Vector3();
      
      private static const Renamed8401:Vector3 = new Vector3();
      
      private static const vector:Vector3 = new Vector3();
      
      private static const Renamed1299:RayHit = new RayHit();
      
      public function Renamed4685()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Renamed55 = getInitParam();
         var _loc3_:Renamed8391 = null;
         if(_loc2_ != null)
         {
            _loc3_ = new Renamed8391(Renamed668.Renamed674(_loc2_.radiusOfMaxSplashDamage),Renamed668.Renamed674(_loc2_.splashDamageRadius),_loc2_.minSplashDamagePercent,_loc2_.impactForce * Renamed3026.Renamed3028.getNumber());
         }
         param1.putParams(Renamed8391,_loc3_);
      }
      
      public function Renamed5838(param1:ClientObject, param2:Vector3, param3:Number, param4:Body) : Boolean
      {
         var _loc5_:Renamed606 = null;
         var _loc6_:Body = null;
         var _loc7_:Tank = null;
         var _loc8_:Vector3 = null;
         var _loc9_:Number = NaN;
         var _loc10_:Renamed8391 = Renamed8391(param1.getParams(Renamed8391));
         if(_loc10_ == null)
         {
            return false;
         }
         var _loc11_:Number = _loc10_.Renamed8395() * _loc10_.Renamed8395();
         var _loc12_:Renamed665 = battleService.Renamed619().Renamed692();
         for each(_loc5_ in _loc12_.getTankBodies())
         {
            _loc6_ = _loc5_.body;
            if((_loc7_ = _loc6_.tank).state == Renamed841.Renamed854 && _loc6_ != param4)
            {
               _loc8_ = _loc7_.Renamed696().state.position;
               Renamed8400.diff(_loc8_,param2);
               _loc9_ = Renamed8400.lengthSqr();
               if(_loc9_ <= _loc11_)
               {
                  if(!this.Renamed8402(_loc7_,param2))
                  {
                     Renamed8401.copy(Renamed8400);
                     Renamed8401.normalize();
                     _loc7_.Renamed1029(_loc7_.Renamed696().state.position,Renamed8401,param3 * _loc10_.Renamed3067(Math.sqrt(_loc9_)));
                  }
               }
            }
         }
         return true;
      }
      
      private function Renamed8402(param1:Tank, param2:Vector3) : Boolean
      {
         var _loc3_:Body = param1.Renamed696();
         var _loc4_:Number = 0.75 * param1.Renamed1015();
         return this.Renamed8403(param2,_loc3_,0) && this.Renamed8403(param2,_loc3_,-_loc4_) && this.Renamed8403(param2,_loc3_,_loc4_);
      }
      
      private function Renamed8403(param1:Vector3, param2:Body, param3:Number) : Boolean
      {
         vector.reset(0,param3,0);
         vector.transform3(param2.baseMatrix);
         vector.add(param2.state.position);
         vector.subtract(param1);
         var _loc4_:Renamed665 = battleService.Renamed619().Renamed692();
         return _loc4_.raycastStatic(param1,vector,Renamed666.Renamed690,1,null,Renamed1299);
      }
   }
}

