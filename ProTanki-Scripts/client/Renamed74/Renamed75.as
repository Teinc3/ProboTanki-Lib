package Renamed74
{
   import Renamed602.3DPositionVector;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import Renamed349.Renamed8069;
   import Renamed349.Renamed4665;
   import Renamed349.TargetHitInfo;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   
   public class Renamed75 extends Renamed8069 implements Renamed4665, Renamed76
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      public function Renamed75()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3454(param1:ClientObject, param2:3DPositionVector, param3:Vector.<TargetHitInfo>) : void
      {
         var _loc4_:Renamed3436 = Renamed3436(object.event(Renamed3436));
         _loc4_.Renamed3444(param1,Renamed668.Renamed681(param2),param3);
      }
      
      public function Renamed3458(param1:int, param2:Vector3, param3:Vector.<Renamed667>) : void
      {
         battleEventDispatcher.dispatchEvent(Renamed869.Renamed871);
         server.Renamed3458(param1,Renamed668.Renamed677(param2),param3);
      }
      
      public function Renamed3459(param1:int, param2:Vector3) : void
      {
         battleEventDispatcher.dispatchEvent(Renamed869.Renamed871);
         server.Renamed3459(param1,Renamed668.Renamed677(param2));
      }
   }
}

