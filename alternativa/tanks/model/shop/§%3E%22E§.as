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
   import §for package case§.§for else§;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class §>"E§ extends Sprite
   {
      [Inject]
      public static var §"!b§:CountryService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static var §false static§:Class = §1#]§;
      
      private static const §]! §:BitmapData = new §false static§().bitmapData;
      
      public static const WINDOW_MARGIN:int = 11;
      
      private var § #g§:Bitmap;
      
      private var header:LabelBase;
      
      private var §5#`§:TankWindowInner;
      
      public var §[1§:DropDownList;
      
      private var §implements var class§:LabelBase;
      
      private var §use var else§:LabelBase;
      
      public function §>"E§()
      {
         this.§use var else§ = new LabelBase();
         super();
         this.§5#`§ = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.§5#`§);
         this.§ #g§ = new Bitmap(§]! §);
         addChild(this.§ #g§);
         this.§ #g§.x = WINDOW_MARGIN;
         this.§ #g§.y = 5;
         this.header = new LabelBase();
         addChild(this.header);
         this.header.multiline = true;
         this.header.wordWrap = true;
         this.header.x = this.§ #g§.x + this.§ #g§.width + WINDOW_MARGIN;
         this.header.htmlText = localeService.getText(TanksLocale.TEXT_SHOP_WINDOW_HEADER_DESCRIPTION);
         if(ShopWindow.haveDoubleCrystalls)
         {
            this.§use var else§.multiline = true;
            this.§use var else§.wordWrap = true;
            this.§use var else§.x = this.§ #g§.x + this.§ #g§.width + WINDOW_MARGIN;
            this.§use var else§.htmlText = localeService.getText(TanksLocale.TEXT_SHOP_CATEGORY_DOUBLE_CRYSTALS);
            this.§use var else§.bold = true;
            this.§use var else§.color = 16760355;
            addChild(this.§use var else§);
         }
         if(§"!b§.§?"=§())
         {
            this.§[1§ = new DropDownList();
            this.§[1§.width = 160;
            this.§break catch finally§();
            addChild(this.§[1§);
            this.§[1§.addEventListener(Event.CHANGE,this.§@#L§);
            this.§implements var class§ = new LabelBase();
            this.§implements var class§.text = localeService.getText(TanksLocale.TEXT_CHECK_YOU_LOCATION_TEXT);
            addChild(this.§implements var class§);
         }
      }
      
      private function §@#L§(param1:Event) : void
      {
         §"!b§.§in package var§(this.§[1§.selectedItem["code"]);
         dispatchEvent(new Event(Event.CLOSE));
         lobbyLayoutService.showPayment();
      }
      
      public function §break catch finally§() : void
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
      
      public function resize(param1:int) : void
      {
         this.§5#`§.width = param1;
         this.§5#`§.height = this.§ #g§.height + (ShopWindow.haveDoubleCrystalls ? 55 : 35);
         this.header.width = param1 - this.header.x - WINDOW_MARGIN;
         this.header.y = this.§ #g§.y + (this.§ #g§.height - this.header.textHeight >> 1);
         this.§use var else§.width = param1 - this.header.x - WINDOW_MARGIN;
         this.§use var else§.y = this.header.y + this.header.height;
         if(§"!b§.§?"=§())
         {
            this.§[1§.y = this.§5#`§.height - this.§[1§.rowHeight - 15;
            this.§[1§.x = this.§5#`§.width - this.§[1§.width + 5;
            this.§implements var class§.y = this.§[1§.y + 6;
            this.§implements var class§.x = this.§[1§.x - this.§implements var class§.width - 5;
         }
      }
      
      override public function get height() : Number
      {
         return this.§5#`§.height;
      }
   }
}

