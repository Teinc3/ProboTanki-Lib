package §%"v§
{
   internal class §5#Z§ implements §return const§
   {
      private var message:§4#F§;
      
      private var §7" §:int;
      
      private var §in if§:int;
      
      private var §use const in§:Number;
      
      private var §^F§:Number;
      
      private var §^!D§:Number;
      
      public function §5#Z§(param1:§4#F§, param2:int, param3:Number, param4:Number)
      {
         super();
         this.message = param1;
         this.§7" § = param2;
         this.§use const in§ = param3;
         this.§^F§ = param4;
         this.§^!D§ = param4 - param3;
      }
      
      public function init() : void
      {
         this.message.setAlpha(this.§use const in§);
         this.§in if§ = this.§7" §;
      }
      
      public function update(param1:int) : Boolean
      {
         if(this.§in if§ <= 0)
         {
            return false;
         }
         this.§in if§ -= param1;
         if(this.§in if§ < 0)
         {
            this.§in if§ = 0;
         }
         this.message.setAlpha(this.§^F§ - this.§^!D§ * this.§in if§ / this.§7" §);
         return true;
      }
      
      public function §if for extends§(param1:int) : void
      {
         this.§7" § = param1;
      }
   }
}

