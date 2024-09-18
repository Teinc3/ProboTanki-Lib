package §if try§
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import scpacker.networking.Network;
   
   public class §return package if§
   {
      protected var modelRegistry:ModelRegistry;
      
      protected var resourceRegistry:ResourceRegistry;
      
      protected var gameTypeRegistry:GameTypeRegistry;
      
      protected var spaceRegistry:SpaceRegistry;
      
      protected var network:Network;
      
      protected var §9#A§:TankUsersRegistry;
      
      public function §return package if§()
      {
         this.modelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.resourceRegistry = ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry));
         this.gameTypeRegistry = GameTypeRegistry(OSGi.getInstance().getService(GameTypeRegistry));
         this.spaceRegistry = SpaceRegistry(OSGi.getInstance().getService(SpaceRegistry));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.§9#A§ = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
         super();
      }
   }
}

