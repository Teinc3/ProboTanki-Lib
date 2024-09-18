package §true catch final§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.service.item.ItemService;
   import assets.Diamond;
   import controls.Money;
   import controls.base.LabelBase;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFormatAlign;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §#!q§ extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var itemService:ItemService;
      
      private static const upgradeSelectionLeftClass:Class = §6r§;
      
      private static const upgradeSelectionCenterClass:Class = §']§;
      
      private const §##<§:int = 12;
      
      private const §super for set§:int = 13;
      
      private const §!"^§:int = 4;
      
      private const §if package catch§:int = 17;
      
      private var selection:Shape;
      
      private var _width:int;
      
      private var §finally catch class§:int;
      
      private var §+#1§:int;
      
      private var §default set throw§:IGameObject;
      
      private var kit:GarageKit;
      
      public function §#!q§(param1:int)
      {
         this.selection = new Shape();
         super();
         this._width = param1;
         this.§finally catch class§ = 0;
      }
      
      public function show(param1:IGameObject) : void
      {
         this.§default set throw§ = param1;
         this.kit = GarageKit(param1.adapt(GarageKit));
         var _loc2_:int = int(this.kit.getItems().length);
         this.§finally catch class§ = this.§##<§ + (_loc2_ + 2) * this.§if package catch§;
         this.§?!p§();
         this.§extends var for§();
         this.§do for super§();
         this.§final for return§();
         this.§3"x§();
      }
      
      public function §?!p§() : void
      {
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
      
      private function §extends var for§() : void
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.color = 5898034;
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.text = localeService.getText(TanksLocale.TEXT_ITEMS_IN_KIT);
         _loc1_.x = this.§##<§;
         _loc1_.y = this.§##<§;
         addChild(_loc1_);
         var _loc2_:LabelBase = new LabelBase();
         _loc2_.color = 5898034;
         _loc2_.align = TextFormatAlign.RIGHT;
         _loc2_.text = localeService.getText(TanksLocale.TEXT_GARAGE_PRICE);
         _loc2_.x = this._width - _loc2_.width - _loc1_.x;
         _loc2_.y = _loc1_.y;
         addChild(_loc2_);
      }
      
      private function §do for super§() : void
      {
         var _loc1_:KitItem = null;
         var _loc2_:§"#=§ = null;
         this.kit.getItems().sort(this.§@#"§);
         var _loc3_:int = this.§##<§ + this.§if package catch§;
         for each(_loc1_ in this.kit.getItems())
         {
            _loc2_ = new §"#=§(_loc3_,this._width,_loc1_,this.§##<§,this.§!"^§);
            addChild(_loc2_);
            _loc3_ += this.§if package catch§;
         }
      }
      
      private function §final for return§() : void
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.color = 5898034;
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.text = localeService.getText(TanksLocale.TEXT_TOTAL_PRICE_KIT);
         _loc1_.x = this.§##<§;
         _loc1_.y = this.§##<§ + (this.kit.getItems().length + 1) * this.§if package catch§;
         addChild(_loc1_);
         var _loc2_:Diamond = new Diamond();
         _loc2_.x = this._width - _loc1_.x - _loc2_.width;
         addChild(_loc2_);
         _loc2_.y = _loc1_.y + this.§!"^§;
         var _loc3_:LabelBase = new LabelBase();
         _loc3_.color = 5898034;
         _loc3_.align = TextFormatAlign.RIGHT;
         _loc3_.text = Money.numToString(this.kit.getPriceWithoutDiscount(),false);
         _loc3_.x = _loc2_.x - _loc3_.width - 1;
         _loc3_.y = _loc1_.y;
         addChild(_loc3_);
      }
      
      private function §3"x§() : void
      {
         addChild(this.selection);
         this.selection.y = this.§super for set§ + this.§finally catch class§;
         this.resizeSelection();
         var _loc1_:int = itemService.getDiscount(this.§default set throw§);
         var _loc2_:int = itemService.getPrice(this.§default set throw§);
         var _loc3_:String = localeService.getText(TanksLocale.TEXT_DISCOUNTED_AT_KIT);
         _loc3_ = _loc3_.replace("{0}",_loc1_ + "%");
         this.§"! §(_loc3_,_loc2_,0,16777215);
         var _loc4_:int = this.kit.§set super§();
         var _loc5_:int = 1;
         if(_loc4_ > 0)
         {
            this.§"! §(localeService.getText(TanksLocale.TEXT_ALREADY_BOUGHT_KIT),_loc4_,1,9539985);
            _loc5_++;
         }
         this.§"! §(localeService.getText(TanksLocale.TEXT_YOU_SAVE_KIT),this.kit.§static if§(),_loc5_,16777215);
         this.§+#1§ = (_loc5_ + 1) * this.§if package catch§;
      }
      
      private function §"! §(param1:String, param2:int, param3:int, param4:uint) : void
      {
         var _loc5_:LabelBase;
         (_loc5_ = new LabelBase()).color = param4;
         _loc5_.align = TextFormatAlign.LEFT;
         _loc5_.text = param1;
         _loc5_.x = this.§##<§;
         _loc5_.y = this.§super for set§ + this.§finally catch class§ + this.§if package catch§ * param3;
         addChild(_loc5_);
         var _loc6_:Diamond;
         (_loc6_ = new Diamond()).x = this._width - _loc5_.x - _loc6_.width;
         addChild(_loc6_);
         _loc6_.y = _loc5_.y + this.§!"^§;
         var _loc7_:LabelBase;
         (_loc7_ = new LabelBase()).color = param2 >= 0 ? uint(param4) : uint(16727340);
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.text = Money.numToString(param2,false);
         _loc7_.x = _loc6_.x - _loc7_.width - 1;
         _loc7_.y = _loc5_.y;
         addChild(_loc7_);
      }
      
      private function resizeSelection() : void
      {
         var _loc1_:int = this._width - 18;
         var _loc2_:BitmapData = new upgradeSelectionLeftClass().bitmapData;
         this.selection.x = 9;
         this.selection.graphics.clear();
         this.selection.graphics.beginBitmapFill(_loc2_);
         this.selection.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         var _loc3_:BitmapData = new upgradeSelectionCenterClass().bitmapData;
         this.selection.graphics.beginBitmapFill(_loc3_);
         this.selection.graphics.drawRect(_loc2_.width,0,_loc1_ - _loc2_.width * 2,_loc3_.height);
         var _loc4_:Matrix = new Matrix(-1,0,0,1,_loc1_,0);
         this.selection.graphics.beginBitmapFill(_loc2_,_loc4_);
         this.selection.graphics.drawRect(_loc1_ - _loc2_.width,0,_loc2_.width,_loc2_.height);
         this.selection.graphics.endFill();
      }
      
      private function §@#"§(param1:KitItem, param2:KitItem) : Number
      {
         var _loc3_:int = this.§@#f§(param1);
         var _loc4_:int = this.§@#f§(param2);
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         var _loc5_:int = itemService.getPrice(param1.item) * param1.count;
         var _loc6_:int = itemService.getPrice(param2.item) * param2.count;
         if(_loc5_ < _loc6_)
         {
            return 1;
         }
         if(_loc5_ > _loc6_)
         {
            return -1;
         }
         return 0;
      }
      
      private function §@#f§(param1:KitItem) : int
      {
         switch(itemService.getCategory(param1.item))
         {
            case ItemCategoryEnum.WEAPON:
               return 0;
            case ItemCategoryEnum.ARMOR:
               return 1;
            case ItemCategoryEnum.INVENTORY:
               return 3;
            case ItemCategoryEnum.PLUGIN:
               return 4;
            case ItemCategoryEnum.COLOR:
               return 5;
            default:
               return 6;
         }
      }
      
      public function §get set with§() : int
      {
         return this.§finally catch class§;
      }
      
      public function §'!Z§() : int
      {
         return this.§super for set§ + this.§finally catch class§ + this.§+#1§;
      }
      
      public function §null for override§() : int
      {
         return this.§+#1§;
      }
   }
}

