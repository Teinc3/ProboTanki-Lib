package alternativa.tanks.models.weapon
{
   import Renamed301.Renamed3043;
   import Renamed301.Renamed3044;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed2408;
   import Renamed381.Renamed3045;
   import Renamed381.Renamed2768;
   import platform.client.fp10.core.registry.ModelRegistry;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   
   public class Renamed3046
   {
      protected var remote:Boolean = false;
      
      protected var object:ClientObject;
      
      public function Renamed3046(param1:ClientObject)
      {
         super();
         this.object = param1;
      }
      
      public function Renamed3047() : Renamed86
      {
         return WeaponsManager.shotDatas[this.Renamed3048().turret.id];
      }
      
      public function Renamed3049() : int
      {
         var _loc1_:Renamed86 = WeaponsManager.shotDatas[this.Renamed3048().turret.id];
         return _loc1_.Renamed3050.getInt();
      }
      
      public function Renamed3051() : Number
      {
         var _loc1_:Renamed86 = WeaponsManager.shotDatas[this.Renamed3048().turret.id];
         return _loc1_.Renamed3052.getNumber();
      }
      
      public function Renamed3053() : Number
      {
         var _loc1_:Renamed86 = WeaponsManager.shotDatas[this.Renamed3048().turret.id];
         return _loc1_.Renamed3054.getNumber();
      }
      
      public function Renamed3055() : Renamed3045
      {
         return this.Renamed3056().Renamed3057(this.Renamed3048().turret);
      }
      
      public function Renamed3056() : Renamed2768
      {
         var _loc1_:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         return Renamed2768(_loc1_.getModelsByInterface(Renamed2768)[0]);
      }
      
      public function Renamed3058() : Renamed3044
      {
         var _loc1_:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
         var _loc2_:Renamed3043 = Renamed3043(_loc1_.getModelsByInterface(Renamed3043)[0]);
         return _loc2_.Renamed3059(this.Renamed3048().turret);
      }
      
      public function Renamed3048() : Renamed775
      {
         return Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(this.object);
      }
      
      public function Renamed3060(param1:ClientObject) : void
      {
         this.object = param1;
      }
      
      public function getObject() : ClientObject
      {
         return this.object;
      }
      
      public function isAlive() : Boolean
      {
         return true;
      }
      
      public function isLocal() : Boolean
      {
         return !this.remote;
      }
      
      public function Renamed3061() : void
      {
         this.remote = true;
      }
   }
}

