package alternativa.tanks.model.item.upgradable
{
   import controls.timer.CountDownTimer;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public interface UpgradableItem
   {
      function getUpgradableProperties() : Vector.<UpgradableItemPropertyValue>;
      
      function isUpgrading() : Boolean;
      
      function getUpgradingProperty() : ItemGarageProperty;
      
      function getUpgradingValue() : UpgradableItemPropertyValue;
      
      function speedUp() : void;
      
      function getCountDownTimer() : CountDownTimer;
      
      function setUpgradingProperty(param1:UpgradableItemPropertyValue, param2:CountDownTimer) : void;
      
      function initializePrecision() : void;
      
      function traceUpgrades() : void;
   }
}

