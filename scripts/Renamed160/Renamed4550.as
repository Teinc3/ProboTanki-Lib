package Renamed4548
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.Renamed2305;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.ISpace;
   
   public class Renamed4550 implements Renamed2305, AutoClosable
   {
      [Inject]
      public static var battleUserInfoService:BattleUserInfoService;
      
      [Inject]
      public static var Renamed2775:TankUsersRegistry;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      private var space:ISpace;
      
      public function Renamed4550(param1:ISpace)
      {
         super();
         this.space = param1;
         battleUserInfoService.Renamed2304(this);
      }
      
      public function Renamed2308(param1:String, param2:int) : void
      {
         var _loc3_:Tank = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTank(Renamed2775.Renamed695(param1));
         var _loc4_:Renamed4552 = Renamed4552(modelRegistry.getModelsByInterface(Renamed4552)[0]);
         _loc4_.Renamed5246(_loc3_,param2);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.space = null;
         battleUserInfoService.Renamed2306(this);
      }
      
      public function Renamed2307(param1:String, param2:String, param3:int, param4:Boolean) : void
      {
      }
      
      public function Renamed2309(param1:String, param2:Boolean) : void
      {
      }
   }
}

