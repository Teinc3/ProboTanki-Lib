package projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incomingnotificator
{
   import § !a§.§+!P§;
   import § !a§.§return catch§;
   import alternativa.osgi.service.logging.LogService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.NewFriendRemoveEvent;
   
   public class FriendsIncomingNotificatorModel extends §return catch§ implements §+!P§, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      public function FriendsIncomingNotificatorModel()
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
            logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel newFriendsIncoming userId=%1",[_loc2_]);
            friendsInfoService.onAddNewIncomingFriend(_loc2_);
         }
         friendsInfoService.addEventListener(NewFriendRemoveEvent.INCOMING,this.remove);
      }
      
      public function remove(param1:NewFriendRemoveEvent) : void
      {
         logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel remove userId=%1",[param1.userId]);
         server.remove(param1.userId);
      }
      
      public function onAdding(param1:String) : void
      {
         logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel onAdding userId=%1",[param1]);
         friendsInfoService.onAddNewIncomingFriend(param1);
      }
      
      public function onRemoved(param1:String) : void
      {
         logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel onRemoved userId=%1",[param1]);
         friendsInfoService.onRemoveNewIncomingFriend(param1);
      }
      
      public function objectUnloaded() : void
      {
         logService.getLogger("fcounter").debug("FriendsIncomingNotificatorModel objectUnloaded");
         friendsInfoService.removeEventListener(NewFriendRemoveEvent.INCOMING,this.remove);
      }
   }
}

