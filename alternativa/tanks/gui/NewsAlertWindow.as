package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import forms.TanksWindowWithCustomHeader;
   import projects.tanks.client.panel.model.news.item.NewsItemCC;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class NewsAlertWindow extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public var closeButton:DefaultButtonBase;
      
      private var window:TanksWindowWithCustomHeader;
      
      private var newsContainer:Sprite;
      
      private var scrollPane:ScrollPane;
      
      public function NewsAlertWindow(param1:Vector.<NewsItemCC>)
      {
         var _loc3_:Sprite = null;
         var _loc2_:NewsItemCC = null;
         _loc3_ = null;
         var _loc4_:NewsItem = null;
         super();
         this.newsContainer = new Sprite();
         var _loc5_:int = 10;
         for each(_loc2_ in param1)
         {
            (_loc4_ = new NewsItem(_loc2_.imageUrl,_loc2_.newsText,_loc2_.newsDate)).y = _loc5_;
            this.newsContainer.addChild(_loc4_);
            _loc5_ += _loc4_.height;
         }
         _loc3_ = new Sprite();
         _loc3_.graphics.beginFill(0,0);
         _loc3_.graphics.drawRect(0,0,10,20);
         _loc3_.graphics.endFill();
         _loc3_.y = _loc5_;
         this.newsContainer.addChild(_loc3_);
         this.window = new TanksWindowWithCustomHeader();
         this.window.width = 500;
         this.window.height = this.newsContainer.height < 300 ? Number(this.newsContainer.height + 100) : Number(400);
         this.window.headerLang = localeService.language;
         this.window.customHeader = TanksLocale.IMAGE_NEWS_HEADER;
         addChild(this.window);
         var _loc6_:TankWindowInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(_loc6_);
         _loc6_.x = 10;
         _loc6_.y = 10;
         _loc6_.height = this.window.height - 50 - 2 * 10;
         _loc6_.width = this.window.width - 2 * 10;
         this.scrollPane = new ScrollPane();
         this.scrollPane.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("trackUpSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("trackDownSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("trackOverSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.scrollPane.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.scrollPane.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.scrollPane.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
         this.scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollPane.source = this.newsContainer;
         this.scrollPane.focusEnabled = false;
         this.scrollPane.x = 10;
         this.scrollPane.y = 10;
         this.scrollPane.setSize(_loc6_.width - 10,_loc6_.height - 2 * 10);
         this.scrollPane.update();
         _loc6_.addChild(this.scrollPane);
         this.closeButton = new DefaultButtonBase();
         this.closeButton.label = localeService.getText(TextConst.REFERAL_WINDOW_BUTTON_CLOSE_TEXT);
         this.addChild(this.closeButton);
         this.closeButton.x = (this.window.width - this.closeButton.width) / 2;
         this.closeButton.y = this.window.height - this.closeButton.height - 20;
      }
      
      override public function get height() : Number
      {
         return this.window.height;
      }
   }
}

