package alternativa.tanks.models.weapon.machinegun
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.models.weapon.§catch catch false§;
   import alternativa.tanks.models.weapon.§extends for final§;
   import alternativa.tanks.models.weapons.targeting.§#"1§;
   import alternativa.tanks.models.weapons.targeting.§implements set false§;
   import §break const override§.§8"z§;
   import §break const override§.§use set false§;
   import §each throw§.§super set var§;
   import §if package do§.§'!L§;
   import §in package catch§.§+!Q§;
   import scpacker.tanks.WeaponsManager;
   import §with for class§.§implements var include§;
   import §with for class§.§null var§;
   
   public class §dynamic package false§ extends §8"z§ implements §use set false§, §catch catch false§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §]^§:Number = 1000000;
      
      public function §dynamic package false§()
      {
         super();
      }
      
      public function onStart(param1:ClientObject) : void
      {
         this.§continue var with§(param1).start();
      }
      
      public function §`#S§(param1:ClientObject) : void
      {
         this.§continue var with§(param1).stop();
      }
      
      public function §use catch catch§(param1:ClientObject, param2:Vector3, param3:Vector.<§super set var§>) : void
      {
         this.§continue var with§(param1).§>!p§(param2,param3);
      }
      
      public function §return package set§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§extends for final§ = new §extends for final§(param1);
         var _loc3_:§'!L§ = _loc2_.§extends catch with§();
         var _loc4_:§implements set false§ = new §#"1§(param1,_loc2_,§]^§);
         var _loc5_:§!n§ = new §!n§(_loc4_,param1,getInitParam(),this.§if var set§(param1),_loc3_,§+!Q§(modelRegistry.getModelsByInterface(§+!Q§)[0]),param1);
         param1.putParams(§!n§,_loc5_);
         return _loc5_;
      }
      
      public function §each package class§(param1:ClientObject) : §4"3§
      {
         var _loc2_:§extends for final§ = new §extends for final§(param1);
         var _loc3_:§'!L§ = _loc2_.§extends catch with§();
         var _loc4_:§6#-§ = new §6#-§(param1,getInitParam(),this.§if var set§(param1),_loc3_);
         param1.putParams(§6#-§,_loc4_);
         return _loc4_;
      }
      
      private function §if var set§(param1:ClientObject) : §null var§
      {
         var _loc2_:§implements var include§ = WeaponsManager.§-"]§(param1);
         return _loc2_.§if var set§(param1);
      }
      
      private function §continue var with§(param1:ClientObject) : §6#-§
      {
         return §6#-§(param1.getParams(§6#-§));
      }
   }
}

