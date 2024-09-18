package alternativa.tanks.service.fps
{
   import alternativa.osgi.service.display.IDisplay;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class Renamed570 implements FPSService
   {
      [Inject]
      public static var Renamed3672:IDisplay;
      
      private var fps:Number;
      
      private var Renamed3673:Number;
      
      private var lastTime:int;
      
      private var numFrames:int;
      
      private var Renamed3674:Boolean;
      
      private var Renamed3675:Boolean;
      
      public function Renamed570()
      {
         super();
      }
      
      public function start() : void
      {
         this.Renamed3676(Renamed3672.stage.frameRate);
         Renamed3672.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         Renamed3672.stage.addEventListener(Event.DEACTIVATE,this.Renamed714);
         this.Renamed3674 = false;
         this.Renamed3675 = true;
      }
      
      private function Renamed713(param1:Event) : void
      {
         if(param1.target == Renamed3672.stage)
         {
            Renamed3672.stage.removeEventListener(Event.ACTIVATE,this.Renamed713);
            this.Renamed3674 = false;
            this.Renamed3675 = true;
         }
      }
      
      private function Renamed714(param1:Event) : void
      {
         if(param1.target == Renamed3672.stage)
         {
            Renamed3672.stage.addEventListener(Event.ACTIVATE,this.Renamed713);
            this.Renamed3674 = true;
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         if(this.Renamed3674)
         {
            return;
         }
         if(this.Renamed3675)
         {
            this.lastTime = getTimer();
            this.numFrames = 0;
            this.Renamed3675 = false;
            return;
         }
         var _loc2_:int = getTimer();
         ++this.numFrames;
         if(_loc2_ - this.lastTime > 2000)
         {
            this.Renamed3676(1000 * this.numFrames / (_loc2_ - this.lastTime));
            this.lastTime = _loc2_;
            this.numFrames = 0;
         }
      }
      
      private function Renamed3676(param1:Number) : void
      {
         this.fps = param1;
         this.Renamed3673 = 1000 / param1;
      }
      
      public function Renamed1654() : Number
      {
         return this.fps;
      }
      
      public function Renamed3671() : Number
      {
         return this.Renamed3673;
      }
   }
}

