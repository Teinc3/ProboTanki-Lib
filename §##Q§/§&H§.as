package §##Q§
{
   import §+!e§.§2c§;
   import §,b§.§final package final§;
   import §,b§.§switch catch extends§;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import §class catch import§.§,"V§;
   
   public class §&H§ extends §final package final§ implements §switch catch extends§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      public function §&H§()
      {
         super();
      }
      
      public function localTankLoaded(param1:Tank) : void
      {
         param1.§if for with§().putParams(§2c§,new §2c§(param1,server,10000));
      }
      
      [Obfuscation(rename="false")]
      public function suicide(param1:ClientObject, param2:int) : void
      {
         var _loc3_:§2!s§ = §2!s§(modelRegistry.getModelsByInterface(§finally var return§)[0]);
         _loc3_.§each for final§(param1,param2);
         battleEventDispatcher.dispatchEvent(new §,"V§(param1));
      }
   }
}

