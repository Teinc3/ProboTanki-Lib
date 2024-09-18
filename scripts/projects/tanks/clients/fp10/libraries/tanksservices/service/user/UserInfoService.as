package projects.tanks.clients.fp10.libraries.tanksservices.service.user
{
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.TimeOutTruncateConsumers;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   
   public class UserInfoService extends EventDispatcher implements IUserInfoService
   {
      [Inject]
      public static var premiumService:PremiumService;
      
      private var consumers:Dictionary;
      
      private var unsubscribedConsumers:Dictionary;
      
      private var truncateConsumers:TimeOutTruncateConsumers;
      
      public function UserInfoService()
      {
         super();
      }
      
      public function init() : void
      {
         this.truncateConsumers = new TimeOutTruncateConsumers();
         this.truncateConsumers.consumers = this.consumers;
         this.truncateConsumers.truncateFunction = this.unSubscribe;
         this.consumers = new Dictionary();
         this.unsubscribedConsumers = new Dictionary();
      }
      
      public function getOrCreateUpdater(param1:String) : IUserInfoLabelUpdater
      {
         var _loc2_:UserInfoLabelUpdater = null;
         if(this.hasConsumer(param1))
         {
            _loc2_ = this.consumers[param1];
         }
         else
         {
            _loc2_ = new UserInfoLabelUpdater();
            _loc2_.setUid(param1);
            if(param1 in this.unsubscribedConsumers)
            {
               this.subscribe(param1,_loc2_);
            }
            else
            {
               this.refresh(param1,_loc2_);
            }
            this.subscribe(param1,_loc2_);
         }
         _loc2_.updateLastAccessTime();
         return _loc2_;
      }
      
      public function forciblySubscribe(param1:String) : void
      {
         var _loc2_:UserInfoLabelUpdater = null;
         if(!this.hasConsumer(param1))
         {
            _loc2_ = new UserInfoLabelUpdater();
            _loc2_.setUid(param1);
            this.subscribe(param1,_loc2_);
            _loc2_.updateLastAccessTime();
         }
      }
      
      private function subscribe(param1:String, param2:UserInfoConsumer) : void
      {
         delete this.unsubscribedConsumers[param1];
         this.consumers[param1] = param2;
         UserNotifier(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(0,300150005))).subcribe(param1,param2);
      }
      
      private function refresh(param1:String, param2:UserInfoConsumer) : void
      {
         this.consumers[param1] = param2;
         UserNotifier(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(0,300150005))).refresh(param1,param2);
      }
      
      private function unSubscribe(param1:Vector.<String>) : void
      {
         var _loc2_:Long = null;
         for each(_loc2_ in param1)
         {
            this.unsubscribedConsumers[_loc2_] = true;
            delete this.consumers[_loc2_];
         }
         UserNotifier(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(0,300150005))).unsubcribe(param1);
      }
      
      public function hasConsumer(param1:String) : Boolean
      {
         return param1 in this.consumers;
      }
      
      public function getConsumer(param1:String) : UserInfoConsumer
      {
         return this.consumers[param1];
      }
      
      public function unload() : void
      {
         this.truncateConsumers.stop();
         this.truncateConsumers = null;
         this.consumers = null;
         this.unsubscribedConsumers = null;
      }
      
      public function getCurrentUserId() : String
      {
         return UserNotifier(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(0,300150005))).getCurrentUserId();
      }
      
      public function hasPremium(param1:String) : Boolean
      {
         return this.getOrCreateUpdater(param1).hasPremium();
      }
   }
}

