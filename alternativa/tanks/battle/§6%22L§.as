package alternativa.tanks.battle
{
   import flash.utils.getTimer;
   
   public class §6"L§
   {
      private var §<J§:int;
      
      private var §get catch static§:int;
      
      private var §class package final§:int;
      
      private var §2"5§:Number = 0;
      
      private var §finally var native§:int;
      
      private var frameCounter:int;
      
      private var §#"`§:int;
      
      public function §6"L§(param1:int)
      {
         super();
         this.§<J§ = param1;
         this.reset();
      }
      
      public function §?""§() : void
      {
         this.§finally var native§ = getTimer();
      }
      
      public function §in catch else§() : void
      {
         var _loc1_:int = getTimer() - this.§finally var native§;
         this.§#"`§ += _loc1_;
         this.§override while§(_loc1_);
         if(++this.frameCounter >= this.§<J§)
         {
            this.§2"5§ = this.§#"`§ / this.frameCounter;
            this.§#"`§ = 0;
            this.frameCounter = 0;
         }
      }
      
      public function §true case§() : Number
      {
         return this.§2"5§;
      }
      
      public function §catch catch throw§() : Number
      {
         return 1000 / this.§2"5§;
      }
      
      private function §override while§(param1:int) : void
      {
         if(param1 > this.§class package final§)
         {
            this.§class package final§ = param1;
         }
         else if(param1 < this.§get catch static§)
         {
            this.§get catch static§ = param1;
         }
      }
      
      public function reset() : void
      {
         this.§get catch static§ = 0;
         this.§class package final§ = 0;
         this.§2"5§ = 0;
         this.frameCounter = 0;
         this.§#"`§ = 0;
      }
   }
}

