package alternativa.tanks.models.weapon.machinegun
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.models.weapon.Renamed43;
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapons.targeting.Renamed3119;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import Renamed310.Renamed3120;
   import Renamed310.Renamed3121;
   import Renamed349.TargetHitInfo;
   import Renamed381.Renamed3045;
   import Renamed394.Renamed3074;
   import scpacker.tanks.WeaponsManager;
   import Renamed462.Renamed3122;
   import Renamed462.Renamed3075;
   
   public class Renamed44 extends Renamed3120 implements Renamed3121, Renamed43
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed2948:Number = 1000000;
      
      public function Renamed44()
      {
         super();
      }
      
      public function onStart(param1:ClientObject) : void
      {
         this.Renamed3123(param1).start();
      }
      
      public function Renamed3124(param1:ClientObject) : void
      {
         this.Renamed3123(param1).stop();
      }
      
      public function Renamed3125(param1:ClientObject, param2:Vector3, param3:Vector.<TargetHitInfo>) : void
      {
         this.Renamed3123(param1).Renamed3114(param2,param3);
      }
      
      public function Renamed2891(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed3046 = new Renamed3046(param1);
         var _loc3_:Renamed3045 = _loc2_.Renamed3055();
         var _loc4_:Renamed3071 = new Renamed3119(param1,_loc2_,Renamed2948);
         var _loc5_:Renamed3076 = new Renamed3076(_loc4_,param1,getInitParam(),this.Renamed3126(param1),_loc3_,Renamed3074(modelRegistry.getModelsByInterface(Renamed3074)[0]),param1);
         param1.putParams(Renamed3076,_loc5_);
         return _loc5_;
      }
      
      public function Renamed2892(param1:ClientObject) : Renamed990
      {
         var _loc2_:Renamed3046 = new Renamed3046(param1);
         var _loc3_:Renamed3045 = _loc2_.Renamed3055();
         var _loc4_:Renamed3106 = new Renamed3106(param1,getInitParam(),this.Renamed3126(param1),_loc3_);
         param1.putParams(Renamed3106,_loc4_);
         return _loc4_;
      }
      
      private function Renamed3126(param1:ClientObject) : Renamed3075
      {
         var _loc2_:Renamed3122 = WeaponsManager.Renamed3127(param1);
         return _loc2_.Renamed3126(param1);
      }
      
      private function Renamed3123(param1:ClientObject) : Renamed3106
      {
         return Renamed3106(param1.getParams(Renamed3106));
      }
   }
}

