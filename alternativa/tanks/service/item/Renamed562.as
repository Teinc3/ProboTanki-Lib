package alternativa.tanks.service.item
{
   import alternativa.model.description.IDescription;
   import alternativa.model.timeperiod.TimePeriod;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.GarageWindow;
   import alternativa.tanks.model.item.buyable.IBuyable;
   import alternativa.tanks.model.item.category.IItemCategory;
   import alternativa.tanks.model.item.category.IItemViewCategory;
   import alternativa.tanks.model.item.countable.ICountableItem;
   import alternativa.tanks.model.item.discount.IDiscount;
   import alternativa.tanks.model.item.item.IItem;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.modification.IModification;
   import alternativa.tanks.model.item.properties.ItemProperties;
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.UpgradableItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.types.Long;
   import controls.timer.CountDownTimer;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import Renamed407.Renamed3678;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Renamed562 extends EventDispatcher implements ItemService
   {
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      [Inject]
      public static var garageService:GarageService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed3679:Dictionary;
      
      private var Renamed3680:Dictionary;
      
      private var Renamed3681:Dictionary;
      
      private var Renamed3682:Vector.<IGameObject>;
      
      private var Renamed3683:Dictionary;
      
      private var Renamed3684:Dictionary;
      
      private const Renamed3685:int = 5;
      
      public function Renamed562()
      {
         super();
         this.Renamed3682 = new Vector.<IGameObject>();
         this.Renamed3679 = new Dictionary();
         this.Renamed3680 = new Dictionary();
         this.Renamed3681 = new Dictionary();
         this.Renamed3684 = new Dictionary();
         this.Renamed3683 = new Dictionary();
         this.Renamed3683[ItemGarageProperty.FIREBIRD_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_FIREBIRD;
         this.Renamed3683[ItemGarageProperty.FREEZE_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_FREEZE;
         this.Renamed3683[ItemGarageProperty.ISIS_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_ISIDA;
         this.Renamed3683[ItemGarageProperty.RAILGUN_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_RAILGUN;
         this.Renamed3683[ItemGarageProperty.RICOCHET_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_RICOCHET;
         this.Renamed3683[ItemGarageProperty.SHAFT_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_SHAFT;
         this.Renamed3683[ItemGarageProperty.SMOKY_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_SMOKY;
         this.Renamed3683[ItemGarageProperty.THUNDER_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_THUNDER;
         this.Renamed3683[ItemGarageProperty.TWINS_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_TWINS;
         this.Renamed3683[ItemGarageProperty.MINE_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_MINE;
         this.Renamed3683[ItemGarageProperty.SHOTGUN_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_SHOTGUN;
         this.Renamed3683[ItemGarageProperty.MACHINE_GUN_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_MACHINE_GUN;
      }
      
      public function addItem(param1:IGameObject) : void
      {
         if(param1 in this.Renamed3679)
         {
            return;
         }
         this.Renamed3679[param1] = true;
         dispatchEvent(new Renamed3686(Renamed3686.Renamed3687,param1));
      }
      
      public function Renamed1934(param1:IGameObject) : ItemViewCategoryEnum
      {
         return IItemViewCategory(param1.adapt(IItemViewCategory)).getCategory();
      }
      
      public function isBuyable(param1:IGameObject) : Boolean
      {
         return IBuyable(param1.adapt(IBuyable)).isBuyable();
      }
      
      public function setCount(param1:IGameObject, param2:int) : void
      {
         if(param1.hasModel(ICountableItem))
         {
            ICountableItem(param1.adapt(ICountableItem)).setCount(param2);
         }
      }
      
      public function Renamed2102(param1:IGameObject) : IGameObject
      {
         var _loc2_:int = this.getModificationIndex(param1);
         var _loc3_:Vector.<IGameObject> = this.Renamed1706(param1);
         if(_loc2_ > 0)
         {
            return _loc3_[_loc2_ - 1];
         }
         return null;
      }
      
      public function getDescription(param1:IGameObject) : String
      {
         var _loc2_:Vector.<ItemPropertyValue> = null;
         var _loc3_:ItemPropertyValue = null;
         var _loc4_:* = "";
         var _loc5_:String = null;
         if(this.getCategory(param1) == ItemCategoryEnum.COLOR)
         {
            _loc2_ = this.getProperties(param1);
            if(_loc2_.length > 0)
            {
               _loc4_ = localeService.getText(TanksLocale.TEXT_GARAGE_RESISTANCE_DESCRIPTION_PREFIX) + "\n";
               if(_loc2_.length == 1 && _loc2_[0].getProperty() == ItemGarageProperty.ALL_RESISTANCE)
               {
                  for each(_loc5_ in this.Renamed3683)
                  {
                     _loc4_ += localeService.getText(_loc5_) + "\n";
                  }
               }
               else
               {
                  for each(_loc3_ in _loc2_)
                  {
                     _loc4_ += localeService.getText(this.Renamed3683[_loc3_.getProperty()]) + "\n";
                  }
               }
               _loc4_ += "\n";
            }
         }
         return _loc4_ + IDescription(param1.adapt(IDescription)).getDescription();
      }
      
      public function Renamed2099(param1:ItemCategoryEnum) : void
      {
         this.Renamed3684[param1] = true;
      }
      
      public function getUpgradableProperties(param1:IGameObject) : Vector.<UpgradableItemPropertyValue>
      {
         if(param1.hasModel(UpgradableItem))
         {
            return this.Renamed3688(param1).getUpgradableProperties();
         }
         return null;
      }
      
      private function Renamed3688(param1:IGameObject) : UpgradableItem
      {
         return UpgradableItem(param1.adapt(UpgradableItem));
      }
      
      public function Renamed1772(param1:IGameObject) : Boolean
      {
         return this.Renamed3684[this.getCategory(param1)] == true;
      }
      
      public function Renamed1773(param1:IGameObject) : Boolean
      {
         return param1 in this.Renamed3679;
      }
      
      public function reset() : void
      {
         this.Renamed3680 = new Dictionary();
         this.Renamed3679 = new Dictionary();
         this.Renamed3684 = new Dictionary();
         this.Renamed3682.length = 0;
      }
      
      public function getName(param1:IGameObject) : String
      {
         var _loc2_:String = IDescription(param1.adapt(IDescription)).getName();
         if(this.Renamed1704(param1))
         {
            _loc2_ += (localeService.language == "cn" ? "" : " ") + "M" + this.getModificationIndex(param1);
         }
         return _loc2_;
      }
      
      public function getPrice(param1:IGameObject) : int
      {
         if(this.Renamed1700(param1))
         {
            return GarageKit(param1.adapt(GarageKit)).getPrice();
         }
         return IBuyable(param1.adapt(IBuyable)).getPrice();
      }
      
      public function getTimeLeftInSeconds(param1:IGameObject) : int
      {
         var _loc2_:int = TimePeriod(param1.adapt(TimePeriod)).getTimeLeftInSeconds();
         return _loc2_ > this.Renamed3685 ? int(_loc2_ - this.Renamed3685) : int(0);
      }
      
      public function Renamed1702(param1:IGameObject) : Boolean
      {
         return TimePeriod(param1.adapt(TimePeriod)).isTimeless();
      }
      
      public function getTimeToStartInSeconds(param1:IGameObject) : int
      {
         var _loc2_:int = TimePeriod(param1.adapt(TimePeriod)).getTimeToStartInSeconds();
         return _loc2_ > 0 ? int(_loc2_ + this.Renamed3685) : int(0);
      }
      
      private function Renamed3689(param1:IGameObject) : Boolean
      {
         var _loc2_:int = TimePeriod(param1.adapt(TimePeriod)).getModelLoadingTimeInMillis();
         return getTimer() > _loc2_ + this.getTimeToStartInSeconds(param1) * 1000;
      }
      
      private function Renamed3690(param1:IGameObject) : Boolean
      {
         var _loc2_:int = TimePeriod(param1.adapt(TimePeriod)).getTimeLeftInSeconds();
         return _loc2_ > 0 && _loc2_ <= this.Renamed3685;
      }
      
      public function Renamed1701(param1:IGameObject) : Boolean
      {
         var _loc2_:Boolean = TimePeriod(param1.adapt(TimePeriod)).isEnabled();
         return _loc2_ && !this.Renamed3690(param1) || this.getTimeToStartInSeconds(param1) > 0 && this.Renamed3689(param1);
      }
      
      public function isCountable(param1:IGameObject) : Boolean
      {
         if(param1.hasModel(ICountableItem))
         {
            if(ICountableItem(param1.adapt(ICountableItem)).getCount() >= 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function Renamed1704(param1:IGameObject) : Boolean
      {
         return param1.hasModel(IModification) && IModification(param1.adapt(IModification)).getModificationIndex() >= 0;
      }
      
      public function Renamed1768(param1:IGameObject) : Boolean
      {
         return false;
      }
      
      public function Renamed2105(param1:IGameObject) : Boolean
      {
         return this.getCategory(param1) == ItemCategoryEnum.PRESENT;
      }
      
      public function Renamed1760(param1:IGameObject) : Boolean
      {
         return this.getCategory(param1) == ItemCategoryEnum.GIVEN_PRESENT;
      }
      
      public function getCategory(param1:IGameObject) : ItemCategoryEnum
      {
         return IItemCategory(param1.adapt(IItemCategory)).getCategory();
      }
      
      public function canBuy(param1:IGameObject) : Boolean
      {
         if(this.Renamed1700(param1))
         {
            return GarageKit(param1.adapt(GarageKit)).canBuy();
         }
         return this.isCountable(param1) || !this.Renamed1773(param1);
      }
      
      public function getCount(param1:IGameObject) : int
      {
         if(param1.hasModel(ICountableItem))
         {
            return ICountableItem(param1.adapt(ICountableItem)).getCount();
         }
         return 0;
      }
      
      public function Renamed1705(param1:IGameObject) : IGameObject
      {
         var _loc2_:int = this.getModificationIndex(param1);
         var _loc3_:Vector.<IGameObject> = this.Renamed1706(param1);
         if(_loc2_ < _loc3_.length - 1)
         {
            return _loc3_[_loc2_ + 1];
         }
         return param1;
      }
      
      public function getModificationIndex(param1:IGameObject) : int
      {
         if(this.Renamed1704(param1))
         {
            return IModification(param1.adapt(IModification)).getModificationIndex();
         }
         return -1;
      }
      
      public function Renamed1706(param1:IGameObject) : Vector.<IGameObject>
      {
         var _loc2_:Vector.<IGameObject> = null;
         var _loc3_:Dictionary = null;
         var _loc4_:int = 0;
         var _loc5_:Long = null;
         var _loc6_:int = 0;
         var _loc7_:IGameObject = null;
         var _loc8_:int = 0;
         var _loc9_:Vector.<IGameObject> = this.Renamed3680[param1];
         _loc2_ = param1.space.objects;
         _loc3_ = new Dictionary();
         _loc4_ = 0;
         _loc5_ = IModification(param1.adapt(IModification)).getBaseItemId();
         _loc6_ = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc7_ = _loc2_[_loc6_];
            if(_loc7_.hasModel(IModification) && _loc7_.name.indexOf("garageObject") == -1)
            {
               if(this.Renamed3691(IModification(_loc7_.adapt(IModification)).getBaseItemId(),_loc5_))
               {
                  _loc8_ = this.getModificationIndex(_loc7_);
                  _loc3_[_loc8_] = _loc7_;
                  _loc4_++;
               }
            }
            _loc6_++;
         }
         _loc9_ = new Vector.<IGameObject>();
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc9_[_loc6_] = _loc3_[_loc6_];
            _loc6_++;
         }
         this.Renamed3680[param1] = _loc9_;
         return _loc9_;
      }
      
      private function Renamed3691(param1:Long, param2:Long) : Boolean
      {
         return param1.high == param2.high && param1.low == param2.low;
      }
      
      private function Renamed3692(param1:Vector.<IGameObject>) : void
      {
         var Renamed3693:Vector.<IGameObject> = param1;
         var Renamed3694:Vector.<IGameObject> = null;
         var Renamed3695:IGameObject = null;
         var Renamed3696:Function = null;
         var Renamed2143:int = 0;
         var Renamed3697:int = 0;
         var Renamed3698:Vector.<IGameObject> = null;
         var Renamed3699:IGameObject = null;
         var Renamed3700:Vector.<IGameObject> = Renamed3693;
         if(this.Renamed3680 == null)
         {
            this.Renamed3680 = new Dictionary();
            Renamed3694 = new Vector.<IGameObject>();
            for each(Renamed3695 in Renamed3700)
            {
               if(Renamed3695.hasModel(IModification))
               {
                  Renamed3694.push(Renamed3695);
               }
            }
            Renamed3696 = function(param1:IGameObject, param2:IGameObject):int
            {
               var _loc3_:Long = IModification(param1.adapt(IModification)).getBaseItemId();
               var _loc4_:Long = IModification(param2.adapt(IModification)).getBaseItemId();
               return Long.comparator(_loc3_,_loc4_);
            };
            Renamed3694.sort(Renamed3696);
            Renamed2143 = 0;
            while(Renamed2143 < Renamed3694.length)
            {
               Renamed3697 = Renamed2143 + 1;
               while(Renamed3697 < Renamed3694.length && Renamed3696(Renamed3694[Renamed2143],Renamed3694[Renamed3697]) == 0)
               {
                  Renamed3697++;
               }
               Renamed3698 = new Vector.<IGameObject>(Renamed3697 - Renamed2143);
               while(Renamed2143 < Renamed3697)
               {
                  Renamed3699 = Renamed3694[Renamed2143];
                  Renamed3698[IModification(Renamed3699.adapt(IModification)).getModificationIndex()] = Renamed3699;
                  this.Renamed3680[Renamed3699] = Renamed3698;
                  Renamed2143++;
               }
            }
         }
      }
      
      public function Renamed3677(param1:IGameObject) : int
      {
         return this.Renamed1706(param1).length;
      }
      
      public function Renamed1931(param1:IGameObject) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc3_:Vector.<IGameObject> = this.Renamed1706(param1);
         var _loc4_:int = int(_loc3_.length - 1);
         while(_loc4_ >= 0)
         {
            _loc2_ = _loc3_[_loc4_];
            if(this.Renamed1773(_loc2_))
            {
               return _loc2_;
            }
            _loc4_--;
         }
         return null;
      }
      
      public function getPreviewResource(param1:IGameObject) : ImageResource
      {
         return IItem(param1.adapt(IItem)).getPreviewResource();
      }
      
      public function Renamed1764(param1:IGameObject) : int
      {
         return IItem(param1.adapt(IItem)).getMinRank();
      }
      
      public function Renamed1763(param1:IGameObject) : int
      {
         return IItem(param1.adapt(IItem)).getMaxRank();
      }
      
      public function Renamed1932(param1:IGameObject) : IGameObject
      {
         var _loc2_:IGameObject = this.Renamed1935(param1);
         if(_loc2_ == param1)
         {
            _loc2_ = this.Renamed1705(param1);
         }
         return _loc2_;
      }
      
      public function Renamed1935(param1:IGameObject) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = null;
         if(userPropertyService.rank < this.Renamed1764(param1))
         {
            return param1;
         }
         var _loc4_:Vector.<IGameObject> = this.Renamed1706(param1);
         var _loc5_:int;
         var _loc6_:int = (_loc5_ = int(_loc4_.length)) - 1;
         while(_loc6_ >= 0)
         {
            _loc3_ = _loc4_[_loc6_];
            if(userPropertyService.rank >= this.Renamed1764(_loc3_))
            {
               _loc2_ = _loc3_;
               break;
            }
            _loc6_--;
         }
         return _loc2_;
      }
      
      public function removeItem(param1:IGameObject) : void
      {
         if(this.Renamed1773(param1))
         {
            delete this.Renamed3679[param1];
         }
      }
      
      public function Renamed1700(param1:IGameObject) : Boolean
      {
         return this.getCategory(param1) == ItemCategoryEnum.KIT && param1.hasModel(GarageKit) && GarageKit(param1.adapt(GarageKit)).getImage != null;
      }
      
      public function isGrouped(param1:IGameObject) : Boolean
      {
         return param1.hasModel(Renamed3678) && Renamed3678(param1.adapt(Renamed3678)).isGrouped();
      }
      
      public function getDiscount(param1:IGameObject) : int
      {
         return IDiscount(param1.adapt(IDiscount)).getDiscountInPercent();
      }
      
      public function getEndDiscountTimer(param1:IGameObject) : CountDownTimer
      {
         return IDiscount(param1.adapt(IDiscount)).getEndDiscountTimer();
      }
      
      public function getPriceWithoutDiscount(param1:IGameObject) : int
      {
         return IBuyable(param1.adapt(IBuyable)).getPriceWithoutDiscount();
      }
      
      public function getPosition(param1:IGameObject) : int
      {
         return IItem(param1.adapt(IItem)).getPosition();
      }
      
      public function mountItem(param1:IGameObject) : void
      {
         var _loc2_:IGameObject = this.Renamed3701(this.getCategory(param1));
         if(_loc2_ == param1)
         {
            return;
         }
         var _loc3_:GarageWindow = garageService.Renamed1933();
         if(_loc2_ != null)
         {
            _loc3_.unmountItem(_loc2_);
            this.Renamed3682.splice(this.Renamed3682.indexOf(_loc2_),1);
         }
         _loc3_.mountItem(param1);
         this.Renamed3682.push(param1);
         if(_loc3_.selectedItem == param1)
         {
            _loc3_.itemInfoPanel.updateEquipButton();
         }
      }
      
      public function getProperties(param1:IGameObject) : Vector.<ItemPropertyValue>
      {
         if(param1.hasModel(ItemProperties))
         {
            return ItemProperties(param1.adapt(ItemProperties)).getProperties();
         }
         return null;
      }
      
      public function isUpgrading(param1:IGameObject) : Boolean
      {
         return param1.hasModel(UpgradableItem) && this.Renamed3688(param1).isUpgrading();
      }
      
      public function getUpgradingProperty(param1:IGameObject) : ItemGarageProperty
      {
         return this.Renamed3688(param1).getUpgradingProperty();
      }
      
      public function Renamed1774(param1:IGameObject) : Boolean
      {
         return this.Renamed3701(this.getCategory(param1)) == param1;
      }
      
      public function isFullUpgraded(param1:IGameObject) : Boolean
      {
         var _loc2_:ItemPropertyValue = null;
         for each(_loc2_ in this.getProperties(param1))
         {
            if(_loc2_.isUpgradable() && !_loc2_.getUpgradableValue().isFullUpgraded())
            {
               return false;
            }
         }
         return true;
      }
      
      public function hasNextModification(param1:IGameObject) : Boolean
      {
         var _loc2_:Vector.<IGameObject> = this.Renamed1706(param1);
         return param1 != _loc2_[_loc2_.length - 1];
      }
      
      public function Renamed3701(param1:ItemCategoryEnum) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed3682.length)
         {
            _loc2_ = this.Renamed3682[_loc3_];
            if(this.getCategory(_loc2_) == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
   }
}

