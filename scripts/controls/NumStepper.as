package controls
{
   import assets.icons.BattleInfoIcons;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.GridFitType;
   import flash.text.TextFieldType;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import forms.events.LoginFormEvent;
   
   public class NumStepper extends MovieClip
   {
      private const CHANGE_COUNTER_VALUE:int = 7;
      
      private const DEFAULT_INTERVAL_DURATION:int = 75;
      
      protected var tf:TankInputBase;
      
      protected var button:StepperButton;
      
      protected var _value:int = 0;
      
      protected var _maxValue:int = 10;
      
      protected var _minValue:int = 0;
      
      protected var _labell:LabelBase;
      
      private var _step:int = 1;
      
      protected var _stepAddedByInterval:int;
      
      protected var _intervalDuration:int = 75;
      
      protected var _intervalId:uint;
      
      protected var _intervalCounter:int = 0;
      
      protected var _stepIndex:int = 0;
      
      protected var _timerDelay:int = 500;
      
      protected var _timer:Timer;
      
      protected var _icon:BattleInfoIcons;
      
      private var _enable:Boolean = true;
      
      private var _iconBitmap:DisplayObject;
      
      public function NumStepper(param1:int = 1, param2:int = 5)
      {
         this.STEPS = new <int>[1,5,10,20,50,100,200,500];
         this.tf = new TankInputBase();
         this.button = new StepperButton();
         super();
         this.step = param1;
         this._stepAddedByInterval = this.getStepByIndex(0);
         addChild(this.tf);
         this.tf.width = 55;
         this.tf.x = 19;
         addChild(this.button);
         this.button.x = 75;
         this.tf.restrict = "0-9";
         this.tf.maxChars = param2;
         this.tf.align = TextFormatAlign.CENTER;
         this.tf.textField.addEventListener(FocusEvent.FOCUS_OUT,this.onTextChange);
         this.tf.textField.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this.onTextChange);
         this.tf.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onTextChange);
         this.tf.textField.addEventListener(FocusEvent.FOCUS_IN,this.clearTF);
         this._timer = new Timer(this._timerDelay,1);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.draw();
         this.enabled = true;
      }
      
      private static function getTrimString(param1:String) : String
      {
         return param1.replace(" ","");
      }
      
      public function set timerDelay(param1:int) : void
      {
         this._timerDelay = param1;
         this._timer.delay = param1;
      }
      
      public function get timerDelay() : int
      {
         return this._timerDelay;
      }
      
      public function set minValue(param1:int) : void
      {
         this._minValue = param1;
         this._value = Math.max(this._value,this._minValue);
         this.draw();
      }
      
      public function set maxValue(param1:int) : void
      {
         this._maxValue = param1;
         this._value = Math.min(this._value,this._maxValue);
         this.draw();
      }
      
      public function set iconBitmap(param1:BitmapData) : void
      {
         if(this._iconBitmap != null)
         {
            removeChildAt(0);
         }
         this._iconBitmap = new Bitmap(param1);
         addChildAt(this._iconBitmap,0);
         this._iconBitmap.y = 8;
      }
      
      public function set icon(param1:int) : void
      {
         if(this._icon == null)
         {
            this._icon = new BattleInfoIcons();
            this._icon.y = 8;
            addChildAt(this._icon,0);
         }
         this._icon.type = param1;
      }
      
      public function set label(param1:String) : void
      {
         if(this._labell == null)
         {
            this._labell = new LabelBase();
            this._labell.x = 18;
            this._labell.y = -18;
            this._labell.gridFitType = GridFitType.SUBPIXEL;
            addChild(this._labell);
         }
         this._labell.text = param1;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function set value(param1:int) : void
      {
         this._value = param1;
         this.draw();
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this._intervalId = setInterval(this.changeCounterByTime,this._intervalDuration);
      }
      
      private function changeCounterByTime() : void
      {
         stage.focus = this.button;
         this.button.gotoAndStop(this.button.mouseY < 15 ? 2 : 3);
         this._value = Number(getTrimString(this.tf.value));
         this._value += this.button.mouseY <= 15 ? this._stepAddedByInterval : -this._stepAddedByInterval;
         this._value = Math.max(Math.min(this._value,this._maxValue),this._minValue);
         this.draw();
         ++this._intervalCounter;
         if(this._intervalCounter >= this.CHANGE_COUNTER_VALUE)
         {
            if(this._stepIndex + 1 < this.STEPS.length)
            {
               if(this._value % this.getStepByIndex(this._stepIndex + 1) < this._step)
               {
                  this._intervalCounter = 0;
                  this._stepAddedByInterval = this.getStepByIndex(this._stepIndex + 1);
                  ++this._stepIndex;
               }
            }
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         this._enable = param1;
         if(this._enable)
         {
            this.button.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.button.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            this.button.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseUp);
            this.tf.textField.selectable = true;
            this.tf.textField.type = TextFieldType.INPUT;
         }
         else
         {
            this.button.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            this.button.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            this.button.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseUp);
            this.tf.textField.selectable = false;
            this.tf.textField.type = TextFieldType.DYNAMIC;
         }
         mouseEnabled = param1;
         mouseChildren = param1;
      }
      
      override public function get enabled() : Boolean
      {
         return this._enable;
      }
      
      private function clearTF(param1:Event) : void
      {
         if(this.tf.value == "—")
         {
            this.tf.clear();
         }
      }
      
      private function onTextChange(param1:Event) : void
      {
         var _loc2_:int = Number(getTrimString(this.tf.value));
         this._value = Math.max(this._minValue,Math.min(_loc2_,this._maxValue));
         this.draw();
      }
      
      protected function onMouseDown(param1:MouseEvent) : void
      {
         stage.focus = this.button;
         this.button.gotoAndStop(this.button.mouseY < 15 ? 2 : 3);
         this._value = Number(getTrimString(this.tf.value));
         this._value = Math.min(this._value,this._maxValue);
         var _loc2_:int = this._value + (this.button.mouseY > 15 ? -this._step : this._step);
         this._value = Math.max(this._minValue,Math.min(_loc2_,this._maxValue));
         this._timer.reset();
         this._timer.start();
         this.draw();
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.button.gotoAndStop(1);
         this._timer.stop();
         clearInterval(this._intervalId);
         this._intervalCounter = 0;
         this._stepAddedByInterval = this.getStepByIndex(0);
         this._stepIndex = 0;
      }
      
      protected function draw() : void
      {
         if(stage != null)
         {
            this.tf.value = this._value > 0 || stage.focus == this.tf.textField ? Money.numToString(this.value,false) : "—";
            if(this.enabled)
            {
               dispatchEvent(new Event(Event.CHANGE));
            }
         }
         else
         {
            this.tf.value = this._value > 0 ? Money.numToString(this.value,false) : "—";
         }
      }
      
      public function get step() : int
      {
         return this._step;
      }
      
      public function set step(param1:int) : void
      {
         this._step = param1;
      }
      
      public function getStepByIndex(param1:int) : int
      {
         return this.STEPS[param1] * this._step;
      }
   }
}

