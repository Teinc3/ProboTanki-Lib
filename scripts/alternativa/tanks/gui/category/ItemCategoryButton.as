package alternativa.tanks.gui.category
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.buttons.FixedHeightButton;
   import controls.buttons.h30px.H30ButtonSkin;
   import controls.friends.NewRequestIndicator;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class ItemCategoryButton extends FixedHeightButton
   {
      public static const specialIconClass:Class = ItemCategoryButton_specialIconClass;
      
      public static const weaponIconClass:Class = ItemCategoryButton_weaponIconClass;
      
      public static const armorIconClass:Class = ItemCategoryButton_armorIconClass;
      
      public static const colorIconClass:Class = ItemCategoryButton_colorIconClass;
      
      public static const kitIconClass:Class = ItemCategoryButton_kitIconClass;
      
      public static const inventoryIconClass:Class = ItemCategoryButton_inventoryIconClass;
      
      public static const discountIconClass:Class = ItemCategoryButton_discountIconClass;
      
      public static const givenPresentsIconClass:Class = ItemCategoryButton_givenPresentsIconClass;
      
      private var _icon:Bitmap;
      
      private var _category:ItemViewCategoryEnum;
      
      private var _width:int;
      
      private var _newItemIndicator:Bitmap;
      
      private var _discountIndicator:Bitmap;
      
      public function ItemCategoryButton(param1:ItemViewCategoryEnum)
      {
         var _loc2_:String = null;
         this._newItemIndicator = new NewRequestIndicator.attentionIconClass();
         this._discountIndicator = new discountIconClass();
         super(new CategoryButtonSkin());
         enabled = true;
         this._category = param1;
         labelSize = H30ButtonSkin.DEFAULT_LABEL_SIZE;
         labelHeight = H30ButtonSkin.DEFAULT_LABEL_HEIGHT;
         labelPositionY = H30ButtonSkin.DEFAULT_LABEL_Y;
         _label.align = TextFormatAlign.LEFT;
         _label.autoSize = TextFieldAutoSize.LEFT;
         var _loc3_:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         switch(param1)
         {
            case ItemViewCategoryEnum.SPECIAL:
               this._icon = new specialIconClass();
               _loc2_ = _loc3_.getText(TextConst.STRING_GARAGE_CATEGORY_BUTTON_SPECIAL);
               break;
            case ItemViewCategoryEnum.WEAPON:
               this._icon = new weaponIconClass();
               _loc2_ = _loc3_.getText(TextConst.STRING_GARAGE_CATEGORY_BUTTON_TURRETS);
               break;
            case ItemViewCategoryEnum.ARMOR:
               this._icon = new armorIconClass();
               _loc2_ = _loc3_.getText(TextConst.STRING_GARAGE_CATEGORY_BUTTON_HULLS);
               break;
            case ItemViewCategoryEnum.PAINT:
               this._icon = new colorIconClass();
               _loc2_ = _loc3_.getText(TextConst.STRING_GARAGE_CATEGORY_BUTTON_PAINTS);
               break;
            case ItemViewCategoryEnum.KIT:
               this._icon = new kitIconClass();
               _loc2_ = _loc3_.getText(TextConst.STRING_GARAGE_CATEGORY_BUTTON_KITS);
               break;
            case ItemViewCategoryEnum.INVENTORY:
               this._icon = new inventoryIconClass();
               _loc2_ = _loc3_.getText(TextConst.STRING_GARAGE_CATEGORY_BUTTON_SUPPLIES);
               break;
            case ItemViewCategoryEnum.GIVEN_PRESENTS:
               this._icon = new givenPresentsIconClass();
               _loc2_ = _loc3_.getText(TextConst.STRING_GARAGE_CATEGORY_BUTTON_PRESENTS);
         }
         _innerLayer.addChild(this._icon);
         _label.text = _loc2_;
         addChild(this._newItemIndicator);
         this._newItemIndicator.y = -5;
         this._newItemIndicator.visible = false;
         addChild(this._discountIndicator);
         this._discountIndicator.y = -5;
         this._discountIndicator.visible = false;
         this.alignIcon();
      }
      
      public function getCategory() : ItemViewCategoryEnum
      {
         return this._category;
      }
      
      public function setIconState() : void
      {
         this._icon.visible = true;
         _label.visible = false;
         this.width = 30;
      }
      
      public function setTextState() : void
      {
         this._icon.visible = false;
         _label.visible = true;
         this.width = 6 + _label.width + 6;
      }
      
      public function setIconTextState() : void
      {
         this._icon.visible = true;
         _label.visible = true;
         this.width = 27 + _label.width + 6;
      }
      
      public function showNewItemIndicator() : void
      {
         this._newItemIndicator.visible = true;
      }
      
      public function hideNewItemIndicator() : void
      {
         this._newItemIndicator.visible = false;
      }
      
      public function showDiscountIndicator() : void
      {
         this._discountIndicator.visible = true;
      }
      
      public function hideDiscountIndicator() : void
      {
         this._discountIndicator.visible = false;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         if(_label.visible)
         {
            if(Boolean(this._icon) && this._icon.visible)
            {
               _label.x = 21 + (this._width - 21 - _label.width >> 1);
            }
            else
            {
               _label.x = this._width - _label.width >> 1;
            }
         }
         this._newItemIndicator.x = param1 - (this._newItemIndicator.width >> 1) - 4;
         this._discountIndicator.x = param1 - (this._discountIndicator.width >> 1) - 4;
         super.width = this._width;
      }
      
      private function alignIcon() : void
      {
         this._icon.x = 30 - this._icon.bitmapData.width >> 1;
         this._icon.y = 30 - this._icon.bitmapData.height >> 1;
      }
   }
}

