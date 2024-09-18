package projects.tanks.client.garage.models.item.upgradeable.types
{
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.upgradeable.calculators.LinearParams;
   
   public class GaragePropertyData
   {
      private var _costParams:LinearParams;
      
      private var _importance:Number;
      
      private var _level:int;
      
      private var _maxLevel:int;
      
      private var _properties:Vector.<PropertyData>;
      
      private var _property:ItemGarageProperty;
      
      private var _speedUpDiscount:int;
      
      private var _timeDiscount:int;
      
      private var _timeParams:LinearParams;
      
      private var _upgradeDiscount:int;
      
      public function GaragePropertyData(param1:LinearParams = null, param2:Number = 0, param3:int = 0, param4:int = 0, param5:Vector.<PropertyData> = null, param6:ItemGarageProperty = null, param7:int = 0, param8:int = 0, param9:LinearParams = null, param10:int = 0)
      {
         super();
         this._costParams = param1;
         this._importance = param2;
         this._level = param3;
         this._maxLevel = param4;
         this._properties = param5;
         this._property = param6;
         this._speedUpDiscount = param7;
         this._timeDiscount = param8;
         this._timeParams = param9;
         this._upgradeDiscount = param10;
      }
      
      public function get costParams() : LinearParams
      {
         return this._costParams;
      }
      
      public function set costParams(param1:LinearParams) : void
      {
         this._costParams = param1;
      }
      
      public function get importance() : Number
      {
         return this._importance;
      }
      
      public function set importance(param1:Number) : void
      {
         this._importance = param1;
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function set level(param1:int) : void
      {
         this._level = param1;
      }
      
      public function get maxLevel() : int
      {
         return this._maxLevel;
      }
      
      public function set maxLevel(param1:int) : void
      {
         this._maxLevel = param1;
      }
      
      public function get properties() : Vector.<PropertyData>
      {
         return this._properties;
      }
      
      public function set properties(param1:Vector.<PropertyData>) : void
      {
         this._properties = param1;
      }
      
      public function get property() : ItemGarageProperty
      {
         return this._property;
      }
      
      public function set property(param1:ItemGarageProperty) : void
      {
         this._property = param1;
      }
      
      public function get speedUpDiscount() : int
      {
         return this._speedUpDiscount;
      }
      
      public function set speedUpDiscount(param1:int) : void
      {
         this._speedUpDiscount = param1;
      }
      
      public function get timeDiscount() : int
      {
         return this._timeDiscount;
      }
      
      public function set timeDiscount(param1:int) : void
      {
         this._timeDiscount = param1;
      }
      
      public function get timeParams() : LinearParams
      {
         return this._timeParams;
      }
      
      public function set timeParams(param1:LinearParams) : void
      {
         this._timeParams = param1;
      }
      
      public function get upgradeDiscount() : int
      {
         return this._upgradeDiscount;
      }
      
      public function set upgradeDiscount(param1:int) : void
      {
         this._upgradeDiscount = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "GaragePropertyData [";
         _loc1_ += "costParams = " + this.costParams + " ";
         _loc1_ += "importance = " + this.importance + " ";
         _loc1_ += "level = " + this.level + " ";
         _loc1_ += "maxLevel = " + this.maxLevel + " ";
         _loc1_ += "properties = " + this.properties + " ";
         _loc1_ += "property = " + this.property + " ";
         _loc1_ += "speedUpDiscount = " + this.speedUpDiscount + " ";
         _loc1_ += "timeDiscount = " + this.timeDiscount + " ";
         _loc1_ += "timeParams = " + this.timeParams + " ";
         _loc1_ += "upgradeDiscount = " + this.upgradeDiscount + " ";
         return _loc1_ + "]";
      }
   }
}

