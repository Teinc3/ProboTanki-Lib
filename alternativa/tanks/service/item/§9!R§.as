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
   import §override const finally§.§default const dynamic§;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class §9!R§ extends EventDispatcher implements ItemService
   {
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      [Inject]
      public static var garageService:GarageService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var §each const implements§:Dictionary;
      
      private var §'"=§:Dictionary;
      
      private var §continue use§:Dictionary;
      
      private var §extends default§:Vector.<IGameObject>;
      
      private var §true implements§:Dictionary;
      
      private var §=!<§:Dictionary;
      
      private const §>#y§:int = 5;
      
      public function §9!R§()
      {
         super();
         this.§extends default§ = new Vector.<IGameObject>();
         this.§each const implements§ = new Dictionary();
         this.§'"=§ = new Dictionary();
         this.§continue use§ = new Dictionary();
         this.§=!<§ = new Dictionary();
         this.§true implements§ = new Dictionary();
         this.§true implements§[ItemGarageProperty.FIREBIRD_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_FIREBIRD;
         this.§true implements§[ItemGarageProperty.FREEZE_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_FREEZE;
         this.§true implements§[ItemGarageProperty.ISIS_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_ISIDA;
         this.§true implements§[ItemGarageProperty.RAILGUN_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_RAILGUN;
         this.§true implements§[ItemGarageProperty.RICOCHET_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_RICOCHET;
         this.§true implements§[ItemGarageProperty.SHAFT_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_SHAFT;
         this.§true implements§[ItemGarageProperty.SMOKY_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_SMOKY;
         this.§true implements§[ItemGarageProperty.THUNDER_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_THUNDER;
         this.§true implements§[ItemGarageProperty.TWINS_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_TWINS;
         this.§true implements§[ItemGarageProperty.MINE_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_MINE;
         this.§true implements§[ItemGarageProperty.SHOTGUN_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_SHOTGUN;
         this.§true implements§[ItemGarageProperty.MACHINE_GUN_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_MACHINE_GUN;
      }
      
      public function addItem(param1:IGameObject) : void
      {
         if(param1 in this.§each const implements§)
         {
            return;
         }
         this.§each const implements§[param1] = true;
         dispatchEvent(new §^"y§(§^"y§.§3#!§,param1));
      }
      
      public function §^#x§(param1:IGameObject) : ItemViewCategoryEnum
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
      
      public function §!#P§(param1:IGameObject) : IGameObject
      {
         var _loc2_:int = this.getModificationIndex(param1);
         var _loc3_:Vector.<IGameObject> = this.§;#U§(param1);
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
                  for each(_loc5_ in this.§true implements§)
                  {
                     _loc4_ += localeService.getText(_loc5_) + "\n";
                  }
               }
               else
               {
                  for each(_loc3_ in _loc2_)
                  {
                     _loc4_ += localeService.getText(this.§true implements§[_loc3_.getProperty()]) + "\n";
                  }
               }
               _loc4_ += "\n";
            }
         }
         return _loc4_ + IDescription(param1.adapt(IDescription)).getDescription();
      }
      
      public function §8#X§(param1:ItemCategoryEnum) : void
      {
         this.§=!<§[param1] = true;
      }
      
      public function getUpgradableProperties(param1:IGameObject) : Vector.<UpgradableItemPropertyValue>
      {
         if(param1.hasModel(UpgradableItem))
         {
            return this.§break set§(param1).getUpgradableProperties();
         }
         return null;
      }
      
      private function §break set§(param1:IGameObject) : UpgradableItem
      {
         return UpgradableItem(param1.adapt(UpgradableItem));
      }
      
      public function §include for each§(param1:IGameObject) : Boolean
      {
         return this.§=!<§[this.getCategory(param1)] == true;
      }
      
      public function §null var continue§(param1:IGameObject) : Boolean
      {
         return param1 in this.§each const implements§;
      }
      
      public function reset() : void
      {
         this.§'"=§ = new Dictionary();
         this.§each const implements§ = new Dictionary();
         this.§=!<§ = new Dictionary();
         this.§extends default§.length = 0;
      }
      
      public function getName(param1:IGameObject) : String
      {
         var _loc2_:String = IDescription(param1.adapt(IDescription)).getName();
         if(this.§!"p§(param1))
         {
            _loc2_ += (localeService.language == "cn" ? "" : " ") + "M" + this.getModificationIndex(param1);
         }
         return _loc2_;
      }
      
      public function getPrice(param1:IGameObject) : int
      {
         if(this.§2"J§(param1))
         {
            return GarageKit(param1.adapt(GarageKit)).getPrice();
         }
         return IBuyable(param1.adapt(IBuyable)).getPrice();
      }
      
      public function getTimeLeftInSeconds(param1:IGameObject) : int
      {
         var _loc2_:int = TimePeriod(param1.adapt(TimePeriod)).getTimeLeftInSeconds();
         return _loc2_ > this.§>#y§ ? int(_loc2_ - this.§>#y§) : int(0);
      }
      
      public function §>#J§(param1:IGameObject) : Boolean
      {
         return TimePeriod(param1.adapt(TimePeriod)).isTimeless();
      }
      
      public function getTimeToStartInSeconds(param1:IGameObject) : int
      {
         var _loc2_:int = TimePeriod(param1.adapt(TimePeriod)).getTimeToStartInSeconds();
         return _loc2_ > 0 ? int(_loc2_ + this.§>#y§) : int(0);
      }
      
      private function §!#&§(param1:IGameObject) : Boolean
      {
         var _loc2_:int = TimePeriod(param1.adapt(TimePeriod)).getModelLoadingTimeInMillis();
         return getTimer() > _loc2_ + this.getTimeToStartInSeconds(param1) * 1000;
      }
      
      private function §""M§(param1:IGameObject) : Boolean
      {
         var _loc2_:int = TimePeriod(param1.adapt(TimePeriod)).getTimeLeftInSeconds();
         return _loc2_ > 0 && _loc2_ <= this.§>#y§;
      }
      
      public function §[#e§(param1:IGameObject) : Boolean
      {
         var _loc2_:Boolean = TimePeriod(param1.adapt(TimePeriod)).isEnabled();
         return _loc2_ && !this.§""M§(param1) || this.getTimeToStartInSeconds(param1) > 0 && this.§!#&§(param1);
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
      
      public function §!"p§(param1:IGameObject) : Boolean
      {
         return param1.hasModel(IModification) && IModification(param1.adapt(IModification)).getModificationIndex() >= 0;
      }
      
      public function §static set default§(param1:IGameObject) : Boolean
      {
         return false;
      }
      
      public function §extends const each§(param1:IGameObject) : Boolean
      {
         return this.getCategory(param1) == ItemCategoryEnum.PRESENT;
      }
      
      public function §while try§(param1:IGameObject) : Boolean
      {
         return this.getCategory(param1) == ItemCategoryEnum.GIVEN_PRESENT;
      }
      
      public function getCategory(param1:IGameObject) : ItemCategoryEnum
      {
         return IItemCategory(param1.adapt(IItemCategory)).getCategory();
      }
      
      public function canBuy(param1:IGameObject) : Boolean
      {
         if(this.§2"J§(param1))
         {
            return GarageKit(param1.adapt(GarageKit)).canBuy();
         }
         return this.isCountable(param1) || !this.§null var continue§(param1);
      }
      
      public function getCount(param1:IGameObject) : int
      {
         if(param1.hasModel(ICountableItem))
         {
            return ICountableItem(param1.adapt(ICountableItem)).getCount();
         }
         return 0;
      }
      
      public function §6#y§(param1:IGameObject) : IGameObject
      {
         var _loc2_:int = this.getModificationIndex(param1);
         var _loc3_:Vector.<IGameObject> = this.§;#U§(param1);
         if(_loc2_ < _loc3_.length - 1)
         {
            return _loc3_[_loc2_ + 1];
         }
         return param1;
      }
      
      public function getModificationIndex(param1:IGameObject) : int
      {
         if(this.§!"p§(param1))
         {
            return IModification(param1.adapt(IModification)).getModificationIndex();
         }
         return -1;
      }
      
      public function §;#U§(param1:IGameObject) : Vector.<IGameObject>
      {
         var _loc2_:Vector.<IGameObject> = null;
         var _loc3_:Dictionary = null;
         var _loc4_:int = 0;
         var _loc5_:Long = null;
         var _loc6_:int = 0;
         var _loc7_:IGameObject = null;
         var _loc8_:int = 0;
         var _loc9_:Vector.<IGameObject> = this.§'"=§[param1];
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
               if(this.§0#[§(IModification(_loc7_.adapt(IModification)).getBaseItemId(),_loc5_))
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
         this.§'"=§[param1] = _loc9_;
         return _loc9_;
      }
      
      private function §0#[§(param1:Long, param2:Long) : Boolean
      {
         return param1.high == param2.high && param1.low == param2.low;
      }
      
      private function §extends set each§(param1:Vector.<IGameObject>) : void
      {
         var §for const break§:Vector.<IGameObject> = param1;
         var §for default§:Vector.<IGameObject> = null;
         var §false use§:IGameObject = null;
         var § !3§:Function = null;
         var §final package§:int = 0;
         var §if set with§:int = 0;
         var §+# §:Vector.<IGameObject> = null;
         var §while package do§:IGameObject = null;
         var §`!y§:Vector.<IGameObject> = §for const break§;
         if(this.§'"=§ == null)
         {
            this.§'"=§ = new Dictionary();
            §for default§ = new Vector.<IGameObject>();
            for each(§false use§ in §`!y§)
            {
               if(§false use§.hasModel(IModification))
               {
                  §for default§.push(§false use§);
               }
            }
            § !3§ = function(param1:IGameObject, param2:IGameObject):int
            {
               var _loc3_:Long = IModification(param1.adapt(IModification)).getBaseItemId();
               var _loc4_:Long = IModification(param2.adapt(IModification)).getBaseItemId();
               return Long.comparator(_loc3_,_loc4_);
            };
            §for default§.sort(§ !3§);
            §final package§ = 0;
            while(§final package§ < §for default§.length)
            {
               §if set with§ = §final package§ + 1;
               while(§if set with§ < §for default§.length && § !3§(§for default§[§final package§],§for default§[§if set with§]) == 0)
               {
                  §if set with§++;
               }
               §+# § = new Vector.<IGameObject>(§if set with§ - §final package§);
               while(§final package§ < §if set with§)
               {
                  §while package do§ = §for default§[§final package§];
                  §+# §[IModification(§while package do§.adapt(IModification)).getModificationIndex()] = §while package do§;
                  this.§'"=§[§while package do§] = §+# §;
                  §final package§++;
               }
            }
         }
      }
      
      public function §final var catch§(param1:IGameObject) : int
      {
         return this.§;#U§(param1).length;
      }
      
      public function §case const else§(param1:IGameObject) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc3_:Vector.<IGameObject> = this.§;#U§(param1);
         var _loc4_:int = int(_loc3_.length - 1);
         while(_loc4_ >= 0)
         {
            _loc2_ = _loc3_[_loc4_];
            if(this.§null var continue§(_loc2_))
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
      
      public function §,$!§(param1:IGameObject) : int
      {
         return IItem(param1.adapt(IItem)).getMinRank();
      }
      
      public function §[!@§(param1:IGameObject) : int
      {
         return IItem(param1.adapt(IItem)).getMaxRank();
      }
      
      public function §override const class§(param1:IGameObject) : IGameObject
      {
         var _loc2_:IGameObject = this.§0",§(param1);
         if(_loc2_ == param1)
         {
            _loc2_ = this.§6#y§(param1);
         }
         return _loc2_;
      }
      
      public function §0",§(param1:IGameObject) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = null;
         if(userPropertyService.rank < this.§,$!§(param1))
         {
            return param1;
         }
         var _loc4_:Vector.<IGameObject> = this.§;#U§(param1);
         var _loc5_:int;
         var _loc6_:int = (_loc5_ = int(_loc4_.length)) - 1;
         while(_loc6_ >= 0)
         {
            _loc3_ = _loc4_[_loc6_];
            if(userPropertyService.rank >= this.§,$!§(_loc3_))
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
         if(this.§null var continue§(param1))
         {
            delete this.§each const implements§[param1];
         }
      }
      
      public function §2"J§(param1:IGameObject) : Boolean
      {
         return this.getCategory(param1) == ItemCategoryEnum.KIT && param1.hasModel(GarageKit) && GarageKit(param1.adapt(GarageKit)).getImage != null;
      }
      
      public function isGrouped(param1:IGameObject) : Boolean
      {
         return param1.hasModel(§default const dynamic§) && §default const dynamic§(param1.adapt(§default const dynamic§)).isGrouped();
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
         var _loc2_:IGameObject = this.§continue for in§(this.getCategory(param1));
         if(_loc2_ == param1)
         {
            return;
         }
         var _loc3_:GarageWindow = garageService.§!E§();
         if(_loc2_ != null)
         {
            _loc3_.unmountItem(_loc2_);
            this.§extends default§.splice(this.§extends default§.indexOf(_loc2_),1);
         }
         _loc3_.mountItem(param1);
         this.§extends default§.push(param1);
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
         return param1.hasModel(UpgradableItem) && this.§break set§(param1).isUpgrading();
      }
      
      public function getUpgradingProperty(param1:IGameObject) : ItemGarageProperty
      {
         return this.§break set§(param1).getUpgradingProperty();
      }
      
      public function §,!S§(param1:IGameObject) : Boolean
      {
         return this.§continue for in§(this.getCategory(param1)) == param1;
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
         var _loc2_:Vector.<IGameObject> = this.§;#U§(param1);
         return param1 != _loc2_[_loc2_.length - 1];
      }
      
      public function §continue for in§(param1:ItemCategoryEnum) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.§extends default§.length)
         {
            _loc2_ = this.§extends default§[_loc3_];
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

