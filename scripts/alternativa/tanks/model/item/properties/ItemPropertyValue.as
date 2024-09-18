package alternativa.tanks.model.item.properties
{
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public interface ItemPropertyValue
   {
      function getValue() : String;
      
      function getProperty() : ItemGarageProperty;
      
      function isUpgradable() : Boolean;
      
      function getUpgradableValue() : UpgradableItemPropertyValue;
   }
}

