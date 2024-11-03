package projects.tanks.client.garage.models.item.upgradeable
{
   import projects.tanks.client.garage.models.item.upgradeable.types.GaragePropertyData;
   import projects.tanks.client.garage.models.item.upgradeable.types.UpgradingPropertyInfo;
   
   public class UpgradableParamsCC
   {
      private var _info:UpgradingPropertyInfo;
      
      private var _properties:Vector.<GaragePropertyData>;
      
      public function UpgradableParamsCC(param1:UpgradingPropertyInfo = null, param2:Vector.<GaragePropertyData> = null)
      {
         super();
         this._info = param1;
         this._properties = param2;
      }
      
      public function get info() : UpgradingPropertyInfo
      {
         return this._info;
      }
      
      public function set info(param1:UpgradingPropertyInfo) : void
      {
         this._info = param1;
      }
      
      public function get properties() : Vector.<GaragePropertyData>
      {
         return this._properties;
      }
      
      public function set properties(param1:Vector.<GaragePropertyData>) : void
      {
         this._properties = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UpgradableParamsCC [";
         _loc1_ += "info = " + this.info + " ";
         _loc1_ += "properties = " + this.properties + " ";
         return _loc1_ + "]";
      }
   }
}

