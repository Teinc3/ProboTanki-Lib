package services.contextmenu
{
   import flash.events.IEventDispatcher;
   
   public interface IContextMenuService extends IEventDispatcher
   {
      function show(param1:int, param2:int, param3:String, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:Boolean, param12:Boolean, param13:Boolean = false, param14:Boolean = true) : void;
      
      function writeInChat(param1:String, param2:String) : void;
      
      function removeFromFriends(param1:String, param2:String) : void;
      
      function acceptRequest(param1:String, param2:String) : void;
      
      function rejectRequest(param1:String, param2:String) : void;
      
      function cancelRequest(param1:String, param2:String) : void;
      
      function addToFriend(param1:String) : void;
      
      function focusOnUser(param1:String, param2:String) : void;
   }
}

