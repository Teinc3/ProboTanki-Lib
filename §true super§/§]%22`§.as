package §true super§
{
   import alternativa.tanks.model.ChatModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §]"`§ extends §return package if§
   {
      private var §'!6§:ChatModel;
      
      public var modelId:int;
      
      public function §]"`§()
      {
         super();
         this.modelId = 28;
         this.§'!6§ = ChatModel(modelRegistry.getModel(Long.getLong(1413646454,-1397687631)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §catch for finally§.§;!K§:
               this.§`#%§(param1);
               break;
            case §catch for finally§.§=#8§:
               this.updateTypingSpeedAntifloodParams(param1);
               break;
            case §catch for finally§.§default package static§:
               this.showMessages(param1);
               break;
            case §catch for finally§.§super catch import§:
               this.cleanUsersMessages(param1);
               break;
            case §catch for finally§.§native for package§:
               this.§use set final§();
               break;
            case §catch for finally§.§4!U§:
               this.§8#j§(param1);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         this.§'!6§.putInitParams(param1.initParams);
         this.§'!6§.objectLoaded();
      }
      
      private function updateTypingSpeedAntifloodParams(param1:Object) : void
      {
         this.§'!6§.updateTypingSpeedAntifloodParams(param1.symbolCost,param1.enterCost);
      }
      
      private function showMessages(param1:Object) : void
      {
         this.§'!6§.showMessages(param1.messages);
      }
      
      private function cleanUsersMessages(param1:Object) : void
      {
         this.§'!6§.cleanUsersMessages(param1.uid);
      }
      
      private function §use set final§() : void
      {
         this.§'!6§.clearAllMessages();
      }
      
      private function §8#j§(param1:Object) : void
      {
         this.§'!6§.objectUnloaded();
      }
   }
}

