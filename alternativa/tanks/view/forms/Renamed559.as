package alternativa.tanks.view.forms
{
   import alternativa.tanks.view.events.Renamed3890;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class Renamed559 extends Sprite
   {
      private const windowMargin:int = 11;
      
      private const Renamed3949:int = 300;
      
      private var window:TankWindow;
      
      private var label:LabelBase;
      
      private var input:TankInputBase;
      
      private var okButton:DefaultButtonBase;
      
      public function Renamed559()
      {
         this.buttonSize = new Point(104,33);
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var event:Event = param1;
         this.window = new TankWindow();
         addChild(this.window);
         this.window.width = this.Renamed3949 + this.windowMargin * 2;
         this.label = new LabelBase();
         addChild(this.label);
         this.label.bold = true;
         this.label.text = "Please, enter your invite code and keep it:";
         this.label.x = Math.round((this.window.width - this.label.textWidth) * 0.5) - 7;
         this.label.y = this.windowMargin;
         this.input = new TankInputBase();
         addChild(this.input);
         this.input.width = this.Renamed3949;
         this.input.x = Math.round((this.window.width - this.input.width) * 0.5) + 5;
         this.input.y = this.label.y + this.label.textHeight + 5;
         this.okButton = new DefaultButtonBase();
         addChild(this.okButton);
         this.okButton.label = "Ok";
         this.okButton.x = Math.round((this.window.width - this.buttonSize.x) * 0.5);
         this.okButton.y = this.input.y + this.input.height + 5;
         this.okButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            dispatchEvent(new Renamed3890());
         });
         this.input.addEventListener(KeyboardEvent.KEY_DOWN,function(param1:KeyboardEvent):void
         {
            if(param1.keyCode == Keyboard.ENTER)
            {
               dispatchEvent(new Renamed3890());
            }
         });
         this.window.height = this.okButton.y + this.buttonSize.y + this.windowMargin;
         this.Renamed3950();
         stage.addEventListener(Event.RESIZE,this.Renamed3950);
         addEventListener(Event.REMOVED_FROM_STAGE,function(param1:Event):void
         {
            stage.removeEventListener(Event.RESIZE,Renamed3950);
         });
      }
      
      public function get code() : String
      {
         return this.input.textField.text;
      }
      
      public function set code(param1:String) : void
      {
         this.input.textField.text = param1;
      }
      
      public function Renamed3893() : void
      {
         this.label.text = "Invite code is not valid";
         this.label.color = 6684672;
         this.label.thickness = 100;
         this.label.sharpness = -100;
         this.label.x = Math.round((this.window.width - this.label.textWidth) * 0.5) - 7;
      }
      
      private function Renamed3950(param1:Event = null) : void
      {
         x = Math.round((stage.stageWidth - width) * 0.5);
         y = Math.round((stage.stageHeight - height) * 0.5);
      }
   }
}

