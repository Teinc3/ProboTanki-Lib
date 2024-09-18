package §true catch final§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.item.ItemService;
   import assets.Diamond;
   import controls.Money;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §"#=§ extends Sprite
   {
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function §"#=§(param1:int, param2:int, param3:KitItem, param4:int, param5:int)
      {
         var _loc12_:uint = 0;
         var _loc6_:LabelBase = null;
         var _loc7_:Number = NaN;
         super();
         var _loc8_:int = 45;
         if(localeService.language == "cn")
         {
            _loc8_ = 59;
         }
         var _loc9_:int = param2;
         this.y = param1;
         var _loc10_:IGameObject = param3.item;
         var _loc11_:Boolean = itemService.§null var continue§(_loc10_) && !itemService.isCountable(_loc10_) && itemService.getCategory(_loc10_) != ItemCategoryEnum.PLUGIN;
         _loc12_ = !_loc11_ ? uint(16777215) : uint(9539985);
         var _loc13_:LabelBase;
         (_loc13_ = new LabelBase()).color = _loc12_;
         _loc13_.align = TextFormatAlign.LEFT;
         _loc13_.text = itemService.getName(param3.item) + (param3.count <= 1 ? "" : " ×" + String(param3.count));
         _loc13_.x = param4;
         addChild(_loc13_);
         if(_loc11_)
         {
            _loc13_.text += " " + localeService.getText(TanksLocale.TEXT_BOUGHT_STATUS_KIT);
         }
         var _loc14_:Diamond;
         (_loc14_ = new Diamond()).x = _loc9_ - _loc13_.x - _loc14_.width;
         addChild(_loc14_);
         _loc14_.y = param5;
         var _loc15_:int = itemService.getPriceWithoutDiscount(param3.item) * param3.count;
         var _loc16_:LabelBase;
         (_loc16_ = new LabelBase()).color = _loc12_;
         _loc16_.align = TextFormatAlign.RIGHT;
         _loc16_.text = Money.numToString(_loc15_,false);
         _loc16_.x = _loc14_.x - _loc16_.width - 1;
         addChild(_loc16_);
         if(!_loc11_)
         {
            _loc6_ = new LabelBase();
            _loc7_ = itemService.getDiscount(param3.item);
            if(_loc7_ > 0)
            {
               _loc6_.bold = true;
               _loc6_.color = 16727340;
               _loc6_.align = TextFormatAlign.RIGHT;
               _loc6_.text = "-" + String(_loc7_) + "%";
               _loc6_.x = _loc14_.x - _loc8_ - _loc6_.width;
               addChild(_loc6_);
            }
         }
      }
   }
}

