package forms.userlabel
{
   import flash.events.MouseEvent;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   
   public class LobbyChatUserLabel extends ChatUserLabel
   {
      public function LobbyChatUserLabel(param1:String, param2:String, param3:int, param4:ChatModeratorLevel)
      {
         _uid = param2;
         _rank = param3;
         _writeInChat = true;
         _forciblySubscribeFriend = true;
         _blockUserEnable = true;
         inviteBattleEnable = true;
         _chatModeratorLevel = param4;
         super(param1);
      }
      
      override protected function updateProperties() : void
      {
         setUid(_uid);
         setRank(_rank);
         setFriendState(_friendInfoUpdater.state);
      }
      
      override protected function onMouseClick(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(userPropertiesService.userId == _userId)
         {
            dispatchEvent(new UserLabelEvent(UserLabelEvent.CLICK_WITH_CTRL,_uid,true));
            return;
         }
         if(param1.ctrlKey)
         {
            dispatchEvent(new UserLabelEvent(UserLabelEvent.CLICK_WITH_CTRL,_uid,true));
         }
         else
         {
            switch(_friendState)
            {
               case FriendState.ACCEPTED:
                  _loc3_ = true;
                  break;
               case FriendState.INCOMING:
                  _loc4_ = true;
                  _loc5_ = true;
                  break;
               case FriendState.OUTGOING:
                  _loc6_ = true;
                  break;
               default:
                  _loc2_ = true;
            }
            contextMenuService.show(stage.mouseX,stage.mouseY,_userId,_rank,_uid,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_writeInChat,inviteBattleEnable,false,_blockUserEnable);
         }
      }
   }
}

