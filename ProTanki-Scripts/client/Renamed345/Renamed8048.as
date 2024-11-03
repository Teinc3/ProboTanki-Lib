package Renamed345
{
   import Renamed27.Renamed28;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed8045 extends Renamed4886
   {
      private var Renamed8046:Renamed28;
      
      public var modelId:int;
      
      public function Renamed8045()
      {
         super();
         this.Renamed8046 = Renamed28(modelRegistry.getModel(Long.getLong(747925004,799189270)));
         this.modelId = 46;
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8047.Renamed6820:
               this.Renamed3830(param1);
         }
      }
      
      private function Renamed3830(param1:Object) : void
      {
         this.Renamed8046.Renamed3830(param1.serverSessionTime,param1.clientPing);
      }
   }
}

