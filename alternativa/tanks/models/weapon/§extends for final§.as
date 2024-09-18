package alternativa.tanks.models.weapon
{
   import §=#M§.§'#B§;
   import §=#M§.§catch do§;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.models.tank.§finally var return§;
   import §if package do§.§'!L§;
   import §if package do§.§?"0§;
   import platform.client.fp10.core.registry.ModelRegistry;
   import scpacker.tanks.WeaponsManager;
   import §super var native§.§return for while§;
   
   public class §extends for final§
   {
      protected var remote:Boolean = false;
      
      protected var object:ClientObject;
      
      public function §extends for final§(param1:ClientObject)
      {
         super();
         this.object = param1;
      }
      
      public function §final each§() : §return for while§
      {
         return WeaponsManager.shotDatas[this.§get package break§().turret.id];
      }
      
      public function §package var false§() : int
      {
         var _loc1_:§return for while§ = WeaponsManager.shotDatas[this.§get package break§().turret.id];
         return _loc1_.§case catch set§.getInt();
      }
      
      public function §2!H§() : Number
      {
         var _loc1_:§return for while§ = WeaponsManager.shotDatas[this.§get package break§().turret.id];
         return _loc1_.§;#O§.getNumber();
      }
      
      public function §static var return§() : Number
      {
         var _loc1_:§return for while§ = WeaponsManager.shotDatas[this.§get package break§().turret.id];
         return _loc1_.§null const static§.getNumber();
      }
      
      public function §extends catch with§() : §'!L§
      {
         return this.§>!i§().§each const false§(this.§get package break§().turret);
      }
      
      public function §>!i§() : §?"0§
      {
         var _loc1_:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         return §?"0§(_loc1_.getModelsByInterface(§?"0§)[0]);
      }
      
      public function §use package dynamic§() : §catch do§
      {
         var _loc1_:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
         var _loc2_:§'#B§ = §'#B§(_loc1_.getModelsByInterface(§'#B§)[0]);
         return _loc2_.§final const dynamic§(this.§get package break§().turret);
      }
      
      public function §get package break§() : §7!9§
      {
         return §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(this.object);
      }
      
      public function §4>§(param1:ClientObject) : void
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
      
      public function §=! §() : void
      {
         this.remote = true;
      }
   }
}

