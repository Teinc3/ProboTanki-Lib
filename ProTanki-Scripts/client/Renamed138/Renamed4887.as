package Renamed4292
{
   import alternativa.tanks.servermodels.socialnetwork.ExternalEntranceModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.client.entrance.model.entrance.externalentrance.Renamed4290;
   
   public class Renamed4887 extends Renamed4886
   {
      private var Renamed4888:ExternalEntranceModel;
      
      public var modelId:int;
      
      public function Renamed4887()
      {
         super();
         this.modelId = 3;
         this.Renamed4888 = ExternalEntranceModel(modelRegistry.getModel(Long.getLong(0,300020013)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed4889.Renamed4890:
               this.Renamed4891(param1);
               break;
            case Renamed4889.Renamed4892:
               this.linkAlreadyExists();
               break;
            case Renamed4889.Renamed4893:
               this.validationFailed();
               break;
            case Renamed4889.Renamed4894:
               this.validationSuccess();
         }
      }
      
      private function Renamed4891(param1:Object) : void
      {
         this.Renamed4888.putInitParams(new Renamed4290(param1.socialNetworkParams));
         this.Renamed4888.objectLoaded();
      }
      
      private function validationSuccess() : void
      {
         this.Renamed4888.validationSuccess();
      }
      
      private function validationFailed() : void
      {
         this.Renamed4888.validationFailed();
      }
      
      private function linkAlreadyExists() : void
      {
         this.Renamed4888.linkAlreadyExists();
      }
      
      private function wrongPassword() : void
      {
         this.Renamed4888.wrongPassword();
      }
   }
}

