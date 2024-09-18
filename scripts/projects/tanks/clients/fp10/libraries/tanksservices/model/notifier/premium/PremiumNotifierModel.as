package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.premium
{
   import alternativa.types.Long;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.tanksservices.model.notifier.premium.IPremiumNotifierModelBase;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierData;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class PremiumNotifierModel extends PremiumNotifierModelBase implements IPremiumNotifierModelBase, UserRefresh, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      private const DAY_IN_SECONDS:int = 86400;
      
      private var data:Dictionary;
      
      private var timeouts:Dictionary;
      
      public function PremiumNotifierModel()
      {
         super();
      }
      
      public function updateTimeLeft(param1:int) : void
      {
         premiumService.updateTimeLeft(param1);
      }
      
      public function objectLoaded() : void
      {
         this.data = new Dictionary();
         this.timeouts = new Dictionary();
         premiumService.updateTimeLeft(getInitParam().lifeTimeInSeconds);
         premiumService.addEventListener(Event.CHANGE,this.onSelfPremiumChange);
      }
      
      private function onSelfPremiumChange(param1:Event) : void
      {
         this.updateForAllNotifiers(userPropertiesService.userId,premiumService.hasPremium());
      }
      
      public function objectUnloaded() : void
      {
         var _loc1_:uint = 0;
         for each(_loc1_ in this.timeouts)
         {
            clearTimeout(_loc1_);
         }
         this.timeouts = null;
         this.data = null;
         premiumService.removeEventListener(Event.CHANGE,this.onSelfPremiumChange);
         premiumService.destroy();
      }
      
      public function setPremiumTimeLeft(param1:Vector.<PremiumNotifierData>) : void
      {
         var _loc2_:PremiumNotifierData = null;
         for each(_loc2_ in param1)
         {
            this.setAndUpdate(_loc2_);
         }
      }
      
      private function setAndUpdate(param1:PremiumNotifierData) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = param1.userId;
         var _loc4_:* = param1.premiumTimeLeftInSeconds > 0;
         if((_loc4_) && _loc3_ in this.data)
         {
            return;
         }
         if(_loc4_ && param1.premiumTimeLeftInSeconds < this.DAY_IN_SECONDS)
         {
            _loc2_ = param1.premiumTimeLeftInSeconds * 1000 + getTimer();
            this.timeouts[_loc3_] = setTimeout(this.removePremium,param1.premiumTimeLeftInSeconds * 1000,_loc3_);
         }
         else
         {
            _loc2_ = this.DAY_IN_SECONDS * 1000 + getTimer();
         }
         if(_loc4_)
         {
            this.data[_loc3_] = _loc2_;
         }
         else
         {
            this.remove(_loc3_);
         }
         this.updateForAllNotifiers(_loc3_,_loc4_);
      }
      
      private function updateForAllNotifiers(param1:String, param2:Boolean) : void
      {
         var _loc3_:UserInfoConsumer = null;
         var _loc4_:UserNotifier = UserNotifier(modelRegistry.getModel(Long.getLong(0,300150005)));
         if(_loc4_.hasDataConsumer(param1))
         {
            _loc3_ = _loc4_.getDataConsumer(param1);
            _loc3_.setPremium(param2,param1);
         }
      }
      
      private function removePremium(param1:String) : void
      {
         this.updateForAllNotifiers(param1,false);
         this.remove(param1);
      }
      
      public function refresh(param1:String, param2:UserInfoConsumer) : void
      {
         if(param1 in this.data)
         {
            param2.setPremium(getTimer() < this.data[param1]);
         }
      }
      
      public function remove(param1:String) : void
      {
         if(param1 in this.timeouts)
         {
            clearTimeout(this.timeouts[param1]);
            delete this.timeouts[param1];
         }
         delete this.data[param1];
      }
   }
}

