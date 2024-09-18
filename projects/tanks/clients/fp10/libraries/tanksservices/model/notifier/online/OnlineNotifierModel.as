package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online
{
   import alternativa.types.Long;
   import projects.tanks.client.tanksservices.model.notifier.online.§4"q§;
   import projects.tanks.client.tanksservices.model.notifier.online.OnlineNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.online.§else for get§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   
   public class OnlineNotifierModel extends §else for get§ implements §4"q§, UserRefresh
   {
      [Inject]
      public static var onlineNotifierService:IOnlineNotifierService;
      
      public function OnlineNotifierModel()
      {
         super();
      }
      
      private static function convertToClientData(param1:OnlineNotifierData) : ClientOnlineNotifierData
      {
         return new ClientOnlineNotifierData(param1.userId,param1.online,param1.serverNumber);
      }
      
      public function setOnline(param1:Vector.<OnlineNotifierData>) : void
      {
         var _loc2_:ClientOnlineNotifierData = null;
         var _loc3_:Vector.<ClientOnlineNotifierData> = new Vector.<ClientOnlineNotifierData>(param1.length);
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = convertToClientData(param1[_loc5_]);
            this.setAndUpdateConsumer(_loc2_);
            _loc3_[_loc5_] = _loc2_;
            _loc5_++;
         }
         onlineNotifierService.setOnline(_loc3_);
      }
      
      private function setAndUpdateConsumer(param1:ClientOnlineNotifierData) : void
      {
         var _loc2_:UserInfoConsumer = null;
         var _loc3_:String = param1.userId;
         onlineNotifierService.addUserOnlineData(param1);
         var _loc4_:UserNotifier = UserNotifier(modelRegistry.getModel(Long.getLong(0,300150005)));
         if(_loc4_.hasDataConsumer(_loc3_))
         {
            _loc2_ = _loc4_.getDataConsumer(_loc3_);
            _loc2_.setOnline(param1.online,param1.serverNumber);
         }
      }
      
      public function refresh(param1:String, param2:UserInfoConsumer) : void
      {
         var _loc3_:ClientOnlineNotifierData = null;
         if(onlineNotifierService.hasUserOnlineData(param1))
         {
            _loc3_ = onlineNotifierService.getUserOnlineData(param1);
            param2.setOnline(_loc3_.online,_loc3_.serverNumber);
         }
      }
      
      public function remove(param1:String) : void
      {
         onlineNotifierService.removeUserOnlineData(param1);
      }
   }
}

