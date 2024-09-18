package Renamed365
{
   import Renamed200.Renamed2746;
   import Renamed4619.Renamed5379;
   import Renamed4619.Renamed4620;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import Renamed329.Renamed7820;
   import Renamed359.Renamed5957;
   
   public class Renamed2766 extends Renamed5379 implements Renamed4620
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      public function Renamed2766()
      {
         super();
      }
      
      public function localTankLoaded(param1:ClientObject) : void
      {
         param1.putParams(Renamed2746,new Renamed2746(param1));
      }
      
      [Obfuscation(rename="false")]
      public function Renamed5386(param1:int) : void
      {
         battleEventDispatcher.dispatchEvent(new Renamed5957(param1));
      }
      
      [Obfuscation(rename="false")]
      public function Renamed2914(param1:ClientObject, param2:int) : void
      {
         var _loc3_:Renamed2407 = Renamed2407(modelRegistry.getModelsByInterface(Renamed2408)[0]);
         _loc3_.Renamed2914(param1,param2);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed8223(param1:ClientObject) : void
      {
         battleEventDispatcher.dispatchEvent(new Renamed7820(param1.id));
      }
   }
}

