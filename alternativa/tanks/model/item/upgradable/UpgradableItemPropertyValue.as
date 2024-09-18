package alternativa.tanks.model.item.upgradable
{
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.calculators.GaragePropertyCalculator;
   import alternativa.tanks.model.item.upgradable.calculators.IGaragePropertyCalculator;
   import alternativa.tanks.model.item.upgradable.calculators.RangePropertyCalculator;
   import alternativa.tanks.model.item.upgradable.calculators.UpgradeLinearCalculator;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item.upgradable.speedup.SpeedUpCostCalculatorService;
   import alternativa.tanks.service.itempropertyparams.Renamed2149;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.itempropertyparams.Renamed1710;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   import projects.tanks.client.garage.models.item.upgradeable.types.GaragePropertyData;
   import projects.tanks.client.garage.models.item.upgradeable.types.PropertyData;
   
   public class UpgradableItemPropertyValue implements ItemPropertyValue
   {
      [Inject]
      public static var propertyParamsService:ItemPropertyParamsService;
      
      [Inject]
      public static var speedUpCostCalculator:SpeedUpCostCalculatorService;
      
      [Inject]
      public static var itemService:ItemService;
      
      private static const MAX_SALE:Number = 0.75;
      
      private var data:GaragePropertyData;
      
      private var costCalculator:UpgradeLinearCalculator;
      
      private var timeCalculator:UpgradeLinearCalculator;
      
      private var valueCalculator:IGaragePropertyCalculator;
      
      private var isDiscountForNextModification:Boolean;
      
      public function UpgradableItemPropertyValue(param1:GaragePropertyData, param2:Boolean)
      {
         var _loc3_:Renamed1710 = null;
         var _loc4_:PropertyData = null;
         var _loc5_:Vector.<GaragePropertyCalculator> = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         super();
         this.data = param1;
         this.costCalculator = new UpgradeLinearCalculator(param1.costParams);
         this.timeCalculator = new UpgradeLinearCalculator(param1.timeParams);
         this.isDiscountForNextModification = param2;
         _loc3_ = propertyParamsService.getParams(param1.property);
         var _loc9_:Vector.<ItemProperty> = _loc3_.getProperties();
         switch(_loc3_.Renamed2150())
         {
            case Renamed2149.Renamed2151:
               _loc5_ = new Vector.<GaragePropertyCalculator>();
               for each(_loc4_ in param1.properties)
               {
                  if(_loc9_.indexOf(_loc4_.property) != -1)
                  {
                     _loc5_.push(new GaragePropertyCalculator(_loc4_.initialValue,_loc4_.finalValue,this.data.maxLevel));
                  }
               }
               if(_loc5_.length != 2)
               {
                  throw new Error("Unexpected number subproperties: property=" + this.data.property + ";valueCalculators=" + _loc5_);
               }
               this.valueCalculator = new RangePropertyCalculator(_loc5_[0],_loc5_[1]);
               break;
            case Renamed2149.Renamed2152:
               _loc6_ = 0;
               _loc7_ = 0;
               for each(_loc4_ in param1.properties)
               {
                  if(_loc9_.indexOf(_loc4_.property) != -1)
                  {
                     _loc6_ += _loc4_.initialValue;
                     _loc7_ += _loc4_.finalValue;
                  }
               }
               _loc8_ = _loc3_.Renamed2153();
               _loc6_ *= _loc8_;
               _loc7_ *= _loc8_;
               this.valueCalculator = new GaragePropertyCalculator(_loc6_,_loc7_,this.data.maxLevel);
         }
      }
      
      public function isUpgradable() : Boolean
      {
         return true;
      }
      
      public function getUpgradableValue() : UpgradableItemPropertyValue
      {
         return this;
      }
      
      public function getCost() : int
      {
         var _loc1_:int = this.costCalculator.calculate(this.data.level);
         return this.evaluateValueWithDiscount(_loc1_,this.data.upgradeDiscount);
      }
      
      public function getTimeInSeconds() : int
      {
         return this.evaluateValueWithDiscount(this.getTimeWithoutDiscountInMinutes() * 60,this.data.timeDiscount);
      }
      
      private function getTimeWithoutDiscountInMinutes() : int
      {
         return this.timeCalculator.calculate(this.data.level);
      }
      
      public function getSpeedUpCost() : int
      {
         return speedUpCostCalculator.calculate(this.getTimeWithoutDiscountInMinutes(),this.data.speedUpDiscount);
      }
      
      public function getValue() : String
      {
         return this.valueCalculator.getValue(this.data.level);
      }
      
      public function getProperty() : ItemGarageProperty
      {
         return this.data.property;
      }
      
      public function getLevel() : int
      {
         return this.data.level;
      }
      
      public function getMaxLevel() : int
      {
         return this.data.maxLevel;
      }
      
      public function isFullUpgraded() : Boolean
      {
         return this.data.level == this.data.maxLevel;
      }
      
      public function getDiscount() : Number
      {
         if(this.isDiscountForNextModification && this.isFullUpgraded())
         {
            return this.data.importance * MAX_SALE;
         }
         return 0;
      }
      
      public function incrementLevel() : void
      {
         ++this.data.level;
      }
      
      public function getNextValue() : String
      {
         return this.valueCalculator.getValue(this.data.level + 1);
      }
      
      public function getDelta() : String
      {
         return this.valueCalculator.getDelta(this.data.level);
      }
      
      public function getPrecision() : int
      {
         return this.valueCalculator.getPrecision();
      }
      
      public function setPrecision(param1:int) : void
      {
         this.valueCalculator.setPrecision(param1);
      }
      
      private function evaluateValueWithDiscount(param1:int, param2:int) : int
      {
         return param1 * (100 - param2) * 0.01 + 0.001;
      }
      
      public function traceUpgrades() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.getMaxLevel())
         {
            _loc1_ = this.timeCalculator.calculate(_loc2_);
            _loc2_++;
         }
      }
   }
}

