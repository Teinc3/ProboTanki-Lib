package Renamed438
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
   
   public class Renamed1712 extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var itemService:ItemService;
      
      private static const upgradeSelectionLeftClass:Class = Renamed8897;
      
      private static const upgradeSelectionCenterClass:Class = Renamed8898;
      
      private const Renamed8899:int = 12;
      
      private const Renamed8900:int = 13;
      
      private const Renamed8901:int = 4;
      
      private const Renamed8902:int = 17;
      
      private var selection:Shape;
      
      private var _width:int;
      
      private var Renamed8903:int;
      
      private var Renamed8904:int;
      
      private var Renamed8905:IGameObject;
      
      private var kit:GarageKit;
      
      public function Renamed1712(param1:int)
      {
         this.selection = new Shape();
         super();
         this._width = param1;
         this.Renamed8903 = 0;
      }
      
      public function show(param1:IGameObject) : void
      {
         this.Renamed8905 = param1;
         this.kit = GarageKit(param1.adapt(GarageKit));
         var _loc2_:int = int(this.kit.getItems().length);
         this.Renamed8903 = this.Renamed8899 + (_loc2_ + 2) * this.Renamed8902;
         this.Renamed8906();
         this.Renamed8907();
         this.Renamed8908();
         this.Renamed8909();
         this.Renamed8910();
      }
      
      public function Renamed8906() : void
      {
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
      
      private function Renamed8907() : void
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.color = 5898034;
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.text = localeService.getText(TanksLocale.TEXT_ITEMS_IN_KIT);
         _loc1_.x = this.Renamed8899;
         _loc1_.y = this.Renamed8899;
         addChild(_loc1_);
         var _loc2_:LabelBase = new LabelBase();
         _loc2_.color = 5898034;
         _loc2_.align = TextFormatAlign.RIGHT;
         _loc2_.text = localeService.getText(TanksLocale.TEXT_GARAGE_PRICE);
         _loc2_.x = this._width - _loc2_.width - _loc1_.x;
         _loc2_.y = _loc1_.y;
         addChild(_loc2_);
      }
      
      private function Renamed8908() : void
      {
         var _loc1_:KitItem = null;
         var _loc2_:Renamed4793 = null;
         this.kit.getItems().sort(this.Renamed8911);
         var _loc3_:int = this.Renamed8899 + this.Renamed8902;
         for each(_loc1_ in this.kit.getItems())
         {
            _loc2_ = new Renamed4793(_loc3_,this._width,_loc1_,this.Renamed8899,this.Renamed8901);
            addChild(_loc2_);
            _loc3_ += this.Renamed8902;
         }
      }
      
      private function Renamed8909() : void
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.color = 5898034;
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.text = localeService.getText(TanksLocale.TEXT_TOTAL_PRICE_KIT);
         _loc1_.x = this.Renamed8899;
         _loc1_.y = this.Renamed8899 + (this.kit.getItems().length + 1) * this.Renamed8902;
         addChild(_loc1_);
         var _loc2_:Diamond = new Diamond();
         _loc2_.x = this._width - _loc1_.x - _loc2_.width;
         addChild(_loc2_);
         _loc2_.y = _loc1_.y + this.Renamed8901;
         var _loc3_:LabelBase = new LabelBase();
         _loc3_.color = 5898034;
         _loc3_.align = TextFormatAlign.RIGHT;
         _loc3_.text = Money.numToString(this.kit.getPriceWithoutDiscount(),false);
         _loc3_.x = _loc2_.x - _loc3_.width - 1;
         _loc3_.y = _loc1_.y;
         addChild(_loc3_);
      }
      
      private function Renamed8910() : void
      {
         addChild(this.selection);
         this.selection.y = this.Renamed8900 + this.Renamed8903;
         this.resizeSelection();
         var _loc1_:int = itemService.getDiscount(this.Renamed8905);
         var _loc2_:int = itemService.getPrice(this.Renamed8905);
         var _loc3_:String = localeService.getText(TanksLocale.TEXT_DISCOUNTED_AT_KIT);
         _loc3_ = _loc3_.replace("{0}",_loc1_ + "%");
         this.Renamed8912(_loc3_,_loc2_,0,16777215);
         var _loc4_:int = this.kit.Renamed2136();
         var _loc5_:int = 1;
         if(_loc4_ > 0)
         {
            this.Renamed8912(localeService.getText(TanksLocale.TEXT_ALREADY_BOUGHT_KIT),_loc4_,1,9539985);
            _loc5_++;
         }
         this.Renamed8912(localeService.getText(TanksLocale.TEXT_YOU_SAVE_KIT),this.kit.Renamed2137(),_loc5_,16777215);
         this.Renamed8904 = (_loc5_ + 1) * this.Renamed8902;
      }
      
      private function Renamed8912(param1:String, param2:int, param3:int, param4:uint) : void
      {
         var _loc5_:LabelBase;
         (_loc5_ = new LabelBase()).color = param4;
         _loc5_.align = TextFormatAlign.LEFT;
         _loc5_.text = param1;
         _loc5_.x = this.Renamed8899;
         _loc5_.y = this.Renamed8900 + this.Renamed8903 + this.Renamed8902 * param3;
         addChild(_loc5_);
         var _loc6_:Diamond;
         (_loc6_ = new Diamond()).x = this._width - _loc5_.x - _loc6_.width;
         addChild(_loc6_);
         _loc6_.y = _loc5_.y + this.Renamed8901;
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
      
      private function Renamed8911(param1:KitItem, param2:KitItem) : Number
      {
         var _loc3_:int = this.Renamed8913(param1);
         var _loc4_:int = this.Renamed8913(param2);
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
      
      private function Renamed8913(param1:KitItem) : int
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
      
      public function Renamed1778() : int
      {
         return this.Renamed8903;
      }
      
      public function Renamed1777() : int
      {
         return this.Renamed8900 + this.Renamed8903 + this.Renamed8904;
      }
      
      public function Renamed1779() : int
      {
         return this.Renamed8904;
      }
   }
}

