package Renamed262
{
   import alternativa.types.Long;
   import Renamed370.Renamed4678;
   import Renamed385.Renamed4886;
   
   public class Renamed6822 extends Renamed4886
   {
      private var Renamed6823:Renamed4678;
      
      public var modelId:int;
      
      public function Renamed6822()
      {
         super();
         this.modelId = 45;
         this.Renamed6823 = Renamed4678(modelRegistry.getModel(Long.getLong(121770418,618912707)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6819.Renamed6820:
               this.Renamed3830();
         }
      }
      
      private function Renamed3830() : void
      {
         this.Renamed6823.Renamed3830();
      }
   }
}

