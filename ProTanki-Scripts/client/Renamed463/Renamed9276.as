package Renamed463
{
   import alternativa.types.Long;
   import Renamed365.Renamed2766;
   import Renamed385.Renamed4886;
   
   public class Renamed9276 extends Renamed4886
   {
      private var Renamed9277:Renamed2766;
      
      public var modelId:int;
      
      public function Renamed9276()
      {
         super();
         this.modelId = 59;
         this.Renamed9277 = Renamed2766(modelRegistry.getModel(Long.getLong(1286074115,-176946994)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9270.Renamed9272:
               this.Renamed2914(param1);
               break;
            case Renamed9270.Renamed9273:
               this.Renamed5386(param1);
               break;
            case Renamed9270.Renamed9271:
               this.Renamed8223(param1);
         }
      }
      
      private function Renamed2914(param1:Object) : void
      {
         this.Renamed9277.Renamed2914(Renamed2775.Renamed695(param1.tank),param1.respawnDelay);
      }
      
      private function Renamed5386(param1:Object) : void
      {
         this.Renamed9277.Renamed5386(param1.suicideDelayMS);
      }
      
      private function Renamed8223(param1:Object) : void
      {
         this.Renamed9277.Renamed8223(Renamed2775.Renamed695(param1.tank));
      }
   }
}

