package Renamed4426
{
   import alternativa.tanks.model.friends.loader.FriendsLoaderModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.FriendsModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.accepted.FriendsAcceptedModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.acceptednotificator.FriendsAcceptedNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incoming.FriendsIncomingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incomingnotificator.FriendsIncomingNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.outgoing.FriendsOutgoingModel;
   
   public class Renamed6699 extends Renamed4886
   {
      private var Renamed6700:FriendsAcceptedModel;
      
      private var Renamed6701:FriendsAcceptedNotificatorModel;
      
      private var Renamed6702:FriendsIncomingModel;
      
      private var Renamed6703:FriendsIncomingNotificatorModel;
      
      private var Renamed6704:FriendsOutgoingModel;
      
      private var Renamed6705:FriendsModel;
      
      private var Renamed6706:FriendsLoaderModel;
      
      public var modelId:int;
      
      public function Renamed6699()
      {
         super();
         this.modelId = 13;
         this.Renamed6700 = FriendsAcceptedModel(modelRegistry.getModel(Long.getLong(1696580544,685225790)));
         this.Renamed6701 = FriendsAcceptedNotificatorModel(modelRegistry.getModel(Long.getLong(100897389,708983546)));
         this.Renamed6702 = FriendsIncomingModel(modelRegistry.getModel(Long.getLong(1552139010,1361964288)));
         this.Renamed6703 = FriendsIncomingNotificatorModel(modelRegistry.getModel(Long.getLong(1435596993,-649634714)));
         this.Renamed6704 = FriendsOutgoingModel(modelRegistry.getModel(Long.getLong(1522959740,-985374708)));
         this.Renamed6705 = FriendsModel(modelRegistry.getModel(Long.getLong(1693173045,628784534)));
         this.Renamed6706 = FriendsLoaderModel(modelRegistry.getModel(Long.getLong(0,300050023)));
         this.Renamed6705.objectLoaded();
         this.Renamed6706.objectLoadedPost();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6651.Renamed6670:
               this.Renamed6707(param1);
               break;
            case Renamed6651.Renamed6676:
               this.Renamed6708(param1);
               break;
            case Renamed6651.Renamed6663:
               this.Renamed6709(param1);
               break;
            case Renamed6651.Renamed6667:
               this.Renamed6710(param1);
               break;
            case Renamed6651.Renamed6665:
               this.alreadyInAcceptedFriends(param1);
               break;
            case Renamed6651.Renamed6672:
               this.alreadyInIncomingFriends(param1);
               break;
            case Renamed6651.Renamed6656:
               this.alreadyInOutgoingFriends(param1);
               break;
            case Renamed6651.Renamed6652:
               this.Renamed6711(param1);
               break;
            case Renamed6651.Renamed6673:
               this.Renamed6712(param1);
               break;
            case Renamed6651.Renamed6675:
               this.Renamed6713(param1);
               break;
            case Renamed6651.Renamed6671:
               this.removeNewAcceptedFriend(param1);
               break;
            case Renamed6651.Renamed6654:
               this.removeNewIncomingFriend(param1);
               break;
            case Renamed6651.Renamed6661:
               this.onUsersLoaded();
               break;
            case Renamed6651.Renamed6664:
               this.uidExist();
               break;
            case Renamed6651.Renamed6657:
               this.uidNotExist();
         }
      }
      
      private function Renamed6707(param1:Object) : void
      {
         this.Renamed6700.putInitParams(param1.friendsAccepted);
         this.Renamed6700.objectLoaded();
         this.Renamed6701.putInitParams(param1.friendsAcceptedNew);
         this.Renamed6701.objectLoaded();
         this.Renamed6702.putInitParams(param1.friendsIncoming);
         this.Renamed6702.objectLoaded();
         this.Renamed6703.putInitParams(param1.friendsIncomingNew);
         this.Renamed6703.objectLoaded();
         this.Renamed6704.putInitParams(param1.friendsOutgoing);
         this.Renamed6704.objectLoaded();
      }
      
      private function onUsersLoaded() : void
      {
         this.Renamed6706.onUsersLoaded();
      }
      
      private function Renamed6708(param1:Object) : void
      {
         this.Renamed6704.onAdding(param1.user);
      }
      
      private function Renamed6709(param1:Object) : void
      {
         this.Renamed6700.onAdding(param1.user);
         this.Renamed6701.onAdding(param1.user);
         this.Renamed6703.onRemoved(param1.user);
      }
      
      private function Renamed6710(param1:Object) : void
      {
         this.Renamed6702.onAdding(param1.user);
         this.Renamed6703.onAdding(param1.user);
      }
      
      private function alreadyInAcceptedFriends(param1:Object) : void
      {
         this.Renamed6705.alreadyInAcceptedFriends(param1.userId);
      }
      
      private function alreadyInIncomingFriends(param1:Object) : void
      {
         this.Renamed6705.alreadyInIncomingFriends(param1.userId,param1.userId);
      }
      
      private function alreadyInOutgoingFriends(param1:Object) : void
      {
         this.Renamed6705.alreadyInOutgoingFriends(param1.userId);
      }
      
      private function Renamed6711(param1:Object) : void
      {
         this.Renamed6700.onRemoved(param1.user);
         this.Renamed6701.onRemoved(param1.user);
      }
      
      private function Renamed6713(param1:Object) : void
      {
         this.Renamed6704.onRemoved(param1.user);
      }
      
      private function Renamed6712(param1:Object) : void
      {
         this.Renamed6702.onRemoved(param1.user);
         this.Renamed6703.onRemoved(param1.user);
      }
      
      private function removeNewAcceptedFriend(param1:Object) : void
      {
         this.Renamed6701.onRemoved(param1.userId);
      }
      
      private function removeNewIncomingFriend(param1:Object) : void
      {
         this.Renamed6703.onRemoved(param1.userId);
      }
      
      private function uidExist() : void
      {
         this.Renamed6705.uidExist();
      }
      
      private function uidNotExist() : void
      {
         this.Renamed6705.uidNotExist();
      }
   }
}

