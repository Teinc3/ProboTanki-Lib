package alternativa.tanks.model.item.upgradable
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.model.item.properties.ItemProperties;
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.itempropertyparams.§else package implements§;
   import controls.timer.CountDownTimer;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.upgradeable.IUpgradeableParamsConstructorModelBase;
   import projects.tanks.client.garage.models.item.upgradeable.UpgradeableParamsConstructorModelBase;
   import projects.tanks.client.garage.models.item.upgradeable.types.GaragePropertyData;
   
   public class UpgradableParamsModel extends UpgradeableParamsConstructorModelBase implements IUpgradeableParamsConstructorModelBase, ObjectLoadPostListener, UpgradableItem, ObjectUnloadListener, ItemProperties
   {
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var logger:IClientLog;
      
      public function UpgradableParamsModel()
      {
         super();
      }
      
      public function getProperties() : Vector.<ItemPropertyValue>
      {
         return Vector.<ItemPropertyValue>(this.data().properties);
      }
      
      public function getUpgradableProperties() : Vector.<UpgradableItemPropertyValue>
      {
         return this.data().properties;
      }
      
      public function isUpgrading() : Boolean
      {
         return this.data().isUpgrading();
      }
      
      public function getUpgradingProperty() : ItemGarageProperty
      {
         return this.data().upgradingValue.getProperty();
      }
      
      public function getUpgradingValue() : UpgradableItemPropertyValue
      {
         return this.data().upgradingValue;
      }
      
      public function speedUp() : void
      {
         return this.data().speedUp();
      }
      
      public function setUpgradingProperty(param1:UpgradableItemPropertyValue, param2:CountDownTimer) : void
      {
         this.data().setUpgradingProperty(param1,param2);
      }
      
      public function getCountDownTimer() : CountDownTimer
      {
         return this.data().timer;
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:GaragePropertyData = null;
         var _loc2_:UpgradeableItemData = null;
         var _loc3_:UpgradableItemPropertyValue = null;
         var _loc4_:Vector.<UpgradableItemPropertyValue> = new Vector.<UpgradableItemPropertyValue>();
         var _loc5_:Boolean = itemService.§!"p§(object) && itemService.hasNextModification(object);
         for each(_loc1_ in getInitParam().properties)
         {
            _loc3_ = new UpgradableItemPropertyValue(_loc1_,_loc5_);
            _loc4_.push(_loc3_);
         }
         _loc4_.sort(this.compare);
         _loc2_ = new UpgradeableItemData(_loc4_,getInitParam().info,object);
         putData(UpgradeableItemData,_loc2_);
      }
      
      public function initializePrecision() : void
      {
         var _loc1_:Vector.<UpgradeableItemData> = null;
         var _loc2_:IGameObject = null;
         var _loc3_:GaragePropertyData = null;
         var _loc4_:int = 0;
         var _loc5_:UpgradeableItemData = null;
         if(itemService.§!"p§(object) && itemService.getModificationIndex(object) == 0)
         {
            _loc1_ = new Vector.<UpgradeableItemData>();
            for each(_loc2_ in itemService.§;#U§(object))
            {
               Model.object = _loc2_;
               _loc1_.push(this.data());
               Model.popObject();
            }
            for each(_loc3_ in getInitParam().properties)
            {
               _loc4_ = 0;
               for each(_loc5_ in _loc1_)
               {
                  _loc4_ = Math.max(_loc4_,_loc5_.getValue(_loc3_.property).getPrecision());
               }
               for each(_loc5_ in _loc1_)
               {
                  _loc5_.getValue(_loc3_.property).setPrecision(_loc4_);
               }
            }
         }
      }
      
      public function traceUpgrades() : void
      {
         var _loc1_:UpgradableItemPropertyValue = null;
         var _loc2_:String = itemService.getName(object);
         if(itemService.§!"p§(object))
         {
            _loc2_ += " M" + itemService.getModificationIndex(object);
         }
         for each(_loc1_ in this.data().properties)
         {
            _loc1_.traceUpgrades();
         }
      }
      
      private function compare(param1:UpgradableItemPropertyValue, param2:UpgradableItemPropertyValue) : Number
      {
         var _loc3_:§else package implements§ = propertyService.getParams(param1.getProperty());
         var _loc4_:§else package implements§ = propertyService.getParams(param2.getProperty());
         var _loc5_:int = _loc3_ != null ? int(_loc3_.§switch const else§) : int(0);
         var _loc6_:int = _loc4_ != null ? int(_loc4_.§switch const else§) : int(0);
         if(_loc5_ < _loc6_)
         {
            return -1;
         }
         if(_loc5_ > _loc6_)
         {
            return 1;
         }
         return 0;
      }
      
      private function data() : UpgradeableItemData
      {
         return UpgradeableItemData(getData(UpgradeableItemData));
      }
      
      public function objectUnloaded() : void
      {
         clearData(UpgradeableItemData);
      }
   }
}

