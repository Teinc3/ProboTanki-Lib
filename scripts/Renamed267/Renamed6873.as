package Renamed267
{
   import alternativa.types.Long;
   import Renamed56.Renamed57;
   import Renamed385.Renamed4886;
   
   public class Renamed6868 extends Renamed4886
   {
      private var Renamed101:Renamed57;
      
      public var modelId:int;
      
      public function Renamed6868()
      {
         super();
         this.modelId = 54;
         this.Renamed101 = Renamed57(modelRegistry.getModel(Long.getLong(387277533,1853292335)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6869.Renamed6870:
               this.Renamed4934(param1);
               break;
            case Renamed6869.Renamed6871:
               this.fire(param1);
               break;
            case Renamed6869.Renamed6872:
               this.Renamed4935(param1);
         }
      }
      
      private function Renamed4934(param1:Object) : void
      {
         this.Renamed101.Renamed4934(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function fire(param1:Object) : void
      {
         this.Renamed101.fire(Renamed2775.Renamed695(param1.shooter),param1.staticHitPoint,param1.targets,param1.targetHitPoints);
      }
      
      private function Renamed4935(param1:Object) : void
      {
         this.Renamed101.Renamed4935(Renamed2775.Renamed695(param1.shooter));
      }
   }
}

