package Renamed299
{
   import Renamed41.Renamed42;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed7454 extends Renamed4886
   {
      private var Renamed7455:Renamed42;
      
      public var modelId:int;
      
      public function Renamed7454()
      {
         super();
         this.modelId = 47;
         this.Renamed7455 = Renamed42(modelRegistry.getModel(Long.getLong(756280393,-1366394900)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7456.Renamed7457:
               this.Renamed5925(param1);
         }
      }
      
      public function Renamed5925(param1:Object) : void
      {
         this.Renamed7455.Renamed5925(param1.damages);
      }
   }
}

