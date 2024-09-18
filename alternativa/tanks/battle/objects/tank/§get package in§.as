package alternativa.tanks.battle.objects.tank
{
   public class §get package in§ implements §implements set get§
   {
      private var currentValue:Number;
      
      private var §]"D§:Number;
      
      private var §;!u§:Number;
      
      private var §,"Z§:Number;
      
      public function §get package in§(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.§;!u§ = param1;
         this.§,"Z§ = param2;
         this.§]"D§ = param3;
         this.currentValue = param4;
      }
      
      public function reset(param1:Number) : void
      {
         this.currentValue = param1;
         this.§]"D§ = param1;
      }
      
      public function update(param1:Number) : Number
      {
         if(this.currentValue < this.§]"D§)
         {
            this.currentValue += this.§;!u§ * param1;
            if(this.currentValue > this.§]"D§)
            {
               this.currentValue = this.§]"D§;
            }
         }
         else if(this.currentValue > this.§]"D§)
         {
            this.currentValue -= this.§,"Z§ * param1;
            if(this.currentValue < this.§]"D§)
            {
               this.currentValue = this.§]"D§;
            }
         }
         return this.currentValue;
      }
      
      public function §while catch do§(param1:Number) : void
      {
         this.§]"D§ = param1;
      }
      
      public function §try package finally§() : Number
      {
         return this.§]"D§;
      }
   }
}

