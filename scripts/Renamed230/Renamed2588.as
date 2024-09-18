package Renamed230
{
   import Renamed496.Renamed2589;
   import filters.Filters;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   
   public class Renamed2588 extends Sprite
   {
      private static const Renamed6475:int = 30000;
      
      protected var Renamed6476:Boolean = true;
      
      private var Renamed6477:Timer;
      
      private var stop:Boolean = false;
      
      private var Renamed6478:Boolean = false;
      
      protected var shadowContainer:Sprite;
      
      public function Renamed2588()
      {
         this.shadowContainer = new Sprite();
         super();
         this.shadowContainer.filters = Filters.SHADOW_FILTERS;
         addChild(this.shadowContainer);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public function Renamed2607() : void
      {
         alpha = 1;
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.stop = true;
      }
      
      public function Renamed2610() : void
      {
         this.stop = false;
         if(this.Renamed6478)
         {
            this.Renamed6479();
         }
      }
      
      public function get alive() : Boolean
      {
         return this.Renamed6476;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         setTimeout(this.Renamed6480,Renamed6475);
      }
      
      private function Renamed6480() : void
      {
         this.Renamed6478 = true;
         if(!this.stop)
         {
            this.Renamed6479();
         }
      }
      
      private function Renamed6479() : void
      {
         this.Renamed6477 = new Timer(50,20);
         this.Renamed6477.addEventListener(TimerEvent.TIMER,this.Renamed6481);
         this.Renamed6477.addEventListener(TimerEvent.TIMER_COMPLETE,this.Renamed6482);
         this.Renamed6477.start();
      }
      
      private function Renamed6481(param1:TimerEvent) : void
      {
         if(!this.stop)
         {
            alpha -= 0.05;
         }
         else
         {
            this.Renamed6477.stop();
            alpha = 1;
         }
      }
      
      private function Renamed6482(param1:TimerEvent) : void
      {
         this.Renamed6476 = false;
         dispatchEvent(new Renamed2589(Renamed2589.Renamed2598,this));
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
   }
}

