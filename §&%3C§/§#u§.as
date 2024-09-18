package §&<§
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
   import services.alertservice.§get const use§;
   
   public class §#u§ extends DialogWindow
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const §include set dynamic§:String = "{time}";
      
      private static const §true const case§:int = 25;
      
      private static const §default var false§:int = 6;
      
      private static const §final for class§:int = 15;
      
      private var §var package switch§:TankWindow;
      
      private var §0D§:DefaultButtonBase;
      
      private var §get const static§:DefaultButtonBase;
      
      private var §]!&§:LabelBase;
      
      private var §static for package§:LabelBase;
      
      private var _seconds:int;
      
      private var §native set each§:String;
      
      public function §#u§()
      {
         super();
         this.§native set each§ = localeService.getText(TanksLocale.TEXT_REARM_PAUSE_ALERT);
         this.§var package switch§ = new TankWindow();
         addChild(this.§var package switch§);
         this.§]!&§ = this.createLabel();
         this.§static for package§ = this.createLabel();
         this.§0D§ = new DefaultButtonBase();
         this.§0D§.label = §get const use§.YES;
         addChild(this.§0D§);
         this.§get const static§ = new DefaultButtonBase();
         this.§get const static§.label = §get const use§.NO;
         addChild(this.§get const static§);
         this.resize();
      }
      
      private function createLabel() : LabelBase
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.y = §true const case§;
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
         var _loc4_:Array = this.§native set each§.replace(§include set dynamic§,_loc2_ + ":" + _loc3_).split("\n");
         this.§]!&§.text = _loc4_[0];
         this.§static for package§.text = _loc4_[1];
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
         var _loc1_:int = Math.max(this.§]!&§.width + 2 * §true const case§,this.§static for package§.width + 2 * §true const case§);
         this.§var package switch§.width = Math.max(_loc1_,this.§get const static§.width + this.§0D§.width + §default var false§ + 2 * §true const case§);
         this.§var package switch§.x = -int(this.§var package switch§.width / 2);
         this.§]!&§.x = -int(this.§]!&§.width / 2);
         this.§static for package§.x = -int(this.§static for package§.width / 2);
         this.§static for package§.y = this.§]!&§.y + this.§]!&§.height;
         this.§0D§.y = this.§static for package§.y + this.§static for package§.height + §final for class§;
         this.§get const static§.y = this.§static for package§.y + this.§static for package§.height + §final for class§;
         this.§0D§.x = -this.§0D§.width - §default var false§ / 2;
         this.§get const static§.x = §default var false§ / 2;
         this.§var package switch§.height = this.§get const static§.y + this.§get const static§.height + §true const case§;
         this.x = display.stage.stageWidth >> 1;
         this.y = display.stage.stageHeight - this.height >> 1;
      }
      
      private function setEvents() : void
      {
         this.§0D§.addEventListener(MouseEvent.CLICK,this.§extends var get§);
         this.§get const static§.addEventListener(MouseEvent.CLICK,this.§else package set§);
         display.stage.addEventListener(Event.RESIZE,this.onStageResize);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.§8$!§);
      }
      
      private function §else package set§(param1:MouseEvent = null) : void
      {
         dispatchEvent(new NotificationEndsPausedAlertEvent(NotificationEndsPausedAlertEvent.CLOSE_ALERT));
      }
      
      private function §extends var get§(param1:MouseEvent = null) : void
      {
         dispatchEvent(new NotificationEndsPausedAlertEvent(NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE));
      }
      
      private function onStageResize(param1:Event) : void
      {
         this.resize();
      }
      
      private function §8$!§(param1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.§else package set§();
         }
         if(AlertUtils.isConfirmationKey(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.§extends var get§();
         }
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         blurService.unblurAllContent();
         removeDisplayObject(this);
         this.§var package switch§ = null;
         this.§0D§ = null;
         this.§get const static§ = null;
         this.§]!&§ = null;
         this.§static for package§ = null;
      }
      
      private function removeEvents() : void
      {
         this.§0D§.removeEventListener(MouseEvent.CLICK,this.§extends var get§);
         this.§get const static§.removeEventListener(MouseEvent.CLICK,this.§else package set§);
         display.stage.removeEventListener(Event.RESIZE,this.onStageResize);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§8$!§);
      }
   }
}

