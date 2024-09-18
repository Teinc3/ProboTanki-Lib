package alternativa.tanks.models.battle.battlefield
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.battle.Renamed832;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class Renamed2326 extends Renamed832 implements Renamed768
   {
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const Renamed2327:Number = 60;
      
      private static const Renamed2328:Number = 40;
      
      private static const Renamed2329:int = 10;
      
      private static const Renamed2330:int = 30;
      
      private var stage:Stage;
      
      private var Renamed2331:Renamed2332;
      
      private var Renamed2333:int;
      
      private var frameCounter:int;
      
      private var Renamed2334:Number;
      
      private var Renamed2335:String;
      
      private var Renamed2336:Boolean;
      
      public function Renamed2326(param1:Stage, param2:Renamed620, param3:Renamed2332)
      {
         super();
         this.stage = param1;
         this.Renamed2331 = param3;
         this.Renamed2337();
         this.Renamed2338();
         this.Renamed2339();
      }
      
      private function Renamed2338() : void
      {
         this.Renamed2334 = this.stage.frameRate;
         this.Renamed2335 = this.stage.quality;
      }
      
      private function Renamed2339() : void
      {
         this.stage.frameRate = this.Renamed2333;
         if(GPUCapabilities.gpuEnabled)
         {
            this.stage.quality = StageQuality.MEDIUM;
         }
         else
         {
            this.stage.quality = StageQuality.LOW;
         }
      }
      
      public function Renamed2340() : void
      {
         this.stage.frameRate = this.Renamed2334;
         this.stage.quality = this.Renamed2335;
      }
      
      private function Renamed2337() : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.Renamed2333 = Renamed2327;
         }
         else
         {
            this.Renamed2333 = Renamed2328;
         }
      }
      
      public function Renamed2341(param1:Boolean) : void
      {
         if(param1)
         {
            this.Renamed2342();
         }
         else
         {
            this.Renamed2343();
         }
      }
      
      private function Renamed2342() : void
      {
         if(!this.Renamed2336)
         {
            Renamed619().Renamed815(this);
            this.Renamed2336 = true;
         }
      }
      
      private function Renamed2343() : void
      {
         if(this.Renamed2336)
         {
            Renamed619().Renamed816(this);
            this.Renamed2336 = false;
            this.stage.frameRate = this.Renamed2333;
         }
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         ++this.frameCounter;
         if(this.frameCounter == Renamed2330)
         {
            this.frameCounter = 0;
            if(this.Renamed2344())
            {
               this.Renamed2345();
            }
            else
            {
               this.Renamed2346();
            }
         }
      }
      
      private function Renamed2344() : Boolean
      {
         return this.Renamed2331.fps < display.stage.frameRate - 1;
      }
      
      private function Renamed2345() : void
      {
         display.stage.frameRate = this.Renamed2331.fps < Renamed2329 ? Number(Renamed2329) : Number(this.Renamed2331.fps);
      }
      
      private function Renamed2346() : void
      {
         var _loc1_:Number = display.stage.frameRate + 1;
         display.stage.frameRate = _loc1_ > this.Renamed2333 ? Number(this.Renamed2333) : Number(_loc1_);
      }
   }
}

