package Renamed394
{
   import Renamed602.3DPositionVector;
   import Renamed489.Renamed8460;
   import Renamed489.Renamed8461;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.objects.tank.Tank;
   import Renamed349.TargetHitInfo;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   
   public class Renamed4690 extends Renamed8461 implements Renamed8460, Renamed3074
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      public function Renamed4690()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function startFire() : void
      {
         this.Renamed8462().onStart();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed4862() : void
      {
         this.Renamed8462().Renamed3124();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3114(param1:3DPositionVector, param2:Vector.<TargetHitInfo>) : void
      {
         this.Renamed8462().Renamed3125(Renamed668.Renamed681(param1),param2);
      }
      
      public function Renamed3088(param1:int) : void
      {
         server.startFire(param1);
      }
      
      public function Renamed3097(param1:int, param2:Vector3, param3:Tank, param4:Vector3) : void
      {
         this.Renamed8463(param1,param2,this.Renamed8464(param3,param4));
      }
      
      public function Renamed8463(param1:int, param2:Vector3, param3:Vector.<Renamed667>) : void
      {
         battleEventDispatcher.dispatchEvent(Renamed869.Renamed871);
         server.Renamed3114(param1,Renamed668.Renamed677(param2),param3);
      }
      
      public function Renamed3098(param1:int, param2:Vector3) : void
      {
         battleEventDispatcher.dispatchEvent(Renamed869.Renamed871);
         server.Renamed8465(param1,Renamed668.Renamed677(param2));
      }
      
      public function Renamed3089(param1:int) : void
      {
         server.Renamed4862(param1);
      }
      
      private function Renamed8462() : Renamed4691
      {
         return Renamed4691(object.event(Renamed4691));
      }
      
      private function Renamed8464(param1:Tank, param2:Vector3) : Vector.<Renamed667>
      {
         var _loc4_:Renamed667 = null;
         var _loc3_:Vector.<Renamed667> = new Vector.<Renamed667>();
         if(param1 != null)
         {
            (_loc4_ = Renamed668.Renamed694(param1)).localHitPoint = Renamed668.Renamed678(param2);
            _loc3_.push(_loc4_);
         }
         return _loc3_;
      }
   }
}

