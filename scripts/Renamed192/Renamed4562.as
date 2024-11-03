package Renamed4561
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.utils.removeDisplayObject;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import services.alertservice.Renamed1616;
   
   public class Renamed4562 extends DialogWindow
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const Renamed5682:String = "{time}";
      
      private static const Renamed5895:int = 25;
      
      private static const Renamed5896:int = 6;
      
      private static const Renamed5897:int = 15;
      
      private var Renamed5898:TankWindow;
      
      private var Renamed5899:DefaultButtonBase;
      
      private var Renamed5900:DefaultButtonBase;
      
      private var Renamed5901:LabelBase;
      
      private var Renamed5902:LabelBase;
      
      private var _seconds:int;
      
      private var Renamed5903:String;
      
      public function Renamed4562()
      {
         super();
         this.Renamed5903 = localeService.getText(TanksLocale.TEXT_REARM_PAUSE_ALERT);
         this.Renamed5898 = new TankWindow();
         addChild(this.Renamed5898);
         this.Renamed5901 = this.createLabel();
         this.Renamed5902 = this.createLabel();
         this.Renamed5899 = new DefaultButtonBase();
         this.Renamed5899.label = Renamed1616.YES;
         addChild(this.Renamed5899);
         this.Renamed5900 = new DefaultButtonBase();
         this.Renamed5900.label = Renamed1616.NO;
         addChild(this.Renamed5900);
         this.resize();
      }
      
      private function createLabel() : LabelBase
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.y = Renamed5895;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.size = 14;
         _loc1_.width = 10;
         _loc1_.height = 10;
         _loc1_.multiline = true;
         addChild(_loc1_);
         return _loc1_;
      }
      
      public function set seconds(param1:int) : void
      {
         if(this._seconds == param1)
         {
            return;
         }
         this._seconds = param1;
         var _loc2_:int = this._seconds / 60;
         this._seconds -= _loc2_ * 60;
         var _loc3_:String = this._seconds < 10 ? "0" + this._seconds : this._seconds.toString();
         var _loc4_:Array = this.Renamed5903.replace(Renamed5682,_loc2_ + ":" + _loc3_).split("\n");
         this.Renamed5901.text = _loc4_[0];
         this.Renamed5902.text = _loc4_[1];
      }
      
      public function show() : void
      {
         blurService.blurAllContent();
         this.resize();
         display.stage.addChild(this);
         display.stage.focus = this;
         this.setEvents();
      }
      
      private function resize() : void
      {
         var _loc1_:int = Math.max(this.Renamed5901.width + 2 * Renamed5895,this.Renamed5902.width + 2 * Renamed5895);
         this.Renamed5898.width = Math.max(_loc1_,this.Renamed5900.width + this.Renamed5899.width + Renamed5896 + 2 * Renamed5895);
         this.Renamed5898.x = -int(this.Renamed5898.width / 2);
         this.Renamed5901.x = -int(this.Renamed5901.width / 2);
         this.Renamed5902.x = -int(this.Renamed5902.width / 2);
         this.Renamed5902.y = this.Renamed5901.y + this.Renamed5901.height;
         this.Renamed5899.y = this.Renamed5902.y + this.Renamed5902.height + Renamed5897;
         this.Renamed5900.y = this.Renamed5902.y + this.Renamed5902.height + Renamed5897;
         this.Renamed5899.x = -this.Renamed5899.width - Renamed5896 / 2;
         this.Renamed5900.x = Renamed5896 / 2;
         this.Renamed5898.height = this.Renamed5900.y + this.Renamed5900.height + Renamed5895;
         this.x = display.stage.stageWidth >> 1;
         this.y = display.stage.stageHeight - this.height >> 1;
      }
      
      private function setEvents() : void
      {
         this.Renamed5899.addEventListener(MouseEvent.CLICK,this.Renamed5904);
         this.Renamed5900.addEventListener(MouseEvent.CLICK,this.Renamed5905);
         display.stage.addEventListener(Event.RESIZE,this.onStageResize);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.Renamed5906);
      }
      
      private function Renamed5905(param1:MouseEvent = null) : void
      {
         dispatchEvent(new NotificationEndsPausedAlertEvent(NotificationEndsPausedAlertEvent.CLOSE_ALERT));
      }
      
      private function Renamed5904(param1:MouseEvent = null) : void
      {
         dispatchEvent(new NotificationEndsPausedAlertEvent(NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE));
      }
      
      private function onStageResize(param1:Event) : void
      {
         this.resize();
      }
      
      private function Renamed5906(param1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.Renamed5905();
         }
         if(AlertUtils.isConfirmationKey(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.Renamed5904();
         }
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         blurService.unblurAllContent();
         removeDisplayObject(this);
         this.Renamed5898 = null;
         this.Renamed5899 = null;
         this.Renamed5900 = null;
         this.Renamed5901 = null;
         this.Renamed5902 = null;
      }
      
      private function removeEvents() : void
      {
         this.Renamed5899.removeEventListener(MouseEvent.CLICK,this.Renamed5904);
         this.Renamed5900.removeEventListener(MouseEvent.CLICK,this.Renamed5905);
         display.stage.removeEventListener(Event.RESIZE,this.onStageResize);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.Renamed5906);
      }
   }
}

