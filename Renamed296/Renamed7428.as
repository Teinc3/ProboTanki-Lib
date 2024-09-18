package Renamed7427
{
   import Renamed270.Renamed4474;
   import Renamed270.Renamed4475;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed7428 extends Renamed4886
   {
      private var Renamed7429:Renamed4475;
      
      private var Renamed7430:Renamed4474;
      
      public var modelId:int;
      
      public function Renamed7428()
      {
         super();
         this.modelId = 73;
         this.Renamed7429 = Renamed4475(modelRegistry.getModel(Long.getLong(113911774,-312236140)));
         this.Renamed7430 = Renamed4474(modelRegistry.getModel(Long.getLong(1948776499,1322947449)));
         this.Renamed7430.objectLoaded();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7431.Renamed5161:
               this.Renamed5162(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed7429.putInitParams(param1.initParams);
         this.Renamed7429.objectLoaded();
      }
   }
}

