package Renamed150
{
   import Renamed200.Renamed2748;
   import Renamed209.Renamed5079;
   import Renamed209.Renamed2752;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import Renamed329.Renamed5080;
   
   public class Renamed2745 extends Renamed5079 implements Renamed2752
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      public function Renamed2745()
      {
         super();
      }
      
      public function localTankLoaded(param1:Tank) : void
      {
         param1.Renamed695().putParams(Renamed2748,new Renamed2748(param1,server,10000));
      }
      
      [Obfuscation(rename="false")]
      public function suicide(param1:ClientObject, param2:int) : void
      {
         var _loc3_:Renamed2407 = Renamed2407(modelRegistry.getModelsByInterface(Renamed2408)[0]);
         _loc3_.Renamed2914(param1,param2);
         battleEventDispatcher.dispatchEvent(new Renamed5080(param1));
      }
   }
}

