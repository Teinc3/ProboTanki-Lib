package §while use§
{
   import §##Q§.§&H§;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §&"2§ extends §return package if§
   {
      private var §^",§:§&H§;
      
      public var modelId:int;
      
      public function §&"2§()
      {
         super();
         this.modelId = 40;
         this.§^",§ = §&H§(modelRegistry.getModel(Long.getLong(528941690,1765829096)));
         §9#A§ = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §static var else§.§1j§:
               this.suicide(param1);
         }
      }
      
      private function suicide(param1:Object) : void
      {
         this.§^",§.suicide(§9#A§.§if for with§(param1.tankId),param1.respawnDelay);
      }
   }
}

