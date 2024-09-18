package §use catch dynamic§
{
   import alternativa.tanks.models.battle.gui.chat.ChatModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §package super§ extends §return package if§
   {
      private var §'!6§:ChatModel;
      
      public var modelId:int;
      
      public function §package super§()
      {
         super();
         this.modelId = 61;
         this.§'!6§ = ChatModel(modelRegistry.getModel(Long.getLong(1896886505,1439133662)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §catch catch function§.§final with§:
               this.addMessage(param1);
               break;
            case §catch catch function§.§3"U§:
               this.§native set else§(param1);
               break;
            case §catch catch function§.§^!a§:
               this.§use package throw§(param1);
               break;
            case §catch catch function§.§override for catch§:
               this.§native include§(param1);
               break;
            case §catch catch function§.§;!K§:
               this.§`#%§();
               break;
            case §catch catch function§.§?#c§:
               this.§0"'§(param1);
         }
      }
      
      private function addMessage(param1:Object) : void
      {
         this.§'!6§.addMessage(param1.userId,param1.message,param1.team);
      }
      
      private function §native set else§(param1:Object) : void
      {
         this.§'!6§.§native set else§(param1.uid,param1.message);
      }
      
      private function §use package throw§(param1:Object) : void
      {
         this.§'!6§.§use package throw§(param1.message);
      }
      
      private function §native include§(param1:Object) : void
      {
         this.§'!6§.§native include§(param1.userId,param1.message,param1.team);
      }
      
      private function §`#%§() : void
      {
         this.§'!6§.objectLoaded();
      }
      
      private function §0"'§(param1:Object) : void
      {
         this.§'!6§.§0"'§(param1.header);
      }
   }
}

