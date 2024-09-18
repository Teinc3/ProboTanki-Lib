package alternativa.tanks.gui.upgrade
{
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import controls.timer.CountDownTimer;
   import flash.events.Event;
   
   public class ItemPropertyUpgradeEvent extends Event
   {
      public static const SELECT_WINDOW_CLOSED:String = "ItemPropertyUpgradeEventSelectWindowClosed";
      
      public static const UPGRADE_STARTED:String = "ItemPropertyUpgradeEventUpgradeStarted";
      
      public static const SPEED_UP:String = "ItemPropertyUpgradeEventSpeedUp";
      
      public static const FLUSH_UPGRADES:String = "ItemPropertyUpgradeEventFlushUpgrades";
      
      private var property:UpgradableItemPropertyValue;
      
      private var timer:CountDownTimer;
      
      public function ItemPropertyUpgradeEvent(param1:String, param2:UpgradableItemPropertyValue = null, param3:CountDownTimer = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.property = param2;
         this.timer = param3;
      }
      
      public function getPropertyValue() : UpgradableItemPropertyValue
      {
         return this.property;
      }
      
      public function getTimer() : CountDownTimer
      {
         return this.timer;
      }
   }
}

