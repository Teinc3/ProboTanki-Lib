package Renamed469
{
   import alternativa.types.Long;
   import Renamed48.Renamed49;
   import Renamed385.Renamed4886;
   
   public class Renamed9340 extends Renamed4886
   {
      private var Renamed9341:Renamed49;
      
      public var modelId:int;
      
      public function Renamed9340()
      {
         super();
         this.modelId = 56;
         this.Renamed9341 = Renamed49(modelRegistry.getModel(Long.getLong(2120141642,699496177)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9338.Renamed9084:
               this.startFire(param1);
               break;
            case Renamed9338.Renamed9085:
               this.Renamed4862(param1);
         }
      }
      
      private function startFire(param1:Object) : void
      {
         this.Renamed9341.startFire(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function Renamed4862(param1:Object) : void
      {
         this.Renamed9341.Renamed4862(Renamed2775.Renamed695(param1.shooter));
      }
   }
}

