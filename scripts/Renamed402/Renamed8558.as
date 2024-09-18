package Renamed402
{
   import Renamed252.Renamed4473;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed8558 extends Renamed4886
   {
      private var Renamed8559:Renamed4473;
      
      public var modelId:int;
      
      public function Renamed8558()
      {
         super();
         this.modelId = 25;
         this.Renamed8559 = Renamed4473(modelRegistry.getModel(Long.getLong(2058573415,-746879275)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8560.Renamed5936:
               this.show(param1);
         }
      }
      
      private function show(param1:Object) : void
      {
         this.Renamed8559.show(param1.text);
      }
   }
}

