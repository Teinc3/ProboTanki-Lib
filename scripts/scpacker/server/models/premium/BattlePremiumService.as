package scpacker.server.models.premium
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoLabelUpdaterEvent;
   
   public class BattlePremiumService extends EventDispatcher implements IBattlePremiumService
   {
      private var premiumUsersData:Dictionary;
      
      public function BattlePremiumService()
      {
         this.premiumUsersData = new Dictionary();
         super();
      }
      
      public function init(param1:Array) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1)
         {
            this.premiumUsersData[_loc2_] = true;
            dispatchEvent(new ChangeUserPremiumStatus(ChangeUserPremiumStatus.CHANGE,_loc2_,true));
         }
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_RANK));
      }
      
      public function clear() : void
      {
         this.premiumUsersData = new Dictionary();
      }
      
      public function hasUserPremium(param1:String) : Boolean
      {
         return this.premiumUsersData[param1];
      }
   }
}

