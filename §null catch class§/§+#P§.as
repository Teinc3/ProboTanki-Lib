package §null catch class§
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.servermodels.EntranceModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.loading.DispatcherModel;
   import scpacker.networking.protocol.§?"s§;
   import scpacker.server.models.locale.LocalizationLoader;
   import scpacker.utils.ResourcesLoader;
   
   public class §+#P§ extends §return package if§
   {
      private var §function package function§:DispatcherModel;
      
      private var §final catch super§:EntranceModel;
      
      private var §6!Z§:ResourcesLoader;
      
      private var §?"<§:LocalizationLoader;
      
      public var modelId:int;
      
      public function §+#P§()
      {
         this.§6!Z§ = new ResourcesLoader();
         this.§?"<§ = new LocalizationLoader();
         super();
         this.modelId = 4;
         this.§function package function§ = DispatcherModel(modelRegistry.getModel(Long.getLong(191355032,163351191)));
         this.§final catch super§ = EntranceModel(modelRegistry.getModel(Long.getLong(0,300020011)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §else var if§.§const const try§:
               this.§else for import§(param1);
               break;
            case §else var if§.§class package function§:
               this.loadDependencies(param1);
               break;
            case §else var if§.§1#K§:
               this.onResourceLoaded();
         }
      }
      
      private function loadDependencies(param1:Object) : void
      {
         this.§function package function§.loadDependencies(this.§6!Z§.makeDependencies(param1.json,param1.callbackId));
         Model.popObject();
      }
      
      private function onResourceLoaded() : void
      {
         Game.onResourceLoaded();
         this.§final catch super§.objectLoadedPost();
      }
      
      private function §else for import§(param1:Object) : void
      {
         §?"s§(OSGi.getInstance().getService(§?"s§)).hashReceived(param1.protectionData);
      }
   }
}

