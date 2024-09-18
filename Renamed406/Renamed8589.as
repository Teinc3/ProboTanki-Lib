package Renamed406
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.servermodels.EntranceModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import platform.client.fp10.core.model.impl.Model;
   import platform.loading.DispatcherModel;
   import scpacker.networking.protocol.Renamed536;
   import scpacker.server.models.locale.LocalizationLoader;
   import scpacker.utils.ResourcesLoader;
   
   public class Renamed8589 extends Renamed4886
   {
      private var Renamed8590:DispatcherModel;
      
      private var Renamed5655:EntranceModel;
      
      private var Renamed8591:ResourcesLoader;
      
      private var Renamed8592:LocalizationLoader;
      
      public var modelId:int;
      
      public function Renamed8589()
      {
         this.Renamed8591 = new ResourcesLoader();
         this.Renamed8592 = new LocalizationLoader();
         super();
         this.modelId = 4;
         this.Renamed8590 = DispatcherModel(modelRegistry.getModel(Long.getLong(191355032,163351191)));
         this.Renamed5655 = EntranceModel(modelRegistry.getModel(Long.getLong(0,300020011)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8593.Renamed8594:
               this.Renamed8595(param1);
               break;
            case Renamed8593.Renamed8596:
               this.loadDependencies(param1);
               break;
            case Renamed8593.Renamed8597:
               this.onResourceLoaded();
         }
      }
      
      private function loadDependencies(param1:Object) : void
      {
         this.Renamed8590.loadDependencies(this.Renamed8591.makeDependencies(param1.json,param1.callbackId));
         Model.popObject();
      }
      
      private function onResourceLoaded() : void
      {
         Game.onResourceLoaded();
         this.Renamed5655.objectLoadedPost();
      }
      
      private function Renamed8595(param1:Object) : void
      {
         Renamed536(OSGi.getInstance().getService(Renamed536)).hashReceived(param1.protectionData);
      }
   }
}

