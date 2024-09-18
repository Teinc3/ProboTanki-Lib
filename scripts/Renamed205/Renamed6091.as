package Renamed205
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import Renamed450.Renamed4826;
   
   public class Renamed6091 extends Renamed4886
   {
      private var Renamed6092:Renamed4826;
      
      public var modelId:int;
      
      public function Renamed6091()
      {
         super();
         this.modelId = 75;
         this.Renamed6092 = Renamed4826(modelRegistry.getModel(Long.getLong(484417400,-1976122270)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6084.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed6084.Renamed6085:
               this.Renamed6093(param1);
               break;
            case Renamed6084.Renamed6087:
               this.Renamed6094(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed6092.putInitParams(param1.initParams);
         this.Renamed6092.objectLoaded();
      }
      
      private function Renamed6093(param1:Object) : void
      {
         this.Renamed6092.Renamed6093(param1.defaultCountryCode);
      }
      
      private function Renamed6094(param1:Object) : void
      {
         this.Renamed6092.Renamed6094();
      }
   }
}

