package Renamed400
{
   import alternativa.types.Long;
   import Renamed50.Renamed51;
   import Renamed385.Renamed4886;
   
   public class Renamed8549 extends Renamed4886
   {
      private var Renamed8550:Renamed51;
      
      public var modelId:int;
      
      public function Renamed8549()
      {
         super();
         this.modelId = 55;
         this.Renamed8550 = Renamed51(modelRegistry.getModel(Long.getLong(1645686167,1474428435)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8534.Renamed8541:
               this.Renamed7205(param1);
               break;
            case Renamed8534.Renamed8537:
               this.Renamed1554(param1);
               break;
            case Renamed8534.Renamed8540:
               this.Renamed8551(param1);
         }
      }
      
      private function Renamed7205(param1:Object) : void
      {
         this.Renamed8550.Renamed7205(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function Renamed1554(param1:Object) : void
      {
         this.Renamed8550.Renamed1554(Renamed2775.Renamed695(param1.shooter),param1.state,param1.hit);
      }
      
      private function Renamed8551(param1:Object) : void
      {
         this.Renamed8550.Renamed8551(Renamed2775.Renamed695(param1.shooter));
      }
   }
}

