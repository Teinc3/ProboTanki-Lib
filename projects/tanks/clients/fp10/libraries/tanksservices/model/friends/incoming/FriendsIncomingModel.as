package projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incoming
{
   import Renamed393.Renamed4494;
   import Renamed393.Renamed4495;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   
   public class FriendsIncomingModel extends Renamed4494 implements Renamed4495, ObjectLoadListener
   {
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      public function FriendsIncomingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:UserContainerCC = null;
         var _loc2_:String = null;
         _loc1_ = getInitParam();
         for each(_loc2_ in _loc1_.users)
         {
            friendsInfoService.setFriendState(_loc2_,FriendState.INCOMING);
         }
      }
      
      public function onAdding(param1:String) : void
      {
         friendsInfoService.setFriendState(param1,FriendState.INCOMING);
      }
      
      public function onRemoved(param1:String) : void
      {
         friendsInfoService.deleteFriend(param1,FriendState.INCOMING);
      }
   }
}

