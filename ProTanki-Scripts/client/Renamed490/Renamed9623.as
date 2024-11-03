package Renamed490
{
   import alternativa.tanks.model.socialnetwork.SocialNetworkPanelModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed9623 extends Renamed4886
   {
      private var Renamed9624:SocialNetworkPanelModel;
      
      public var modelId:int;
      
      public function Renamed9623()
      {
         super();
         this.modelId = 22;
         this.Renamed9624 = SocialNetworkPanelModel(modelRegistry.getModel(Long.getLong(0,300050062)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9625.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed9625.Renamed4892:
               this.linkAlreadyExists(param1);
               break;
            case Renamed9625.Renamed9626:
               this.linkCreated(param1);
               break;
            case Renamed9625.Renamed9627:
               this.unlinkSuccess(param1);
               break;
            case Renamed9625.Renamed4893:
               this.validationFailed();
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed9624.putInitParams(param1.initParams);
         this.Renamed9624.objectLoaded();
      }
      
      private function linkAlreadyExists(param1:Object) : void
      {
         this.Renamed9624.linkAlreadyExists(param1.socialNetworkId);
      }
      
      private function linkCreated(param1:Object) : void
      {
         this.Renamed9624.linkCreated(param1.socialNetworkId);
      }
      
      private function unlinkSuccess(param1:Object) : void
      {
         this.Renamed9624.unlinkSuccess(param1.socialNetworkId);
      }
      
      private function validationFailed() : void
      {
         this.Renamed9624.validationFailed();
      }
   }
}

