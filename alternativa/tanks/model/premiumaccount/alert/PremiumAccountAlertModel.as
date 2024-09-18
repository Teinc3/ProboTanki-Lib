package alternativa.tanks.model.premiumaccount.alert
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.premiumaccount.PremiumAccountWelcomeAlert;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.model.premiumaccount.notification.PremiumCompleteNotification;
   import flash.events.Event;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import projects.tanks.client.panel.model.premiumaccount.alert.§3"l§;
   import projects.tanks.client.panel.model.premiumaccount.alert.PremiumAccountAlertCC;
   import projects.tanks.client.panel.model.premiumaccount.alert.§native package finally§;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   
   public class PremiumAccountAlertModel extends §native package finally§ implements §3"l§
   {
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const UPDATE_INTERVAL:int = 60000;
      
      private var _showReminderIntervalId:uint = 0;
      
      private var _wasShowReminderCompletionPremium:Boolean;
      
      private var _reminderCompletionPremiumTime:int;
      
      public function PremiumAccountAlertModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:PremiumAccountAlertCC = getInitParam();
         if(_loc1_.localRuntimeUser)
         {
            if(_loc1_.needShowWelcomeAlert)
            {
               this.showWelcomeAlert(_loc1_.wasShowAlertForFirstPurchasePremium);
            }
            if(_loc1_.needShowNotificationCompletionPremium)
            {
               this.showNotificationCompletionPremium();
            }
            this._wasShowReminderCompletionPremium = _loc1_.wasShowReminderCompletionPremium;
            this._reminderCompletionPremiumTime = _loc1_.reminderCompletionPremiumTime;
            this.checkNeedShowReminderCompletionPremium();
            premiumService.addEventListener(Event.CHANGE,this.onSelfPremiumChange);
         }
      }
      
      private function checkNeedShowReminderCompletionPremium() : void
      {
         var _loc1_:int = 0;
         this.destroyReminderInterval();
         if(premiumService.hasPremium())
         {
            _loc1_ = premiumService.getTimeLeft() - this._reminderCompletionPremiumTime;
            if(_loc1_ > 0)
            {
               this._wasShowReminderCompletionPremium = false;
               this._showReminderIntervalId = setInterval(this.checkNeedShowReminderCompletionPremium,UPDATE_INTERVAL);
            }
            else if(!this._wasShowReminderCompletionPremium)
            {
               this.showReminderCompletionPremium();
            }
         }
      }
      
      public function objectUnloaded() : void
      {
         premiumService.removeEventListener(Event.CHANGE,this.onSelfPremiumChange);
         this.destroyReminderInterval();
      }
      
      private function destroyReminderInterval() : void
      {
         if(this._showReminderIntervalId != 0)
         {
            clearInterval(this._showReminderIntervalId);
            this._showReminderIntervalId = 0;
         }
      }
      
      public function showWelcomeAlert(param1:Boolean) : void
      {
         var _loc2_:String = null;
         if(param1)
         {
            _loc2_ = localeService.getText(TextConst.TEXT_PREMIUM_ALERT_RETURN);
         }
         else
         {
            _loc2_ = localeService.getText(TextConst.TEXT_PREMIUM_ALERT_WELCOM);
         }
         var _loc3_:PremiumAccountWelcomeAlert = new PremiumAccountWelcomeAlert(_loc2_);
         _loc3_.enqueueDialog();
      }
      
      private function onSelfPremiumChange(param1:Event) : void
      {
         if(premiumService.hasPremium())
         {
            this.checkNeedShowReminderCompletionPremium();
         }
         else
         {
            this.showNotificationCompletionPremium();
         }
      }
      
      private function showNotificationCompletionPremium() : void
      {
         notificationService.addNotification(new PremiumCompleteNotification(localeService.getText(TextConst.TEXT_PREMIUM_NOTIFICATION_COMPLETE)));
      }
      
      private function showReminderCompletionPremium() : void
      {
         this._wasShowReminderCompletionPremium = true;
         notificationService.addNotification(new PremiumCompleteNotification(localeService.getText(TextConst.TEXT_PREMIUM_NOTIFICATION_SOON_COMPLETE)));
      }
   }
}

