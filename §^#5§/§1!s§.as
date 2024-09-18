package §^#5§
{
   import alternativa.tanks.model.socialnetwork.SocialNetworkPanelModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §1!s§ extends §return package if§
   {
      private var §each const set§:SocialNetworkPanelModel;
      
      public var modelId:int;
      
      public function §1!s§()
      {
         super();
         this.modelId = 22;
         this.§each const set§ = SocialNetworkPanelModel(modelRegistry.getModel(Long.getLong(0,300050062)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §else set var§.§;!K§:
               this.§`#%§(param1);
               break;
            case §else set var§.§+#S§:
               this.linkAlreadyExists(param1);
               break;
            case §else set var§.§4"^§:
               this.linkCreated(param1);
               break;
            case §else set var§.§use const catch§:
               this.unlinkSuccess(param1);
               break;
            case §else set var§.§package catch switch§:
               this.validationFailed();
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         this.§each const set§.putInitParams(param1.initParams);
         this.§each const set§.objectLoaded();
      }
      
      private function linkAlreadyExists(param1:Object) : void
      {
         this.§each const set§.linkAlreadyExists(param1.socialNetworkId);
      }
      
      private function linkCreated(param1:Object) : void
      {
         this.§each const set§.linkCreated(param1.socialNetworkId);
      }
      
      private function unlinkSuccess(param1:Object) : void
      {
         this.§each const set§.unlinkSuccess(param1.socialNetworkId);
      }
      
      private function validationFailed() : void
      {
         this.§each const set§.validationFailed();
      }
   }
}

