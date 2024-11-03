package Renamed196
{
   import Renamed29.Renamed30;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed5933 extends Renamed4886
   {
      private var Renamed119:Renamed30;
      
      public var modelId:int;
      
      public function Renamed5933()
      {
         super();
         this.modelId = 64;
         this.Renamed119 = Renamed30(modelRegistry.getModel(Long.getLong(815932807,-684891581)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed5931.Renamed5161:
               this.Renamed5162();
         }
      }
      
      private function Renamed5162() : void
      {
         this.Renamed119.objectLoadedPost();
      }
   }
}

