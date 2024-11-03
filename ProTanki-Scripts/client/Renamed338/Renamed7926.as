package Renamed338
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import Renamed395.Renamed4822;
   
   public class Renamed7926 extends Renamed4886
   {
      private var Renamed7927:Renamed4822;
      
      public var modelId:int;
      
      public function Renamed7926()
      {
         super();
         this.modelId = 20;
         this.Renamed7927 = Renamed4822(modelRegistry.getModel(Long.getLong(432617209,-1426923357)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7923.Renamed7924:
               this.Renamed7826(param1);
         }
      }
      
      private function Renamed7826(param1:Object) : void
      {
         this.Renamed7927.Renamed7826(param1.weeklyQuestReward);
      }
   }
}

