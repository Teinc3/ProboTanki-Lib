package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import assets.icons.GarageItemBackground;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class CongratulationsWindowWithBanner extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var window:TankWindow;
      
      private var inner:TankWindowInner;
      
      public var closeButton:DefaultButtonBase;
      
      private var messageLabel:LabelBase;
      
      private var windowSize:Point;
      
      private var windowWidth:int = 450;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const space:int = 8;
      
      private var bannerBmp:Bitmap;
      
      private var itemsContainer:Sprite;
      
      public function CongratulationsWindowWithBanner(param1:String, param2:Vector.<BonusItemCC>)
      {
         this.buttonSize = new Point(104,33);
         var _loc3_:int = 0;
         var _loc4_:PreviewBonusItem = null;
         var _loc5_:LabelBase = null;
         super();
         var _loc6_:GarageItemBackground = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         var _loc7_:* = (param2.length & 1) == 0;
         if(param2.length == 1)
         {
            _loc3_ = 1;
         }
         else if(param2.length < 5)
         {
            _loc3_ = 2;
         }
         else
         {
            _loc3_ = 3;
         }
         var _loc8_:Sprite = new Sprite();
         this.itemsContainer = new Sprite();
         this.bannerBmp = new Bitmap();
         _loc8_.addChild(this.bannerBmp);
         this.windowWidth = _loc6_.width + this.windowMargin * 2 + this.margin * 2 + (_loc6_.width + this.space) * (_loc3_ - 1);
         this.messageLabel = new LabelBase();
         this.messageLabel.wordWrap = true;
         this.messageLabel.multiline = true;
         this.messageLabel.text = param1;
         this.messageLabel.size = 12;
         this.messageLabel.color = 5898034;
         this.messageLabel.x = this.windowMargin * 2;
         this.messageLabel.y = this.windowMargin * 2;
         this.messageLabel.width = this.windowWidth - this.windowMargin * 4;
         this.windowSize = new Point(this.windowWidth,this.messageLabel.height + this.buttonSize.y + this.windowMargin * 3 + this.margin * 3);
         this.window = new TankWindow(this.windowSize.x,this.windowSize.y);
         addChild(this.window);
         this.window.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         this.window.header = TankWindowHeader.CONGRATULATIONS;
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.inner);
         this.inner.x = this.windowMargin;
         this.inner.y = this.windowMargin;
         this.inner.width = this.windowSize.x - this.windowMargin * 2;
         this.inner.height = this.windowSize.y - this.windowMargin - this.margin * 2 - this.buttonSize.y + 2;
         addChild(this.messageLabel);
         addChild(this.itemsContainer);
         var _loc9_:int = 0;
         while(_loc9_ < param2.length)
         {
            _loc6_ = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
            this.itemsContainer.addChild(_loc6_);
            _loc4_ = new PreviewBonusItem(param2[_loc9_].resource,_loc6_.width,_loc6_.height);
            this.itemsContainer.addChild(_loc4_);
            _loc6_.x = (!_loc7_ && _loc9_ > param2.length - _loc3_ ? _loc6_.width + this.space >> 1 : 0) + int(_loc9_ % _loc3_) * (_loc6_.width + this.space);
            _loc6_.y = (_loc6_.height + this.space) * int(_loc9_ / _loc3_);
            _loc4_.x = _loc6_.x;
            _loc4_.y = _loc6_.y;
            _loc5_ = new LabelBase();
            this.itemsContainer.addChild(_loc5_);
            _loc5_.size = 16;
            _loc5_.color = 5898034;
            _loc5_.text = "×" + param2[_loc9_].count.toString();
            _loc5_.x = _loc6_.x + _loc6_.width - _loc5_.width - 15;
            _loc5_.y = _loc6_.y + _loc6_.height - _loc5_.height - 10;
            _loc9_++;
         }
         this.windowSize.y += this.itemsContainer.height;
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.closeButton.y = this.windowSize.y - this.margin - this.buttonSize.y - 2;
         this.placeItems();
         addChild(_loc8_);
         this.window.height = this.windowSize.y;
         this.window.width = this.windowSize.x;
      }
      
      private function placeItems() : void
      {
         this.messageLabel.width = this.windowWidth - this.windowMargin * 4;
         this.itemsContainer.y = this.messageLabel.y + this.messageLabel.height + this.windowMargin;
         this.itemsContainer.x = this.windowSize.x - this.itemsContainer.width >> 1;
         this.inner.width = this.windowSize.x - this.windowMargin * 2;
         this.inner.height = this.windowSize.y - this.windowMargin - this.margin * 2 - this.buttonSize.y + 2;
         this.closeButton.x = this.windowSize.x - this.buttonSize.x >> 1;
      }
      
      public function set bannerBd(param1:BitmapData) : void
      {
         this.bannerBmp.bitmapData = param1;
         this.windowSize.y = this.windowSize.y + this.bannerBmp.height + this.margin - 1;
         this.windowWidth = this.windowSize.x = Math.max(this.windowSize.x,this.bannerBmp.width + this.windowMargin * 2 + this.margin * 2);
         this.window.height = this.windowSize.y;
         this.window.width = this.windowSize.x;
         this.placeItems();
         this.bannerBmp.x = this.windowWidth - this.bannerBmp.width >> 1;
         this.bannerBmp.y = this.inner.y + this.inner.height - this.margin - this.bannerBmp.height - 1;
         this.closeButton.y = this.windowSize.y - this.margin - this.buttonSize.y - 2;
      }
      
      public function get banner() : Bitmap
      {
         return this.bannerBmp;
      }
   }
}

