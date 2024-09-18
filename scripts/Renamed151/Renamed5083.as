package Renamed151
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.country.CountryService;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.dropdownlist.DropDownList;
   import flash.events.MouseEvent;
   import Renamed371.Renamed2242;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class Renamed4798 extends DialogWindow
   {
      [Inject]
      public static var Renamed2243:CountryService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const TOP_PADDING:int = 20;
      
      private var okButton:DefaultButtonBase;
      
      private var Renamed2231:DropDownList;
      
      private var Renamed5081:Function;
      
      public function Renamed4798(param1:Function)
      {
         var _loc3_:LabelBase = null;
         super();
         this.Renamed5081 = param1;
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
         this.Renamed2231 = new DropDownList();
         this.Renamed2231.width = _loc2_.width - 45 - _loc3_.width;
         this.Renamed2231.y = this.TOP_PADDING;
         this.Renamed2252();
         addChild(this.Renamed2231);
         this.Renamed2231.x = _loc3_.x + _loc3_.width + 5;
         dialogService.addDialog(this);
      }
      
      private function Renamed2252() : void
      {
         var _loc1_:Vector.<Renamed2242> = Renamed2243.Renamed2255();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.Renamed2231.addItem({
               "rang":0,
               "index":_loc2_,
               "id":_loc2_,
               "gameName":_loc1_[_loc2_].countryName,
               "code":_loc1_[_loc2_].Renamed2256
            });
            _loc2_++;
         }
         this.Renamed2231.sortOn("gameName");
         if(Renamed2243.Renamed2257())
         {
            this.Renamed2231.selectItemByField("code",Renamed2243.Renamed2257());
         }
         else
         {
            this.Renamed2231.selectItemByField("id",0);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dialogService.removeDialog(this);
         this.Renamed5081(this.Renamed2231.selectedItem["code"]);
         this.Renamed5082();
      }
      
      private function Renamed5082() : void
      {
         this.okButton.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.Renamed5081 = null;
         this.okButton = null;
         this.Renamed2231 = null;
      }
   }
}

