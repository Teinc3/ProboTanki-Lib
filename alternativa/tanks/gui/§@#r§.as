package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import assets.icons.GarageItemBackground;
   import §class const var§.§6z§;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   import forms.TankWindowWithHeader;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class §@#r§ extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const § p§:Class = §4#k§;
      
      private static const §throw static§:BitmapData = new § p§().bitmapData;
      
      private static const WINDOW_WIDTH:int = 680;
      
      private static const WINDOW_HEIGHT:int = 555;
      
      private static const MARGIN:int = 10;
      
      private static const SPACE:int = 20;
      
      private static const §while set each§:int = 90;
      
      private static const §override var null§:int = 510;
      
      private static const §2"e§:int = 3;
      
      private var window:TankWindowWithHeader;
      
      private var closeButton:DefaultButtonBase;
      
      private var messageLabel:LabelBase;
      
      private var itemsContainer:Sprite;
      
      private var reward:Vector.<§6z§>;
      
      public function §@#r§(param1:Vector.<§6z§>)
      {
         this.closeButton = new DefaultButtonBase();
         this.messageLabel = new LabelBase();
         this.itemsContainer = new Sprite();
         super();
         this.reward = param1;
         this.createWindow();
         this.§in var dynamic§();
         this.§-#D§();
         this.addMessage();
         this.§;!6§();
         this.§<"b§();
      }
      
      private function createWindow() : void
      {
         this.window = TankWindowWithHeader.createWindow(TanksLocale.IMAGE_HEADER_CONGRATULATION,WINDOW_WIDTH,WINDOW_HEIGHT);
         addChild(this.window);
      }
      
      private function §in var dynamic§() : void
      {
         var _loc1_:TankWindowInner = new TankWindowInner(WINDOW_WIDTH - 2 * MARGIN,WINDOW_HEIGHT - this.closeButton.height - 3 * MARGIN,TankWindowInner.GREEN);
         _loc1_.x = MARGIN;
         _loc1_.y = MARGIN;
         this.window.addChild(_loc1_);
      }
      
      private function §-#D§() : void
      {
         var _loc1_:Bitmap = new Bitmap(§throw static§);
         this.window.addChild(_loc1_);
         _loc1_.y = MARGIN + SPACE;
         _loc1_.x = (WINDOW_WIDTH - 2 * MARGIN - _loc1_.width) / 2;
      }
      
      private function addMessage() : void
      {
         this.messageLabel.wordWrap = true;
         this.messageLabel.multiline = true;
         this.messageLabel.text = localeService.getText(TanksLocale.TEXT_WEEKLY_QUEST_REWARD_WINDOW_DESCRIPTION);
         this.messageLabel.size = 12;
         this.messageLabel.color = 5898034;
         this.messageLabel.align = TextFormatAlign.CENTER;
         this.messageLabel.width = §override var null§;
         this.messageLabel.x = (WINDOW_WIDTH - §override var null§) / 2;
         this.messageLabel.y = §while set each§ + MARGIN * 2 + SPACE;
         this.window.addChild(this.messageLabel);
      }
      
      private function §;!6§() : void
      {
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         this.closeButton.x = (WINDOW_WIDTH - this.closeButton.width) / 2;
         this.closeButton.y = WINDOW_HEIGHT - MARGIN - this.closeButton.height;
         this.window.addChild(this.closeButton);
      }
      
      private function onCloseButtonClick(param1:MouseEvent = null) : void
      {
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         dialogService.removeDialog(this);
      }
      
      private function §<"b§() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:GarageItemBackground = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         var _loc6_:int = 0;
         while(_loc6_ < this.reward.length)
         {
            _loc1_ = _loc6_ > 2 && this.reward.length < §2"e§ * 2;
            _loc2_ = _loc1_ ? int((_loc5_.width + SPACE) / 2) : int(0);
            _loc3_ = _loc6_ % §2"e§ * (_loc5_.width + SPACE) + _loc2_;
            _loc4_ = (_loc5_.height + SPACE) * int(_loc6_ / §2"e§);
            this.§60§(this.reward[_loc6_].§super const return§,this.reward[_loc6_].count,_loc3_,_loc4_);
            _loc6_++;
         }
         this.itemsContainer.y = this.messageLabel.y + this.messageLabel.height + SPACE;
         this.itemsContainer.x = WINDOW_WIDTH - this.itemsContainer.width >> 1;
         this.window.addChild(this.itemsContainer);
      }
      
      private function §60§(param1:ImageResource, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:LabelBase = null;
         var _loc6_:GarageItemBackground = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         this.itemsContainer.addChild(_loc6_);
         var _loc7_:PreviewBonusItem = new PreviewBonusItem(param1,_loc6_.width,_loc6_.height);
         this.itemsContainer.addChild(_loc7_);
         _loc6_.x = _loc7_.x = param3;
         _loc6_.y = _loc7_.y = param4;
         if(param2 > 0)
         {
            _loc5_ = new LabelBase();
            this.itemsContainer.addChild(_loc5_);
            _loc5_.size = 16;
            _loc5_.color = 5898034;
            _loc5_.text = "×" + param2.toString();
            _loc5_.x = _loc6_.x + _loc6_.width - _loc5_.width - 1.5 * MARGIN;
            _loc5_.y = _loc6_.y + _loc6_.height - _loc5_.height - MARGIN;
         }
      }
      
      public function show() : void
      {
         dialogService.addDialog(this);
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
   }
}

