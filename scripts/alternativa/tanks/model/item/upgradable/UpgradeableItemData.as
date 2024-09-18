package alternativa.tanks.model.item.upgradable
{
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteAfter;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.upgradeable.types.UpgradingPropertyInfo;
   
   public class UpgradeableItemData implements CountDownTimerOnCompleteAfter
   {
      public var properties:Vector.<UpgradableItemPropertyValue>;
      
      public var upgradingValue:UpgradableItemPropertyValue = null;
      
      public var timer:CountDownTimer = null;
      
      public function UpgradeableItemData(param1:Vector.<UpgradableItemPropertyValue>, param2:UpgradingPropertyInfo, param3:IGameObject)
      {
         var _loc4_:int = 0;
         var _loc5_:UpgradableItemPropertyValue = null;
         super();
         this.properties = param1;
         if(param2 != null)
         {
         }
      }
      
      private function setTimer(param1:CountDownTimer) : void
      {
         this.timer = param1;
         param1.addListener(CountDownTimerOnCompleteAfter,this);
      }
      
      public function setUpgradingProperty(param1:UpgradableItemPropertyValue, param2:CountDownTimer) : void
      {
         this.upgradingValue = param1;
         this.setTimer(param2);
      }
      
      public function getValue(param1:ItemGarageProperty) : UpgradableItemPropertyValue
      {
         var _loc2_:UpgradableItemPropertyValue = null;
         for each(_loc2_ in this.properties)
         {
            if(_loc2_.getProperty() == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function speedUp() : void
      {
         this.upgradingValue.incrementLevel();
         this.upgradingValue = null;
         this.timer.removeListener(CountDownTimerOnCompleteAfter,this);
         this.timer = null;
      }
      
      public function isUpgrading() : Boolean
      {
         return this.upgradingValue != null;
      }
      
      public function onCompleteAfter(param1:CountDownTimer, param2:Boolean) : void
      {
         this.speedUp();
      }
   }
}

