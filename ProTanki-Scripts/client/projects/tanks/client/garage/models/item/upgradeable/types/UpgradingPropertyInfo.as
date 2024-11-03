package projects.tanks.client.garage.models.item.upgradeable.types
{
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public class UpgradingPropertyInfo
   {
      private var _property:ItemGarageProperty;
      
      private var _remainingTimeInMS:int;
      
      public function UpgradingPropertyInfo(param1:ItemGarageProperty = null, param2:int = 0)
      {
         super();
         this._property = param1;
         this._remainingTimeInMS = param2;
      }
      
      public function get property() : ItemGarageProperty
      {
         return this._property;
      }
      
      public function set property(param1:ItemGarageProperty) : void
      {
         this._property = param1;
      }
      
      public function get remainingTimeInMS() : int
      {
         return this._remainingTimeInMS;
      }
      
      public function set remainingTimeInMS(param1:int) : void
      {
         this._remainingTimeInMS = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UpgradingPropertyInfo [";
         _loc1_ += "property = " + this.property + " ";
         _loc1_ += "remainingTimeInMS = " + this.remainingTimeInMS + " ";
         return _loc1_ + "]";
      }
   }
}

