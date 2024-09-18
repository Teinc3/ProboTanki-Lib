package §7"j§
{
   import §;"?§.§#">§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.utils.TextureMaterialRegistry;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §static catch true§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §@#R§:TextureMaterialRegistry;
      
      public function §static catch true§()
      {
         super();
      }
      
      public static function §%$§(param1:IGameObject, param2:int) : void
      {
      }
      
      public static function §catch set null§(param1:§#">§, param2:int, param3:TextureMaterial) : void
      {
      }
      
      private static function §for var default§(param1:§#">§, param2:int) : void
      {
      }
      
      public static function §case package§(param1:ClientObject) : §#">§
      {
         var _loc2_:§finally var return§ = §finally var return§(OSGi.getInstance().getService(§finally var return§));
         var _loc3_:Tank = _loc2_.getTankData(param1).tank;
         var _loc4_:Object3D = _loc3_.§in package default§().§2"F§();
         return new §#">§(_loc4_.x,_loc4_.y,_loc4_.z);
      }
   }
}

