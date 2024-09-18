package §"$§
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.§ #^§;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.ISpace;
   
   public class §do set switch§ implements § #^§, AutoClosable
   {
      [Inject]
      public static var battleUserInfoService:BattleUserInfoService;
      
      [Inject]
      public static var §9#A§:TankUsersRegistry;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      private var space:ISpace;
      
      public function §do set switch§(param1:ISpace)
      {
         super();
         this.space = param1;
         battleUserInfoService.§catch for with§(this);
      }
      
      public function §,4§(param1:String, param2:int) : void
      {
         var _loc3_:Tank = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTank(§9#A§.§if for with§(param1));
         var _loc4_:§import set class§ = §import set class§(modelRegistry.getModelsByInterface(§import set class§)[0]);
         _loc4_.§+>§(_loc3_,param2);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.space = null;
         battleUserInfoService.§8"J§(this);
      }
      
      public function §^!=§(param1:String, param2:String, param3:int, param4:Boolean) : void
      {
      }
      
      public function §!D§(param1:String, param2:Boolean) : void
      {
      }
   }
}

