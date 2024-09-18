package §"$§
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.§,!7§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.models.tank.§finally var return§;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §[#D§ implements §throw package continue§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      private var user:ClientObject;
      
      private var rankIndex:int;
      
      public function §[#D§(param1:ClientObject, param2:int)
      {
         super();
         this.user = param1;
         this.rankIndex = param2;
         battleEventDispatcher.§set for each§(§,!7§,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:§import set class§ = null;
         var _loc3_:§,!7§ = §,!7§(param1);
         var _loc4_:§finally var return§ = §finally var return§(OSGi.getInstance().getService(§finally var return§));
         if(_loc3_.tank == _loc4_.getTankData(this.user).tank)
         {
            _loc2_ = §import set class§(modelRegistry.getModelsByInterface(§import set class§)[0]);
            _loc2_.§+>§(_loc3_.tank,this.rankIndex);
            this.close();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.user = null;
         battleEventDispatcher.§7!3§(§,!7§,this);
      }
   }
}

