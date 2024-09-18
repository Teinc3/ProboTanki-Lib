package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.Event;
   
   public class FriendActionServiceUidEvent extends Event
   {
      public static const ADD:String = "FriendActionServiceUidEvent.ADD";
      
      public static const CHECK:String = "FriendActionServiceUidEvent.CHECK";
      
      public static const UID_EXIST:String = "FriendActionServiceUidEvent.UID_EXIST";
      
      public static const UID_NOT_EXIST:String = "FriendActionServiceUidEvent.UID_NOT_EXIST";
      
      public static const ALREADY_IN_INCOMING_FRIENDS:String = "FriendActionServiceUidEvent.ALREADY_IN_INCOMING_FRIENDS";
      
      public static const ALREADY_IN_ACCEPTED_FRIENDS:String = "FriendActionServiceUidEvent.ALREADY_IN_ACCEPTED_FRIENDS";
      
      public static const ALREADY_IN_OUTGOING_FRIENDS:String = "FriendActionServiceUidEvent.ALREADY_IN_OUTGOING_FRIENDS";
      
      public var uid:String;
      
      public var userId:String;
      
      public function FriendActionServiceUidEvent(param1:String, param2:String, param3:String = null, param4:Boolean = false, param5:Boolean = false)
      {
         this.uid = param2;
         this.userId = param3;
         super(param1,param4,param5);
      }
   }
}

