package scpacker.server.models.premium
{
   import flash.events.Event;
   
   public class ChangeUserPremiumStatus extends Event
   {
      public static const CHANGE:String = "CHANGE_USER_PREMIUM_STATUS";
      
      public var nickname:String;
      
      public var premium:Boolean;
      
      public function ChangeUserPremiumStatus(param1:String, param2:String, param3:Boolean)
      {
         super(param1,false,false);
         this.nickname = param2;
         this.premium = param3;
      }
   }
}

