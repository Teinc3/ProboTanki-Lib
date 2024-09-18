package scpacker.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.blur.IBlurService;
   import controls.DefaultButton;
   import controls.TankWindow;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class ConfirmEmailCode extends DialogWindow
   {
      private var text:String;
      
      private var callback:Function;
      
      private var window:TankWindow;
      
      private var textLabel:LabelBase;
      
      private var codeInput:TankInputBase;
      
      private var confirmButton:DefaultButton;
      
      private var bg:Sprite;
      
      private var bmp:Bitmap;
      
      public function ConfirmEmailCode(param1:String, param2:Function)
      {
         this.window = new TankWindow();
         this.textLabel = new LabelBase();
         this.codeInput = new TankInputBase();
         this.confirmButton = new DefaultButton();
         this.bg = new Sprite();
         this.bmp = new Bitmap();
         super();
         this.text = param1;
         this.callback = param2;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function draw() : void
      {
         addChild(this.window);
         this.window.width = 400;
         this.window.height = 115;
         this.window.addChild(this.textLabel);
         this.textLabel.text = this.text;
         this.textLabel.x = 15;
         this.textLabel.y = 15;
         this.window.addChild(this.codeInput);
         this.codeInput.maxChars = 32;
         this.codeInput.x = 15;
         this.codeInput.y = 35;
         this.codeInput.width = this.window.width - 30;
         this.window.addChild(this.confirmButton);
         this.confirmButton.label = "OK";
         this.confirmButton.x = this.window.width - this.confirmButton.width - 15;
         this.confirmButton.y = 35 * 2;
         this.confirmButton.addEventListener(MouseEvent.CLICK,this.onClickButton);
         IDialogsService(OSGi.getInstance().getService(IDialogsService)).addDialog(this);
      }
      
      private function onClickButton(param1:Event) : void
      {
         var _loc2_:String = this.codeInput.value;
         if(_loc2_ == null || _loc2_.length != 32 || _loc2_.length > 32)
         {
            this.codeInput.validValue = false;
            return;
         }
         this.codeInput.validValue = true;
         this.callback.call(null,_loc2_);
         IBlurService(OSGi.getInstance().getService(IBlurService)).unblur();
         this.confirmButton.removeEventListener(MouseEvent.CLICK,this.onClickButton);
         IDialogsService(OSGi.getInstance().getService(IDialogsService)).removeDialog(this);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.draw();
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
   }
}

