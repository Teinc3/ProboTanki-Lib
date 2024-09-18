package alternativa.tanks.models.battle.battlefield
{
   internal class §2D§
   {
      private static const §##9§:int = 10;
      
      private var §override catch super§:Number;
      
      private var _fps:Number;
      
      private var §override null§:Number;
      
      private var §9T§:Number;
      
      private var §if for§:int;
      
      private var §5"!§:int;
      
      private var §-7§:int;
      
      private var §^!b§:int;
      
      public function §2D§()
      {
         super();
         this.reset();
      }
      
      public function get §function catch get§() : Number
      {
         return this.§override catch super§;
      }
      
      public function get fps() : Number
      {
         return this._fps;
      }
      
      public function get §5'§() : Number
      {
         return this.§override null§;
      }
      
      public function get §'#c§() : Number
      {
         return this.§9T§;
      }
      
      public function §-!b§() : Number
      {
         return 1000 / (this.§^!b§ - this.§-7§) * this.§if for§;
      }
      
      public function get §function const true§() : int
      {
         return this.§if for§;
      }
      
      public function get totalTime() : int
      {
         return this.§^!b§ - this.§-7§;
      }
      
      public function reset() : void
      {
         this.§5"!§ = 0;
         this.§override catch super§ = 0;
         this._fps = 100;
         this.§override null§ = 100;
         this.§9T§ = 0;
         this.§if for§ = 0;
         this.§-7§ = getTimer();
         this.§^!b§ = this.§-7§;
      }
      
      public function update() : void
      {
         var _loc1_:int = getTimer();
         this.§return set return§();
         if(this.§4#q§(_loc1_))
         {
            this.§#",§(_loc1_);
            this.§8"5§();
            this.§^!b§ = _loc1_;
         }
      }
      
      private function §return set return§() : void
      {
         ++this.§if for§;
         ++this.§5"!§;
      }
      
      private function §4#q§(param1:int) : Boolean
      {
         return this.§5"!§ >= §##9§ && param1 > this.§^!b§;
      }
      
      private function §#",§(param1:int) : void
      {
         this.§override catch super§ = (param1 - this.§^!b§) / this.§5"!§;
         this._fps = 1000 / this.§override catch super§;
         this.§5"!§ = 0;
      }
      
      private function §8"5§() : void
      {
         this.§override null§ = Math.min(this.§override null§,this._fps);
         this.§9T§ = Math.max(this.§9T§,this._fps);
      }
   }
}

