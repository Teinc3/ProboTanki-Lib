package Renamed468
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import Renamed70.Renamed71;
   
   public class Renamed9335 extends Renamed4886
   {
      private var Renamed104:Renamed71;
      
      public var modelId:int;
      
      public function Renamed9335()
      {
         super();
         this.modelId = 51;
         this.Renamed104 = Renamed71(modelRegistry.getModel(Long.getLong(1952266263,-1912192267)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9334.Renamed6871:
               this.fire(param1);
               break;
            case Renamed9334.Renamed6870:
               this.Renamed4934(param1);
         }
      }
      
      private function fire(param1:Object) : void
      {
         this.Renamed104.fire(Renamed2775.Renamed695(param1.shooter),param1.barrel,param1.shotId,param1.shotDirection);
      }
      
      private function Renamed4934(param1:Object) : void
      {
         this.Renamed104.Renamed4934(Renamed2775.Renamed695(param1.shooter),param1.barrel);
      }
   }
}

