package Renamed316
{
   import Renamed19.Renamed20;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed7671 extends Renamed4886
   {
      private var Renamed106:Renamed20;
      
      public var modelId:int;
      
      public function Renamed7671()
      {
         super();
         this.modelId = 52;
         this.Renamed106 = Renamed20(modelRegistry.getModel(Long.getLong(254322684,-956504003)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7672.Renamed7535:
               this.Renamed3454(param1);
               break;
            case Renamed7672.Renamed7533:
               this.Renamed3493(param1);
               break;
            case Renamed7672.Renamed7534:
               this.Renamed3494(param1);
         }
      }
      
      private function Renamed3454(param1:Object) : void
      {
         this.Renamed106.Renamed3454(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function Renamed3493(param1:Object) : void
      {
         this.Renamed106.Renamed3493(Renamed2775.Renamed695(param1.shooter),param1.hitPoint);
      }
      
      private function Renamed3494(param1:Object) : void
      {
         this.Renamed106.Renamed3494(Renamed2775.Renamed695(param1.shooter),Renamed2775.Renamed695(param1.target),param1.relativeHitPoint);
      }
   }
}

