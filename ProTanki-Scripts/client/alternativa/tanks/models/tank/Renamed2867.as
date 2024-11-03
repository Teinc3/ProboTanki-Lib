package alternativa.tanks.models.tank
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.Renamed886;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.objects.tank.Renamed1140;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed2867 implements AutoClosable, Renamed511
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var Renamed2369:ClientObject;
      
      public function Renamed2867(param1:ClientObject)
      {
         super();
         this.Renamed2369 = param1;
         battleEventDispatcher.Renamed539(Renamed886,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         _loc2_.Renamed2926();
         _loc2_.Renamed2886(this.Renamed2369,Renamed1140.ERROR);
         _loc2_.Renamed2898(this.Renamed2369).Renamed2713(Renamed1140.ERROR,false);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed2369 = null;
         battleEventDispatcher.Renamed866(Renamed886,this);
      }
   }
}

