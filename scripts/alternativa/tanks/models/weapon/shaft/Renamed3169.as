package alternativa.tanks.models.weapon.shaft
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.weapon.Renamed3046;
   import platform.client.fp10.core.registry.ModelRegistry;
   import Renamed79.Renamed80;
   import scpacker.tanks.WeaponsManager;
   
   public class Renamed3169 extends Renamed3046
   {
      public function Renamed3169(param1:ClientObject)
      {
         super(param1);
      }
      
      public function Renamed3159() : Renamed3160
      {
         var _loc1_:Renamed3161 = WeaponsManager.getShaftSFX(object);
         return _loc1_.Renamed3159(object);
      }
      
      public function laser() : Renamed80
      {
         return Renamed80(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModelsByInterface(Renamed80)[0]);
      }
   }
}

