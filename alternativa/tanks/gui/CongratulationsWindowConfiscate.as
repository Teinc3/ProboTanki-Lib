package alternativa.tanks.gui
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.bonus.showing.detach.BonusDetach;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormatAlign;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class CongratulationsWindowConfiscate extends Sprite implements IDestroyWindow
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var _gameObject:IGameObject;
      
      private var closeButton:DefaultButtonBase;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const space:int = 8;
      
      private const minWidth:int = 300;
      
      public function CongratulationsWindowConfiscate(param1:IGameObject, param2:BitmapData, param3:BitmapData, param4:String = "", param5:String = "", param6:int = 0)
      {
         var _loc9_:Bitmap = null;
         var _loc10_:Bitmap = null;
         var _loc11_:int = 0;
         this.buttonSize = new Point(104,33);
         var _loc7_:LabelBase = null;
         var _loc8_:LabelBase = null;
         super();
         this._gameObject = param1;
         _loc9_ = new Bitmap(param2);
         _loc10_ = new Bitmap(param3);
         _loc11_ = Math.max(_loc10_.width + this.windowMargin * 2 + this.margin * 2,_loc9_.width + this.windowMargin * 2 + this.margin * 2,this.minWidth);
         var _loc12_:TankWindow = new TankWindow(_loc11_,_loc9_.height);
         addChild(_loc12_);
         _loc12_.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         _loc12_.header = TankWindowHeader.ATTANTION;
         var _loc13_:TankWindowInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(_loc13_);
         _loc13_.x = this.windowMargin;
         _loc13_.y = this.windowMargin;
         _loc10_.x = _loc11_ - _loc10_.width >> 1;
         _loc10_.y = this.windowMargin * 2 - 7;
         addChild(_loc10_);
         if(param4 != null && param4 != "")
         {
            (_loc7_ = new LabelBase()).align = TextFormatAlign.CENTER;
            _loc7_.wordWrap = true;
            _loc7_.multiline = true;
            _loc7_.size = 13;
            _loc7_.htmlText = param4;
            _loc7_.color = 5898034;
            _loc7_.x = this.windowMargin * 2;
            _loc7_.y = _loc10_.y + _loc10_.height + this.margin - 28;
            _loc7_.width = _loc11_ - this.windowMargin * 4;
            addChild(_loc7_);
         }
         _loc9_.x = _loc11_ - _loc9_.width >> 1;
         _loc9_.y = _loc7_.y + _loc7_.height + this.margin - 5;
         addChild(_loc9_);
         if(param5 != null && param5 != "")
         {
            (_loc8_ = new LabelBase()).align = TextFormatAlign.CENTER;
            _loc8_.wordWrap = true;
            _loc8_.multiline = true;
            _loc8_.size = 12;
            _loc8_.color = 5898034;
            _loc8_.htmlText = String(param5.split("\n")[0]);
            _loc8_.x = this.windowMargin * 2;
            _loc8_.y = _loc9_.y + _loc9_.height + this.margin - 17;
            _loc8_.width = _loc11_ - this.windowMargin * 4;
            addChild(_loc8_);
         }
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         var _loc14_:int = _loc10_.height + _loc9_.height + this.closeButton.height + this.margin * 3 + this.windowMargin * 3;
         if(_loc7_ != null)
         {
            _loc14_ += _loc7_.height + this.margin;
         }
         if(_loc8_ != null)
         {
            _loc14_ += _loc8_.height + this.margin;
         }
         _loc12_.height = _loc14_ - 5 - 28 - 7 - 17;
         this.closeButton.y = _loc12_.height - this.margin - 35;
         this.closeButton.x = _loc12_.width - this.closeButton.width >> 1;
         _loc13_.width = _loc12_.width - this.windowMargin * 2;
         _loc13_.height = _loc12_.height - this.windowMargin - this.margin * 2 - this.buttonSize.y + 2;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         this.alignBonusWindow();
         display.stage.addEventListener(Event.RESIZE,this.alignBonusWindow);
         dialogsService.§!!n§(this);
      }
      
      private function alignBonusWindow(param1:Event = null) : void
      {
         this.x = Math.round((display.stage.stageWidth - this.width) * 0.5);
         this.y = Math.round((display.stage.stageHeight - this.height) * 0.5);
      }
      
      private function closeBonusWindow(param1:MouseEvent = null) : void
      {
         this.destroy();
      }
      
      public function destroy() : void
      {
         var _loc1_:BonusDetach = null;
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         display.stage.removeEventListener(Event.RESIZE,this.alignBonusWindow);
         dialogsService.removeDialog(this);
         if(this._gameObject != null)
         {
            _loc1_ = new BonusDetach(this._gameObject);
            _loc1_.detach();
            this._gameObject = null;
         }
      }
   }
}

