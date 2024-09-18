package Renamed495
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import Renamed72.Renamed73;
   
   public class Renamed9660 extends Renamed4886
   {
      private var Renamed103:Renamed73;
      
      public var modelId:int;
      
      public function Renamed9660()
      {
         super();
         this.modelId = 57;
         this.Renamed103 = Renamed73(modelRegistry.getModel(Long.getLong(1034700989,1212373553)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9661.Renamed9084:
               this.startFire(param1);
               break;
            case Renamed9661.Renamed9085:
               this.Renamed4862(param1);
         }
      }
      
      private function startFire(param1:Object) : void
      {
         this.Renamed103.startFire(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function Renamed4862(param1:Object) : void
      {
         this.Renamed103.Renamed4862(Renamed2775.Renamed695(param1.shooter));
      }
   }
}

