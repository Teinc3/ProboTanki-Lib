package alternativa.tanks.battle
{
   import flash.utils.getTimer;
   
   public class §in package use§
   {
      private var §<J§:int;
      
      private var lastTime:int;
      
      private var frameCounter:int;
      
      private var fps:Number = 0;
      
      public function §in package use§(param1:int)
      {
         super();
         this.§<J§ = param1;
         this.lastTime = getTimer();
      }
      
      public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(++this.frameCounter >= this.§<J§)
         {
            _loc1_ = getTimer();
            _loc2_ = _loc1_ - this.lastTime;
            this.lastTime = _loc1_;
            this.fps = 1000 * this.frameCounter / _loc2_;
            this.frameCounter = 0;
         }
      }
      
      public function §finally package try§() : Number
      {
         return this.fps;
      }
   }
}

