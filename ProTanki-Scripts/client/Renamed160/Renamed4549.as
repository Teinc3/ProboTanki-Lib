package Renamed4548
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.models.tank.Renamed2408;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed4549 implements Renamed511
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      private var user:ClientObject;
      
      private var rankIndex:int;
      
      public function Renamed4549(param1:ClientObject, param2:int)
      {
         super();
         this.user = param1;
         this.rankIndex = param2;
         battleEventDispatcher.Renamed539(Renamed884,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Renamed4552 = null;
         var _loc3_:Renamed884 = Renamed884(param1);
         var _loc4_:Renamed2408 = Renamed2408(OSGi.getInstance().getService(Renamed2408));
         if(_loc3_.tank == _loc4_.getTankData(this.user).tank)
         {
            _loc2_ = Renamed4552(modelRegistry.getModelsByInterface(Renamed4552)[0]);
            _loc2_.Renamed5246(_loc3_.tank,this.rankIndex);
            this.close();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.user = null;
         battleEventDispatcher.Renamed866(Renamed884,this);
      }
   }
}

