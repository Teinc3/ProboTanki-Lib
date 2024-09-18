package §1#j§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.TankWindow;
   import controls.TextArea;
   import controls.ValidationIcon;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   
   public class § #h§ extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var §const each§:UidCheckService;
      
      private static const §#!p§:int = 350;
      
      private static const §implements for true§:int = 600;
      
      private static const §2#l§:int = 11;
      
      private static const §;!N§:int = 5;
      
      private var window:TankWindow;
      
      private var §""f§:TextArea;
      
      private var §6Q§:TankInputBase;
      
      private var §>!I§:LabelBase;
      
      private var sendButton:DefaultButtonBase;
      
      private var isUidValid:Boolean;
      
      private var uid:String;
      
      private var §;R§:ValidationIcon;
      
      private var §?b§:uint;
      
      public function § #h§()
      {
         this.window = new TankWindow(440,200);
         super();
         addChild(this.window);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.§&!i§);
         var _loc1_:int = §2#l§;
         this.§;"0§(_loc1_);
         _loc1_ += this.§""f§.height + §;!N§;
         this.§9!g§(_loc1_);
         _loc1_ += this.§6Q§.height + §;!N§;
         this.§^"-§(_loc1_);
         dialogService.addDialog(this);
      }
      
      private function §^"-§(param1:int) : void
      {
         this.sendButton = new DefaultButtonBase();
         this.sendButton.label = localeService.getText(TextConst.TEXT_SEND_PRESENT_BUTTON);
         this.sendButton.x = §2#l§;
         this.sendButton.y = param1;
         this.sendButton.addEventListener(MouseEvent.CLICK,this.§'!b§);
         this.sendButton.enable = false;
         this.window.addChild(this.sendButton);
         var _loc2_:DefaultButtonBase = new DefaultButtonBase();
         _loc2_.label = localeService.getText(TextConst.ALERT_ANSWER_CANCEL);
         _loc2_.x = §2#l§;
         _loc2_.y = param1;
         _loc2_.addEventListener(MouseEvent.CLICK,this.onCancelClick);
         this.window.addChild(_loc2_);
         var _loc3_:int = Math.max(this.sendButton.width,_loc2_.width);
         this.sendButton.width = _loc3_;
         _loc2_.width = _loc3_;
         var _loc4_:int = this.sendButton.height + 2 * §;!N§;
         var _loc5_:int = (width - 2 * _loc3_ - _loc4_) / 2;
         this.sendButton.x = _loc5_;
         _loc2_.x = width - _loc3_ - _loc5_;
      }
      
      private function §9!g§(param1:int) : void
      {
         this.§6Q§ = new TankInputBase();
         this.§6Q§.maxChars = 20;
         this.§6Q§.x = §2#l§;
         this.§6Q§.y = param1;
         this.§6Q§.width = this.window.width - 2 * §2#l§;
         this.§6Q§.addEventListener(FocusEvent.FOCUS_OUT,this.§[R§);
         this.§6Q§.textField.addEventListener(Event.CHANGE,this.§&"m§);
         this.§6Q§.addEventListener(KeyboardEvent.KEY_UP,this.§false for import§);
         this.window.addChild(this.§6Q§);
         this.§>!I§ = new §4"V§(this.§6Q§.textField);
         this.§>!I§.text = localeService.getText(TextConst.TEXT_PRESENT_RECIPIENT_NAME);
         this.§>!I§.x = this.§6Q§.x + §;!N§;
         this.§>!I§.y = this.§6Q§.y + §;!N§;
         this.window.addChild(this.§>!I§);
         this.§;R§ = new ValidationIcon();
         this.window.addChild(this.§;R§);
         this.§;R§.x = this.§6Q§.x + this.§6Q§.width - this.§;R§.width - 15;
         this.§;R§.y = param1 + §;!N§;
      }
      
      private function §;"0§(param1:int) : void
      {
         this.§""f§ = new TextArea();
         this.§""f§.maxChars = §#!p§;
         this.§""f§.height = 106;
         this.§""f§.width = this.window.width - 2 * §2#l§;
         this.§""f§.x = §2#l§;
         this.§""f§.y = param1;
         this.§""f§.tf.addEventListener(Event.CHANGE,this.§break var class§);
         this.window.addChild(this.§""f§);
         var _loc2_:LabelBase = new §4"V§(this.§""f§.tf);
         _loc2_.text = localeService.getText(TextConst.TEXT_TYPE_MESSAGE_WITH_PRESENT);
         _loc2_.x = this.§""f§.x + §;!N§;
         _loc2_.y = this.§""f§.y + §;!N§;
         this.window.addChild(_loc2_);
      }
      
      private function §false for import§(param1:KeyboardEvent) : void
      {
         if(AlertUtils.isConfirmationKey(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.§false function§();
         }
      }
      
      private function §&!i§(param1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.§throw const§();
         }
      }
      
      private function §&"m§(param1:Event) : void
      {
         this.isUidValid = false;
         this.sendButton.enable = false;
         this.§;R§.startProgress();
         if(this.§6Q§.value.length > 0)
         {
            this.§>!I§.visible = false;
         }
         clearTimeout(this.§?b§);
         this.§return for return§();
         this.§?b§ = setTimeout(this.checkUid,§implements for true§);
      }
      
      private function §break var class§(param1:Event) : void
      {
         this.§return for return§();
      }
      
      private function §'!b§(param1:MouseEvent) : void
      {
         this.§false function§();
      }
      
      private function §false function§() : void
      {
         if(this.§dynamic native§())
         {
            this.destroy();
            dispatchEvent(new SendPresentEvent(SendPresentEvent.SEND_PRESENT,this.uid,this.§""f§.text));
         }
      }
      
      private function onCancelClick(param1:MouseEvent) : void
      {
         this.§throw const§();
      }
      
      private function §throw const§() : void
      {
         dispatchEvent(new Event(Event.CANCEL));
         this.destroy();
      }
      
      private function destroy() : void
      {
         this.sendButton.removeEventListener(MouseEvent.CLICK,this.§'!b§);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§&!i§);
         this.§6Q§.removeEventListener(KeyboardEvent.KEY_UP,this.§false for import§);
         dialogService.removeDialog(this);
      }
      
      private function checkUid() : void
      {
         if(this.§6Q§.value.length == 0)
         {
            this.§;R§.turnOff();
            this.§6Q§.validValue = true;
         }
         else
         {
            this.uid = this.§6Q§.value;
            §const each§.exist(this.uid,this.§native static§);
         }
      }
      
      private function §native static§(param1:Boolean) : void
      {
         this.§6Q§.validValue = param1;
         this.isUidValid = param1;
         if(param1)
         {
            this.§;R§.markAsValid();
            this.§return for return§();
         }
         else
         {
            this.§;R§.markAsInvalid();
         }
      }
      
      private function §return for return§() : void
      {
         this.sendButton.enable = this.§dynamic native§();
      }
      
      private function §dynamic native§() : Boolean
      {
         return this.isUidValid && this.§return const null§();
      }
      
      private function §return const null§() : Boolean
      {
         return this.§""f§.text.length > 0;
      }
      
      private function §[R§(param1:Event) : void
      {
         if(this.§6Q§.value.length == 0)
         {
            this.§>!I§.visible = true;
            this.§;R§.turnOff();
            this.§6Q§.validValue = true;
            this.§return for return§();
         }
      }
   }
}

