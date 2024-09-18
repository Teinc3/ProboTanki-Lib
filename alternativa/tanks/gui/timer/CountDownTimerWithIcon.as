package alternativa.tanks.gui.timer
{
   import assets.icons.BattleInfoIcons;
   import controls.labels.CountDownTimerLabel;
   import controls.timer.CountDownTimer;
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.TimeFormatter;
   
   public class CountDownTimerWithIcon extends Sprite
   {
      private var timerLabel:CountDownTimerLabel;
      
      private var icon:BattleInfoIcons;
      
      private var rightX:int;
      
      public function CountDownTimerWithIcon()
      {
         this.timerLabel = new CountDownTimerLabel();
         super();
         this.icon = new BattleInfoIcons();
         this.icon.type = BattleInfoIcons.TIME_LIMIT;
         addChild(this.icon);
         addChild(this.timerLabel);
         this.timerLabel.addEventListener(Event.CHANGE,this.onChange);
      }
      
      private function onChange(param1:Event) : void
      {
         this.align();
      }
      
      private function align() : void
      {
         this.icon.x = this.rightX - this.timerLabel.width - this.icon.width - 3;
         this.timerLabel.x = this.rightX - this.timerLabel.width;
      }
      
      public function start(param1:CountDownTimer) : void
      {
         this.timerLabel.start(param1);
      }
      
      public function stop() : void
      {
         this.timerLabel.stop();
      }
      
      public function setTime(param1:int) : void
      {
         this.timerLabel.text = TimeFormatter.format(param1);
         this.align();
      }
      
      public function setRightX(param1:int) : void
      {
         this.rightX = param1;
         this.align();
      }
   }
}

