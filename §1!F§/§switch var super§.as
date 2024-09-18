package §1!F§
{
   import §`#t§.§%!J§;
   import filters.Filters;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   
   public class §switch var super§ extends Sprite
   {
      private static const §^"1§:int = 30000;
      
      protected var §case var const§:Boolean = true;
      
      private var §implements package finally§:Timer;
      
      private var stop:Boolean = false;
      
      private var §import var switch§:Boolean = false;
      
      protected var shadowContainer:Sprite;
      
      public function §switch var super§()
      {
         this.shadowContainer = new Sprite();
         super();
         this.shadowContainer.filters = Filters.SHADOW_FILTERS;
         addChild(this.shadowContainer);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public function §0#R§() : void
      {
         alpha = 1;
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.stop = true;
      }
      
      public function §package for use§() : void
      {
         this.stop = false;
         if(this.§import var switch§)
         {
            this.§use for null§();
         }
      }
      
      public function get alive() : Boolean
      {
         return this.§case var const§;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         setTimeout(this.§9=§,§^"1§);
      }
      
      private function §9=§() : void
      {
         this.§import var switch§ = true;
         if(!this.stop)
         {
            this.§use for null§();
         }
      }
      
      private function §use for null§() : void
      {
         this.§implements package finally§ = new Timer(50,20);
         this.§implements package finally§.addEventListener(TimerEvent.TIMER,this.§+!&§);
         this.§implements package finally§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§8#C§);
         this.§implements package finally§.start();
      }
      
      private function §+!&§(param1:TimerEvent) : void
      {
         if(!this.stop)
         {
            alpha -= 0.05;
         }
         else
         {
            this.§implements package finally§.stop();
            alpha = 1;
         }
      }
      
      private function §8#C§(param1:TimerEvent) : void
      {
         this.§case var const§ = false;
         dispatchEvent(new §%!J§(§%!J§.§null include§,this));
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
   }
}

