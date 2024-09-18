package alternativa.tanks.models.tank
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.§8!k§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.objects.tank.§<"]§;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §while var final§ implements AutoClosable, §throw package continue§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var §^#A§:ClientObject;
      
      public function §while var final§(param1:ClientObject)
      {
         super();
         this.§^#A§ = param1;
         battleEventDispatcher.§set for each§(§8!k§,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         _loc2_.§super package case§();
         _loc2_.§else var try§(this.§^#A§,§<"]§.ERROR);
         _loc2_.§set set super§(this.§^#A§).§-!e§(§<"]§.ERROR,false);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§^#A§ = null;
         battleEventDispatcher.§7!3§(§8!k§,this);
      }
   }
}

