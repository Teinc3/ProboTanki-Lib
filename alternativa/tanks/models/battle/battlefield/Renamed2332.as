package alternativa.tanks.models.battle.battlefield
{
   internal class Renamed2332
   {
      private static const Renamed2350:int = 10;
      
      private var Renamed2351:Number;
      
      private var _fps:Number;
      
      private var Renamed2352:Number;
      
      private var Renamed2353:Number;
      
      private var Renamed2354:int;
      
      private var Renamed2355:int;
      
      private var Renamed2356:int;
      
      private var Renamed2357:int;
      
      public function Renamed2332()
      {
         super();
         this.reset();
      }
      
      public function get Renamed2358() : Number
      {
         return this.Renamed2351;
      }
      
      public function get fps() : Number
      {
         return this._fps;
      }
      
      public function get Renamed2359() : Number
      {
         return this.Renamed2352;
      }
      
      public function get Renamed2360() : Number
      {
         return this.Renamed2353;
      }
      
      public function Renamed2361() : Number
      {
         return 1000 / (this.Renamed2357 - this.Renamed2356) * this.Renamed2354;
      }
      
      public function get Renamed2362() : int
      {
         return this.Renamed2354;
      }
      
      public function get totalTime() : int
      {
         return this.Renamed2357 - this.Renamed2356;
      }
      
      public function reset() : void
      {
         this.Renamed2355 = 0;
         this.Renamed2351 = 0;
         this._fps = 100;
         this.Renamed2352 = 100;
         this.Renamed2353 = 0;
         this.Renamed2354 = 0;
         this.Renamed2356 = getTimer();
         this.Renamed2357 = this.Renamed2356;
      }
      
      public function update() : void
      {
         var _loc1_:int = getTimer();
         this.Renamed2363();
         if(this.Renamed2364(_loc1_))
         {
            this.Renamed2365(_loc1_);
            this.Renamed2366();
            this.Renamed2357 = _loc1_;
         }
      }
      
      private function Renamed2363() : void
      {
         ++this.Renamed2354;
         ++this.Renamed2355;
      }
      
      private function Renamed2364(param1:int) : Boolean
      {
         return this.Renamed2355 >= Renamed2350 && param1 > this.Renamed2357;
      }
      
      private function Renamed2365(param1:int) : void
      {
         this.Renamed2351 = (param1 - this.Renamed2357) / this.Renamed2355;
         this._fps = 1000 / this.Renamed2351;
         this.Renamed2355 = 0;
      }
      
      private function Renamed2366() : void
      {
         this.Renamed2352 = Math.min(this.Renamed2352,this._fps);
         this.Renamed2353 = Math.max(this.Renamed2353,this._fps);
      }
   }
}

