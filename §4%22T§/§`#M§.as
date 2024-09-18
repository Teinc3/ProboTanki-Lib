package §4"T§
{
   import alternativa.tanks.model.friends.loader.FriendsLoaderModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.FriendsModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.accepted.FriendsAcceptedModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.acceptednotificator.FriendsAcceptedNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incoming.FriendsIncomingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incomingnotificator.FriendsIncomingNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.outgoing.FriendsOutgoingModel;
   
   public class §`#M§ extends §return package if§
   {
      private var §package catch catch§:FriendsAcceptedModel;
      
      private var §9t§:FriendsAcceptedNotificatorModel;
      
      private var §return const set§:FriendsIncomingModel;
      
      private var §4O§:FriendsIncomingNotificatorModel;
      
      private var §continue var const§:FriendsOutgoingModel;
      
      private var §var set class§:FriendsModel;
      
      private var §5#>§:FriendsLoaderModel;
      
      public var modelId:int;
      
      public function §`#M§()
      {
         super();
         this.modelId = 13;
         this.§package catch catch§ = FriendsAcceptedModel(modelRegistry.getModel(Long.getLong(1696580544,685225790)));
         this.§9t§ = FriendsAcceptedNotificatorModel(modelRegistry.getModel(Long.getLong(100897389,708983546)));
         this.§return const set§ = FriendsIncomingModel(modelRegistry.getModel(Long.getLong(1552139010,1361964288)));
         this.§4O§ = FriendsIncomingNotificatorModel(modelRegistry.getModel(Long.getLong(1435596993,-649634714)));
         this.§continue var const§ = FriendsOutgoingModel(modelRegistry.getModel(Long.getLong(1522959740,-985374708)));
         this.§var set class§ = FriendsModel(modelRegistry.getModel(Long.getLong(1693173045,628784534)));
         this.§5#>§ = FriendsLoaderModel(modelRegistry.getModel(Long.getLong(0,300050023)));
         this.§var set class§.objectLoaded();
         this.§5#>§.objectLoadedPost();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §<"Y§.§[#j§:
               this.§0^§(param1);
               break;
            case §<"Y§.§super package final§:
               this.§+U§(param1);
               break;
            case §<"Y§.§1"d§:
               this.§]!K§(param1);
               break;
            case §<"Y§.§>"J§:
               this.§0"Y§(param1);
               break;
            case §<"Y§.§%!D§:
               this.alreadyInAcceptedFriends(param1);
               break;
            case §<"Y§.§import for extends§:
               this.alreadyInIncomingFriends(param1);
               break;
            case §<"Y§.§use include§:
               this.alreadyInOutgoingFriends(param1);
               break;
            case §<"Y§.§2"v§:
               this.§throw const get§(param1);
               break;
            case §<"Y§.§7#8§:
               this.§"A§(param1);
               break;
            case §<"Y§.§const catch use§:
               this.§ #F§(param1);
               break;
            case §<"Y§.§%#I§:
               this.removeNewAcceptedFriend(param1);
               break;
            case §<"Y§.§while for final§:
               this.removeNewIncomingFriend(param1);
               break;
            case §<"Y§.§5#?§:
               this.onUsersLoaded();
               break;
            case §<"Y§.§class with§:
               this.uidExist();
               break;
            case §<"Y§.§8X§:
               this.uidNotExist();
         }
      }
      
      private function §0^§(param1:Object) : void
      {
         this.§package catch catch§.putInitParams(param1.friendsAccepted);
         this.§package catch catch§.objectLoaded();
         this.§9t§.putInitParams(param1.friendsAcceptedNew);
         this.§9t§.objectLoaded();
         this.§return const set§.putInitParams(param1.friendsIncoming);
         this.§return const set§.objectLoaded();
         this.§4O§.putInitParams(param1.friendsIncomingNew);
         this.§4O§.objectLoaded();
         this.§continue var const§.putInitParams(param1.friendsOutgoing);
         this.§continue var const§.objectLoaded();
      }
      
      private function onUsersLoaded() : void
      {
         this.§5#>§.onUsersLoaded();
      }
      
      private function §+U§(param1:Object) : void
      {
         this.§continue var const§.onAdding(param1.user);
      }
      
      private function §]!K§(param1:Object) : void
      {
         this.§package catch catch§.onAdding(param1.user);
         this.§9t§.onAdding(param1.user);
         this.§4O§.onRemoved(param1.user);
      }
      
      private function §0"Y§(param1:Object) : void
      {
         this.§return const set§.onAdding(param1.user);
         this.§4O§.onAdding(param1.user);
      }
      
      private function alreadyInAcceptedFriends(param1:Object) : void
      {
         this.§var set class§.alreadyInAcceptedFriends(param1.userId);
      }
      
      private function alreadyInIncomingFriends(param1:Object) : void
      {
         this.§var set class§.alreadyInIncomingFriends(param1.userId,param1.userId);
      }
      
      private function alreadyInOutgoingFriends(param1:Object) : void
      {
         this.§var set class§.alreadyInOutgoingFriends(param1.userId);
      }
      
      private function §throw const get§(param1:Object) : void
      {
         this.§package catch catch§.onRemoved(param1.user);
         this.§9t§.onRemoved(param1.user);
      }
      
      private function § #F§(param1:Object) : void
      {
         this.§continue var const§.onRemoved(param1.user);
      }
      
      private function §"A§(param1:Object) : void
      {
         this.§return const set§.onRemoved(param1.user);
         this.§4O§.onRemoved(param1.user);
      }
      
      private function removeNewAcceptedFriend(param1:Object) : void
      {
         this.§9t§.onRemoved(param1.userId);
      }
      
      private function removeNewIncomingFriend(param1:Object) : void
      {
         this.§4O§.onRemoved(param1.userId);
      }
      
      private function uidExist() : void
      {
         this.§var set class§.uidExist();
      }
      
      private function uidNotExist() : void
      {
         this.§var set class§.uidNotExist();
      }
   }
}

