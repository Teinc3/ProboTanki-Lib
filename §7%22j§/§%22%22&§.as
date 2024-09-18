package §7"j§
{
   public class §""&§
   {
      private var §^!V§:int;
      
      private var §include const dynamic§:int;
      
      private var §1"#§:int;
      
      private var maxValue:Number;
      
      private var minValue:Number;
      
      private var §;!S§:Number;
      
      private var value:Number;
      
      private var §use var function§:Number;
      
      private var §]!H§:Number;
      
      private var §9#]§:int;
      
      private var §each package function§:int;
      
      public function §""&§(param1:int, param2:int, param3:int, param4:Number, param5:Number, param6:Number)
      {
         super();
         this.§^!V§ = param1;
         this.§include const dynamic§ = param2;
         this.§1"#§ = param3;
         this.minValue = param4;
         this.maxValue = param5;
         this.§;!S§ = param6;
         this.§]!H§ = param5 - param4;
      }
      
      public function §`!"§(param1:int) : void
      {
         this.§^!V§ = param1;
      }
      
      public function init(param1:int) : void
      {
         this.value = this.maxValue;
         this.§each package function§ = this.§^!V§;
         this.§use var function§ = this.§9Z§(-1);
         this.§9#]§ = param1 + this.§each package function§;
      }
      
      public function §if var dynamic§(param1:Number) : void
      {
         if(param1 >= this.minValue)
         {
            this.maxValue = param1;
            this.§]!H§ = this.maxValue - this.minValue;
         }
      }
      
      public function §5z§(param1:Number) : void
      {
         if(param1 <= this.maxValue)
         {
            this.minValue = param1;
            this.§]!H§ = this.maxValue - this.minValue;
         }
      }
      
      public function §-![§() : Number
      {
         return this.minValue;
      }
      
      public function §default while§(param1:int, param2:int) : Number
      {
         this.value += this.§use var function§ * param2;
         if(this.value > this.maxValue)
         {
            this.value = this.maxValue;
         }
         if(this.value < this.minValue)
         {
            this.value = this.minValue;
         }
         if(param1 >= this.§9#]§)
         {
            if(this.§each package function§ > this.§include const dynamic§)
            {
               this.§each package function§ -= this.§1"#§;
               if(this.§each package function§ < this.§include const dynamic§)
               {
                  this.§each package function§ = this.§include const dynamic§;
               }
            }
            this.§9#]§ = param1 + this.§each package function§;
            if(this.§use var function§ < 0)
            {
               this.§use var function§ = this.§9Z§(1);
            }
            else
            {
               this.§use var function§ = this.§9Z§(-1);
            }
         }
         return this.value;
      }
      
      private function §9Z§(param1:Number) : Number
      {
         return param1 * this.§;!S§ * this.§]!H§ / this.§each package function§;
      }
   }
}

