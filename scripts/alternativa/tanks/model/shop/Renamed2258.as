package alternativa.tanks.model.shop
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.country.CountryService;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.dropdownlist.DropDownList;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import Renamed371.Renamed2242;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed2239 extends Sprite
   {
      [Inject]
      public static var Renamed2243:CountryService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static var Renamed2244:Class = Renamed2245;
      
      private static const Renamed2246:BitmapData = new Renamed2244().bitmapData;
      
      public static const WINDOW_MARGIN:int = 11;
      
      private var Renamed2247:Bitmap;
      
      private var header:LabelBase;
      
      private var Renamed2248:TankWindowInner;
      
      public var Renamed2231:DropDownList;
      
      private var Renamed2249:LabelBase;
      
      private var Renamed2250:LabelBase;
      
      public function Renamed2239()
      {
         this.Renamed2250 = new LabelBase();
         super();
         this.Renamed2248 = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.Renamed2248);
         this.Renamed2247 = new Bitmap(Renamed2246);
         addChild(this.Renamed2247);
         this.Renamed2247.x = WINDOW_MARGIN;
         this.Renamed2247.y = 5;
         this.header = new LabelBase();
         addChild(this.header);
         this.header.multiline = true;
         this.header.wordWrap = true;
         this.header.x = this.Renamed2247.x + this.Renamed2247.width + WINDOW_MARGIN;
         this.header.htmlText = localeService.getText(TanksLocale.TEXT_SHOP_WINDOW_HEADER_DESCRIPTION);
         if(ShopWindow.haveDoubleCrystalls)
         {
            this.Renamed2250.multiline = true;
            this.Renamed2250.wordWrap = true;
            this.Renamed2250.x = this.Renamed2247.x + this.Renamed2247.width + WINDOW_MARGIN;
            this.Renamed2250.htmlText = localeService.getText(TanksLocale.TEXT_SHOP_CATEGORY_DOUBLE_CRYSTALS);
            this.Renamed2250.bold = true;
            this.Renamed2250.color = 16760355;
            addChild(this.Renamed2250);
         }
         if(Renamed2243.Renamed2251())
         {
            this.Renamed2231 = new DropDownList();
            this.Renamed2231.width = 160;
            this.Renamed2252();
            addChild(this.Renamed2231);
            this.Renamed2231.addEventListener(Event.CHANGE,this.Renamed2253);
            this.Renamed2249 = new LabelBase();
            this.Renamed2249.text = localeService.getText(TanksLocale.TEXT_CHECK_YOU_LOCATION_TEXT);
            addChild(this.Renamed2249);
         }
      }
      
      private function Renamed2253(param1:Event) : void
      {
         Renamed2243.Renamed2254(this.Renamed2231.selectedItem["code"]);
         dispatchEvent(new Event(Event.CLOSE));
         lobbyLayoutService.showPayment();
      }
      
      public function Renamed2252() : void
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
      
      public function resize(param1:int) : void
      {
         this.Renamed2248.width = param1;
         this.Renamed2248.height = this.Renamed2247.height + (ShopWindow.haveDoubleCrystalls ? 55 : 35);
         this.header.width = param1 - this.header.x - WINDOW_MARGIN;
         this.header.y = this.Renamed2247.y + (this.Renamed2247.height - this.header.textHeight >> 1);
         this.Renamed2250.width = param1 - this.header.x - WINDOW_MARGIN;
         this.Renamed2250.y = this.header.y + this.header.height;
         if(Renamed2243.Renamed2251())
         {
            this.Renamed2231.y = this.Renamed2248.height - this.Renamed2231.rowHeight - 15;
            this.Renamed2231.x = this.Renamed2248.width - this.Renamed2231.width + 5;
            this.Renamed2249.y = this.Renamed2231.y + 6;
            this.Renamed2249.x = this.Renamed2231.x - this.Renamed2249.width - 5;
         }
      }
      
      override public function get height() : Number
      {
         return this.Renamed2248.height;
      }
   }
}

