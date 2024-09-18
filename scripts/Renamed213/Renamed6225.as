package Renamed213
{
   import Renamed37.Renamed38;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed6223 extends Renamed4886
   {
      private var Renamed120:Renamed38;
      
      public var modelId:int;
      
      public function Renamed6223()
      {
         super();
         this.modelId = 63;
         this.Renamed120 = Renamed38(modelRegistry.getModel(Long.getLong(759725658,1071543601)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6224.Renamed5161:
               this.Renamed5162();
         }
      }
      
      private function Renamed5162() : void
      {
         this.Renamed120.objectLoadedPost();
      }
   }
}

