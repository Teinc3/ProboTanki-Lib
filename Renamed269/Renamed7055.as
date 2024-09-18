package Renamed1
{
   import Renamed602.Renamed603;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.utils.TextureMaterialRegistry;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed7055
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed1368:TextureMaterialRegistry;
      
      public function Renamed7055()
      {
         super();
      }
      
      public static function Renamed7056(param1:IGameObject, param2:int) : void
      {
      }
      
      public static function Renamed7057(param1:Renamed603, param2:int, param3:TextureMaterial) : void
      {
      }
      
      private static function Renamed7058(param1:Renamed603, param2:int) : void
      {
      }
      
      public static function Renamed694(param1:ClientObject) : Renamed603
      {
         var _loc2_:Renamed2408 = Renamed2408(OSGi.getInstance().getService(Renamed2408));
         var _loc3_:Tank = _loc2_.getTankData(param1).tank;
         var _loc4_:Object3D = _loc3_.Renamed1075().Renamed1020();
         return new Renamed603(_loc4_.x,_loc4_.y,_loc4_.z);
      }
   }
}

