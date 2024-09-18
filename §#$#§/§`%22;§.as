package §#$#§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.country.CountryService;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.dropdownlist.DropDownList;
   import flash.events.MouseEvent;
   import §for package case§.§for else§;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class §`";§ extends DialogWindow
   {
      [Inject]
      public static var §"!b§:CountryService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const TOP_PADDING:int = 20;
      
      private var okButton:DefaultButtonBase;
      
      private var §[1§:DropDownList;
      
      private var §&#>§:Function;
      
      public function §`";§(param1:Function)
      {
         var _loc3_:LabelBase = null;
         super();
         this.§&#>§ = param1;
         var _loc2_:TankWindow = new TankWindow(340,140);
         addChild(_loc2_);
         this.okButton = new DefaultButtonBase();
         this.okButton.label = localeService.getText(TanksLocale.TEXT_ALERT_ANSWER_OK);
         this.okButton.x = (width - this.okButton.width) / 2;
         this.okButton.y = _loc2_.height - this.okButton.height - 20;
         this.okButton.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.okButton);
         _loc3_ = new LabelBase();
         _loc3_.text = localeService.getText(TanksLocale.TEXT_CHECK_YOU_LOCATION_TEXT);
         _loc3_.x = this.TOP_PADDING;
         _loc3_.y = this.TOP_PADDING + 5;
         addChild(_loc3_);
         var _loc4_:LabelBase;
         (_loc4_ = new LabelBase()).text = localeService.getText(TanksLocale.TEXT_YOURE_LOCATION_TEXT);
         _loc4_.x = this.TOP_PADDING;
         _loc4_.y = 55;
         _loc4_.width = 300;
         _loc4_.wordWrap = true;
         addChild(_loc4_);
         this.§[1§ = new DropDownList();
         this.§[1§.width = _loc2_.width - 45 - _loc3_.width;
         this.§[1§.y = this.TOP_PADDING;
         this.§break catch finally§();
         addChild(this.§[1§);
         this.§[1§.x = _loc3_.x + _loc3_.width + 5;
         dialogService.addDialog(this);
      }
      
      private function §break catch finally§() : void
      {
         var _loc1_:Vector.<§for else§> = §"!b§.§[!S§();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.§[1§.addItem({
               "rang":0,
               "index":_loc2_,
               "id":_loc2_,
               "gameName":_loc1_[_loc2_].countryName,
               "code":_loc1_[_loc2_].§throw const var§
            });
            _loc2_++;
         }
         this.§[1§.sortOn("gameName");
         if(§"!b§.§1#A§())
         {
            this.§[1§.selectItemByField("code",§"!b§.§1#A§());
         }
         else
         {
            this.§[1§.selectItemByField("id",0);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dialogService.removeDialog(this);
         this.§&#>§(this.§[1§.selectedItem["code"]);
         this.§4#E§();
      }
      
      private function §4#E§() : void
      {
         this.okButton.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.§&#>§ = null;
         this.okButton = null;
         this.§[1§ = null;
      }
   }
}

