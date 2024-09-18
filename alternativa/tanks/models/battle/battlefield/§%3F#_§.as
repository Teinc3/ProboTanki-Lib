package alternativa.tanks.models.battle.battlefield
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.§class true§;
   import alternativa.tanks.battle.§else package false§;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class §?#_§ extends §else package false§ implements §;!t§
   {
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const §if set set§:Number = 60;
      
      private static const §default include§:Number = 40;
      
      private static const §1!7§:int = 10;
      
      private static const §while catch set§:int = 30;
      
      private var stage:Stage;
      
      private var §return set var§:§2D§;
      
      private var §>D§:int;
      
      private var frameCounter:int;
      
      private var §9"K§:Number;
      
      private var §8!M§:String;
      
      private var §^!@§:Boolean;
      
      public function §?#_§(param1:Stage, param2:§class true§, param3:§2D§)
      {
         super();
         this.stage = param1;
         this.§return set var§ = param3;
         this.§try continue§();
         this.§,#E§();
         this.§case catch package§();
      }
      
      private function §,#E§() : void
      {
         this.§9"K§ = this.stage.frameRate;
         this.§8!M§ = this.stage.quality;
      }
      
      private function §case catch package§() : void
      {
         this.stage.frameRate = this.§>D§;
         if(GPUCapabilities.gpuEnabled)
         {
            this.stage.quality = StageQuality.MEDIUM;
         }
         else
         {
            this.stage.quality = StageQuality.LOW;
         }
      }
      
      public function § "s§() : void
      {
         this.stage.frameRate = this.§9"K§;
         this.stage.quality = this.§8!M§;
      }
      
      private function §try continue§() : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.§>D§ = §if set set§;
         }
         else
         {
            this.§>D§ = §default include§;
         }
      }
      
      public function §>!e§(param1:Boolean) : void
      {
         if(param1)
         {
            this.§;##§();
         }
         else
         {
            this.§dynamic catch throw§();
         }
      }
      
      private function §;##§() : void
      {
         if(!this.§^!@§)
         {
            §'x§().§%#9§(this);
            this.§^!@§ = true;
         }
      }
      
      private function §dynamic catch throw§() : void
      {
         if(this.§^!@§)
         {
            §'x§().§%"7§(this);
            this.§^!@§ = false;
            this.stage.frameRate = this.§>D§;
         }
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         ++this.frameCounter;
         if(this.frameCounter == §while catch set§)
         {
            this.frameCounter = 0;
            if(this.§super var for§())
            {
               this.§super var catch§();
            }
            else
            {
               this.§throw for extends§();
            }
         }
      }
      
      private function §super var for§() : Boolean
      {
         return this.§return set var§.fps < display.stage.frameRate - 1;
      }
      
      private function §super var catch§() : void
      {
         display.stage.frameRate = this.§return set var§.fps < §1!7§ ? Number(§1!7§) : Number(this.§return set var§.fps);
      }
      
      private function §throw for extends§() : void
      {
         var _loc1_:Number = display.stage.frameRate + 1;
         display.stage.frameRate = _loc1_ > this.§>D§ ? Number(this.§>D§) : Number(_loc1_);
      }
   }
}

