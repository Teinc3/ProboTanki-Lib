package alternativa.tanks.gui
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.ImageConst;
   import alternativa.tanks.locale.constants.TextConst;
   import assets.icons.GarageItemBackground;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import forms.TanksWindowWithCustomHeader;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   
   public class RepatriateBonusWindow extends Sprite
   {
      [Inject]
      public static var resourceService:ResourceRegistry;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      private var window:TanksWindowWithCustomHeader;
      
      private var inner:TankWindowInner;
      
      public var closeButton:DefaultButtonBase;
      
      private var messageLabel:LabelBase;
      
      private var windowSize:Point;
      
      private var windowWidth:int = 450;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const space:int = 8;
      
      private var itemsContainer:Sprite;
      
      public function RepatriateBonusWindow(param1:BitmapData, param2:String, param3:Vector.<BonusItemCC>)
      {
         this.buttonSize = new Point(104,33);
         var _loc4_:int = 0;
         var _loc5_:PreviewBonusItem = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:LabelBase = null;
         super();
         var _loc9_:GarageItemBackground = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         if(param3.length == 1)
         {
            _loc4_ = 1;
         }
         else if(param3.length <= 4)
         {
            _loc4_ = 2;
         }
         else if(param3.length <= 6)
         {
            _loc4_ = 3;
         }
         else
         {
            _loc4_ = 4;
         }
         this.itemsContainer = new Sprite();
         this.windowWidth = _loc9_.width + this.windowMargin * 2 + this.margin * 2 + (_loc9_.width + this.space) * (_loc4_ - 1);
         this.messageLabel = new LabelBase();
         this.messageLabel.wordWrap = true;
         this.messageLabel.multiline = true;
         this.messageLabel.text = param2;
         this.messageLabel.size = 12;
         this.messageLabel.color = 5898034;
         this.messageLabel.x = this.windowMargin * 2;
         this.messageLabel.y = 110 + this.windowMargin * 2;
         this.messageLabel.width = this.windowWidth - this.windowMargin * 4;
         this.windowSize = new Point(this.windowWidth,110 + this.messageLabel.height + this.buttonSize.y + this.windowMargin * 3 + this.margin * 3);
         this.window = new TanksWindowWithCustomHeader();
         this.window.width = this.windowSize.x;
         this.window.height = this.windowSize.y;
         addChild(this.window);
         this.window.headerLang = localeService.getText(TextConst.GUI_LANG);
         this.window.customHeader = ImageConst.IMAGE_WELCOME_BACK_HEADER;
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.inner);
         this.inner.x = this.windowMargin;
         this.inner.y = this.windowMargin;
         this.inner.width = this.windowSize.x - this.windowMargin * 2;
         this.inner.height = this.windowSize.y - this.windowMargin - this.margin * 2 - this.buttonSize.y + 2;
         clientLog.log("Test","lang = %1",localeService.language);
         var _loc10_:Bitmap = new Bitmap(param1);
         addChild(_loc10_);
         _loc10_.y = 30;
         _loc10_.x = (this.inner.width - _loc10_.width) / 2;
         addChild(this.messageLabel);
         addChild(this.itemsContainer);
         var _loc11_:int = int(param3.length / _loc4_) + 1;
         var _loc12_:int = 0;
         while(_loc12_ < param3.length)
         {
            _loc9_ = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
            this.itemsContainer.addChild(_loc9_);
            _loc5_ = new PreviewBonusItem(param3[_loc12_].resource,_loc9_.width,_loc9_.height);
            this.itemsContainer.addChild(_loc5_);
            if(int(_loc12_ / _loc4_) + 1 == _loc11_)
            {
               _loc6_ = param3.length - (_loc11_ - 1) * _loc4_;
               _loc7_ = (_loc4_ - _loc6_) * (_loc9_.width + this.space >> 1);
               _loc9_.x = int(_loc12_ % _loc4_) * (_loc9_.width + this.space) + _loc7_;
            }
            else
            {
               _loc9_.x = int(_loc12_ % _loc4_) * (_loc9_.width + this.space);
            }
            _loc9_.y = (_loc9_.height + this.space) * int(_loc12_ / _loc4_);
            _loc5_.x = _loc9_.x;
            _loc5_.y = _loc9_.y;
            if(param3[_loc12_].count > 0)
            {
               _loc8_ = new LabelBase();
               this.itemsContainer.addChild(_loc8_);
               _loc8_.size = 16;
               _loc8_.color = 5898034;
               _loc8_.text = "×" + param3[_loc12_].count.toString();
               _loc8_.x = _loc9_.x + _loc9_.width - _loc8_.width - 15;
               _loc8_.y = _loc9_.y + _loc9_.height - _loc8_.height - 10;
            }
            _loc12_++;
         }
         this.windowSize.y += this.itemsContainer.height;
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.closeButton.y = this.windowSize.y - this.margin - this.buttonSize.y - 2;
         this.placeItems();
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
   }
}

