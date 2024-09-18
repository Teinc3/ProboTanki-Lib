package alternativa.tanks.service.fps
{
   import alternativa.osgi.service.display.IDisplay;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class § v§ implements FPSService
   {
      [Inject]
      public static var §break package with§:IDisplay;
      
      private var fps:Number;
      
      private var §%M§:Number;
      
      private var lastTime:int;
      
      private var numFrames:int;
      
      private var §for catch§:Boolean;
      
      private var §@!r§:Boolean;
      
      public function § v§()
      {
         super();
      }
      
      public function start() : void
      {
         this.§>!r§(§break package with§.stage.frameRate);
         §break package with§.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         §break package with§.stage.addEventListener(Event.DEACTIVATE,this.§2"o§);
         this.§for catch§ = false;
         this.§@!r§ = true;
      }
      
      private function §>"o§(param1:Event) : void
      {
         if(param1.target == §break package with§.stage)
         {
            §break package with§.stage.removeEventListener(Event.ACTIVATE,this.§>"o§);
            this.§for catch§ = false;
            this.§@!r§ = true;
         }
      }
      
      private function §2"o§(param1:Event) : void
      {
         if(param1.target == §break package with§.stage)
         {
            §break package with§.stage.addEventListener(Event.ACTIVATE,this.§>"o§);
            this.§for catch§ = true;
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         if(this.§for catch§)
         {
            return;
         }
         if(this.§@!r§)
         {
            this.lastTime = getTimer();
            this.numFrames = 0;
            this.§@!r§ = false;
            return;
         }
         var _loc2_:int = getTimer();
         ++this.numFrames;
         if(_loc2_ - this.lastTime > 2000)
         {
            this.§>!r§(1000 * this.numFrames / (_loc2_ - this.lastTime));
            this.lastTime = _loc2_;
            this.numFrames = 0;
         }
      }
      
      private function §>!r§(param1:Number) : void
      {
         this.fps = param1;
         this.§%M§ = 1000 / param1;
      }
      
      public function §,"Q§() : Number
      {
         return this.fps;
      }
      
      public function §>#X§() : Number
      {
         return this.§%M§;
      }
   }
}

