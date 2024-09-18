package alternativa.tanks.gui.upgrade
{
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public class UpgradeColors
   {
      public static const GREEN:int = 65291;
      
      public static const WHITE:int = 16777215;
      
      public static const GOLD:int = 16580352;
      
      public static const LIGHT_GREEN:int = 8847108;
      
      public function UpgradeColors()
      {
         super();
      }
      
      public static function getColorForValue(param1:ItemPropertyValue) : int
      {
         var _loc2_:UpgradableItemPropertyValue = null;
         if(param1.isUpgradable())
         {
            _loc2_ = param1.getUpgradableValue();
            if(_loc2_.getMaxLevel() == _loc2_.getLevel())
            {
               return GOLD;
            }
            if(_loc2_.getLevel() > 0)
            {
               return LIGHT_GREEN;
            }
            return WHITE;
         }
         if(param1.getProperty() == ItemGarageProperty.ALL_RESISTANCE)
         {
            return GOLD;
         }
         return WHITE;
      }
   }
}

