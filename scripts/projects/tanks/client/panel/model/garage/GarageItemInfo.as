package projects.tanks.client.panel.model.garage
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class GarageItemInfo
   {
      private var _category:ItemCategoryEnum;
      
      private var _item:IGameObject;
      
      private var _itemViewCategory:ItemViewCategoryEnum;
      
      private var _modificationIndex:int;
      
      private var _mounted:Boolean;
      
      private var _name:String;
      
      private var _position:int;
      
      private var _premiumItem:Boolean;
      
      private var _preview:ImageResource;
      
      private var _remaingTimeInMS:int;
      
      public function GarageItemInfo(param1:ItemCategoryEnum = null, param2:IGameObject = null, param3:ItemViewCategoryEnum = null, param4:int = 0, param5:Boolean = false, param6:String = null, param7:int = 0, param8:Boolean = false, param9:ImageResource = null, param10:int = 0)
      {
         super();
         this._category = param1;
         this._item = param2;
         this._itemViewCategory = param3;
         this._modificationIndex = param4;
         this._mounted = param5;
         this._name = param6;
         this._position = param7;
         this._premiumItem = param8;
         this._preview = param9;
         this._remaingTimeInMS = param10;
      }
      
      public function get category() : ItemCategoryEnum
      {
         return this._category;
      }
      
      public function set category(param1:ItemCategoryEnum) : void
      {
         this._category = param1;
      }
      
      public function get item() : IGameObject
      {
         return this._item;
      }
      
      public function set item(param1:IGameObject) : void
      {
         this._item = param1;
      }
      
      public function get itemViewCategory() : ItemViewCategoryEnum
      {
         return this._itemViewCategory;
      }
      
      public function set itemViewCategory(param1:ItemViewCategoryEnum) : void
      {
         this._itemViewCategory = param1;
      }
      
      public function get modificationIndex() : int
      {
         return this._modificationIndex;
      }
      
      public function set modificationIndex(param1:int) : void
      {
         this._modificationIndex = param1;
      }
      
      public function get mounted() : Boolean
      {
         return this._mounted;
      }
      
      public function set mounted(param1:Boolean) : void
      {
         this._mounted = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get position() : int
      {
         return this._position;
      }
      
      public function set position(param1:int) : void
      {
         this._position = param1;
      }
      
      public function get premiumItem() : Boolean
      {
         return this._premiumItem;
      }
      
      public function set premiumItem(param1:Boolean) : void
      {
         this._premiumItem = param1;
      }
      
      public function get preview() : ImageResource
      {
         return this._preview;
      }
      
      public function set preview(param1:ImageResource) : void
      {
         this._preview = param1;
      }
      
      public function get remaingTimeInMS() : int
      {
         return this._remaingTimeInMS;
      }
      
      public function set remaingTimeInMS(param1:int) : void
      {
         this._remaingTimeInMS = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "GarageItemInfo [";
         _loc1_ += "category = " + this.category + " ";
         _loc1_ += "item = " + this.item + " ";
         _loc1_ += "itemViewCategory = " + this.itemViewCategory + " ";
         _loc1_ += "modificationIndex = " + this.modificationIndex + " ";
         _loc1_ += "mounted = " + this.mounted + " ";
         _loc1_ += "name = " + this.name + " ";
         _loc1_ += "position = " + this.position + " ";
         _loc1_ += "premiumItem = " + this.premiumItem + " ";
         _loc1_ += "preview = " + this.preview + " ";
         _loc1_ += "remaingTimeInMS = " + this.remaingTimeInMS + " ";
         return _loc1_ + "]";
      }
   }
}

