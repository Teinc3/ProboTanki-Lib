package Renamed233
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
   
   public class Renamed4768 extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var Renamed4794:UidCheckService;
      
      private static const Renamed6490:int = 350;
      
      private static const Renamed6491:int = 600;
      
      private static const Renamed6492:int = 11;
      
      private static const Renamed6493:int = 5;
      
      private var window:TankWindow;
      
      private var Renamed6494:TextArea;
      
      private var Renamed6495:TankInputBase;
      
      private var Renamed6496:LabelBase;
      
      private var sendButton:DefaultButtonBase;
      
      private var isUidValid:Boolean;
      
      private var uid:String;
      
      private var Renamed6497:ValidationIcon;
      
      private var Renamed6498:uint;
      
      public function Renamed4768()
      {
         this.window = new TankWindow(440,200);
         super();
         addChild(this.window);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.Renamed6499);
         var _loc1_:int = Renamed6492;
         this.Renamed6500(_loc1_);
         _loc1_ += this.Renamed6494.height + Renamed6493;
         this.Renamed6501(_loc1_);
         _loc1_ += this.Renamed6495.height + Renamed6493;
         this.Renamed6502(_loc1_);
         dialogService.addDialog(this);
      }
      
      private function Renamed6502(param1:int) : void
      {
         this.sendButton = new DefaultButtonBase();
         this.sendButton.label = localeService.getText(TextConst.TEXT_SEND_PRESENT_BUTTON);
         this.sendButton.x = Renamed6492;
         this.sendButton.y = param1;
         this.sendButton.addEventListener(MouseEvent.CLICK,this.Renamed6503);
         this.sendButton.enable = false;
         this.window.addChild(this.sendButton);
         var _loc2_:DefaultButtonBase = new DefaultButtonBase();
         _loc2_.label = localeService.getText(TextConst.ALERT_ANSWER_CANCEL);
         _loc2_.x = Renamed6492;
         _loc2_.y = param1;
         _loc2_.addEventListener(MouseEvent.CLICK,this.onCancelClick);
         this.window.addChild(_loc2_);
         var _loc3_:int = Math.max(this.sendButton.width,_loc2_.width);
         this.sendButton.width = _loc3_;
         _loc2_.width = _loc3_;
         var _loc4_:int = this.sendButton.height + 2 * Renamed6493;
         var _loc5_:int = (width - 2 * _loc3_ - _loc4_) / 2;
         this.sendButton.x = _loc5_;
         _loc2_.x = width - _loc3_ - _loc5_;
      }
      
      private function Renamed6501(param1:int) : void
      {
         this.Renamed6495 = new TankInputBase();
         this.Renamed6495.maxChars = 20;
         this.Renamed6495.x = Renamed6492;
         this.Renamed6495.y = param1;
         this.Renamed6495.width = this.window.width - 2 * Renamed6492;
         this.Renamed6495.addEventListener(FocusEvent.FOCUS_OUT,this.Renamed6504);
         this.Renamed6495.textField.addEventListener(Event.CHANGE,this.Renamed6505);
         this.Renamed6495.addEventListener(KeyboardEvent.KEY_UP,this.Renamed6506);
         this.window.addChild(this.Renamed6495);
         this.Renamed6496 = new Renamed6507(this.Renamed6495.textField);
         this.Renamed6496.text = localeService.getText(TextConst.TEXT_PRESENT_RECIPIENT_NAME);
         this.Renamed6496.x = this.Renamed6495.x + Renamed6493;
         this.Renamed6496.y = this.Renamed6495.y + Renamed6493;
         this.window.addChild(this.Renamed6496);
         this.Renamed6497 = new ValidationIcon();
         this.window.addChild(this.Renamed6497);
         this.Renamed6497.x = this.Renamed6495.x + this.Renamed6495.width - this.Renamed6497.width - 15;
         this.Renamed6497.y = param1 + Renamed6493;
      }
      
      private function Renamed6500(param1:int) : void
      {
         this.Renamed6494 = new TextArea();
         this.Renamed6494.maxChars = Renamed6490;
         this.Renamed6494.height = 106;
         this.Renamed6494.width = this.window.width - 2 * Renamed6492;
         this.Renamed6494.x = Renamed6492;
         this.Renamed6494.y = param1;
         this.Renamed6494.tf.addEventListener(Event.CHANGE,this.Renamed6508);
         this.window.addChild(this.Renamed6494);
         var _loc2_:LabelBase = new Renamed6507(this.Renamed6494.tf);
         _loc2_.text = localeService.getText(TextConst.TEXT_TYPE_MESSAGE_WITH_PRESENT);
         _loc2_.x = this.Renamed6494.x + Renamed6493;
         _loc2_.y = this.Renamed6494.y + Renamed6493;
         this.window.addChild(_loc2_);
      }
      
      private function Renamed6506(param1:KeyboardEvent) : void
      {
         if(AlertUtils.isConfirmationKey(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.Renamed6509();
         }
      }
      
      private function Renamed6499(param1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.Renamed6510();
         }
      }
      
      private function Renamed6505(param1:Event) : void
      {
         this.isUidValid = false;
         this.sendButton.enable = false;
         this.Renamed6497.startProgress();
         if(this.Renamed6495.value.length > 0)
         {
            this.Renamed6496.visible = false;
         }
         clearTimeout(this.Renamed6498);
         this.Renamed6511();
         this.Renamed6498 = setTimeout(this.checkUid,Renamed6491);
      }
      
      private function Renamed6508(param1:Event) : void
      {
         this.Renamed6511();
      }
      
      private function Renamed6503(param1:MouseEvent) : void
      {
         this.Renamed6509();
      }
      
      private function Renamed6509() : void
      {
         if(this.Renamed6512())
         {
            this.destroy();
            dispatchEvent(new SendPresentEvent(SendPresentEvent.SEND_PRESENT,this.uid,this.Renamed6494.text));
         }
      }
      
      private function onCancelClick(param1:MouseEvent) : void
      {
         this.Renamed6510();
      }
      
      private function Renamed6510() : void
      {
         dispatchEvent(new Event(Event.CANCEL));
         this.destroy();
      }
      
      private function destroy() : void
      {
         this.sendButton.removeEventListener(MouseEvent.CLICK,this.Renamed6503);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.Renamed6499);
         this.Renamed6495.removeEventListener(KeyboardEvent.KEY_UP,this.Renamed6506);
         dialogService.removeDialog(this);
      }
      
      private function checkUid() : void
      {
         if(this.Renamed6495.value.length == 0)
         {
            this.Renamed6497.turnOff();
            this.Renamed6495.validValue = true;
         }
         else
         {
            this.uid = this.Renamed6495.value;
            Renamed4794.exist(this.uid,this.Renamed6513);
         }
      }
      
      private function Renamed6513(param1:Boolean) : void
      {
         this.Renamed6495.validValue = param1;
         this.isUidValid = param1;
         if(param1)
         {
            this.Renamed6497.markAsValid();
            this.Renamed6511();
         }
         else
         {
            this.Renamed6497.markAsInvalid();
         }
      }
      
      private function Renamed6511() : void
      {
         this.sendButton.enable = this.Renamed6512();
      }
      
      private function Renamed6512() : Boolean
      {
         return this.isUidValid && this.Renamed6514();
      }
      
      private function Renamed6514() : Boolean
      {
         return this.Renamed6494.text.length > 0;
      }
      
      private function Renamed6504(param1:Event) : void
      {
         if(this.Renamed6495.value.length == 0)
         {
            this.Renamed6496.visible = true;
            this.Renamed6497.turnOff();
            this.Renamed6495.validValue = true;
            this.Renamed6511();
         }
      }
   }
}

