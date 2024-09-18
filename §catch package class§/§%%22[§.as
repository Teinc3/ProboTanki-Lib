package §catch package class§
{
   import alternativa.tanks.model.friends.battleinvite.BattleInviteModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §%"[§ extends §return package if§
   {
      private var §5f§:BattleInviteModel;
      
      public var modelId:int;
      
      public function §%"[§()
      {
         super();
         this.modelId = 15;
         this.§5f§ = BattleInviteModel(modelRegistry.getModel(Long.getLong(0,300050004)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §while package use§.§4!q§:
               this.accepted(param1);
               break;
            case §while package use§.§;!K§:
               this.§`#%§(param1);
               break;
            case §while package use§.§3"$§:
               this.notify(param1);
               break;
            case §while package use§.§ X§:
               this.rejectedInvitationToBattleDisabled(param1);
               break;
            case §while package use§.§##[§:
               this.rejectedUserAlreadyInBattle(param1);
               break;
            case §while package use§.§+b§:
               this.rejected(param1);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         this.§5f§.putInitParams(param1.initParams);
         this.§5f§.objectLoaded();
      }
      
      private function accepted(param1:Object) : void
      {
         this.§5f§.accepted(param1.senderId);
      }
      
      private function rejected(param1:Object) : void
      {
         this.§5f§.rejected(param1.senderId);
      }
      
      private function notify(param1:Object) : void
      {
         this.§5f§.notify(param1.user,param1.data);
      }
      
      private function rejectedInvitationToBattleDisabled(param1:Object) : void
      {
         this.§5f§.rejectedInvitationToBattleDisabled(param1.user);
      }
      
      private function rejectedUserAlreadyInBattle(param1:Object) : void
      {
         this.§5f§.rejectedUserAlreadyInBattle(param1.user);
      }
   }
}

