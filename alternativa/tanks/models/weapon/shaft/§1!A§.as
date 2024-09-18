package alternativa.tanks.models.weapon.shaft
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.weapon.§extends for final§;
   import platform.client.fp10.core.registry.ModelRegistry;
   import §return set use§.§6!g§;
   import scpacker.tanks.WeaponsManager;
   
   public class §1!A§ extends §extends for final§
   {
      public function §1!A§(param1:ClientObject)
      {
         super(param1);
      }
      
      public function §continue for each§() : §=#n§
      {
         var _loc1_:§var var with§ = WeaponsManager.getShaftSFX(object);
         return _loc1_.§continue for each§(object);
      }
      
      public function laser() : §6!g§
      {
         return §6!g§(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModelsByInterface(§6!g§)[0]);
      }
   }
}

