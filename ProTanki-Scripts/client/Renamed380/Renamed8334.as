package Renamed380
{
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import platform.client.fp10.core.registry.ModelRegistry;
   import Renamed435.Renamed4841;
   
   public class Renamed8334
   {
      private static var modelRegistry:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      
      private var Renamed8335:Renamed4841;
      
      public var modelId:int;
      
      public function Renamed8334()
      {
         super();
         this.modelId = 2;
         this.Renamed8335 = Renamed4841(modelRegistry.getModel(Long.getLong(0,300020028)));
      }
      
      public function invoke(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:* = param1.getPacketId();
         switch(0)
         {
         }
      }
      
      private function serverHalt() : void
      {
         this.Renamed8335.serverHalt();
      }
   }
}

