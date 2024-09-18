package §+!e§
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.§##a§;
   import alternativa.tanks.battle.events.§,!7§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§case for null§;
   import alternativa.tanks.battle.events.§const var finally§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §%#A§ implements AutoClosable, §throw package continue§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var §^#A§:Tank;
      
      private var §"&§:§var use§;
      
      public function §%#A§(param1:Tank)
      {
         super();
         this.§^#A§ = param1;
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§,!7§,this.§&!X§);
         this.§"&§.§#"<§(§case for null§,this.§1!%§);
         this.§"&§.§#"<§(§##a§,this.§true static§);
         this.§"&§.§#"<§(§const var finally§,this.§get const case§);
         this.§"&§.§throw var set§();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      private function §&!X§(param1:§,!7§) : void
      {
         var _loc2_:§2!s§ = null;
         if(param1.tank == this.§^#A§)
         {
            _loc2_ = §2!s§(OSGi.getInstance().getService(§finally var return§));
            _loc2_.§>#L§();
         }
      }
      
      private function §1!%§(param1:§case for null§) : void
      {
         var _loc2_:§2!s§ = null;
         if(param1.tank == this.§^#A§)
         {
            _loc2_ = §2!s§(OSGi.getInstance().getService(§finally var return§));
            _loc2_.§super package case§();
         }
      }
      
      private function §true static§(param1:§##a§) : void
      {
         var _loc2_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         _loc2_.§false set function§(param1.§default for import§);
      }
      
      private function §get const case§(param1:Object) : void
      {
         var _loc2_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         _loc2_.§super package case§();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§"&§.§#!V§();
         this.§"&§ = null;
         this.§^#A§ = null;
      }
   }
}

