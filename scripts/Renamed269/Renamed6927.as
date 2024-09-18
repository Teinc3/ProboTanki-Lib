package Renamed1
{
   public class Renamed1450
   {
      private var Renamed6918:int;
      
      private var Renamed6919:int;
      
      private var Renamed6920:int;
      
      private var maxValue:Number;
      
      private var minValue:Number;
      
      private var Renamed6921:Number;
      
      private var value:Number;
      
      private var Renamed6922:Number;
      
      private var Renamed2704:Number;
      
      private var Renamed6923:int;
      
      private var Renamed6924:int;
      
      public function Renamed1450(param1:int, param2:int, param3:int, param4:Number, param5:Number, param6:Number)
      {
         super();
         this.Renamed6918 = param1;
         this.Renamed6919 = param2;
         this.Renamed6920 = param3;
         this.minValue = param4;
         this.maxValue = param5;
         this.Renamed6921 = param6;
         this.Renamed2704 = param5 - param4;
      }
      
      public function Renamed1451(param1:int) : void
      {
         this.Renamed6918 = param1;
      }
      
      public function init(param1:int) : void
      {
         this.value = this.maxValue;
         this.Renamed6924 = this.Renamed6918;
         this.Renamed6922 = this.Renamed2706(-1);
         this.Renamed6923 = param1 + this.Renamed6924;
      }
      
      public function Renamed6925(param1:Number) : void
      {
         if(param1 >= this.minValue)
         {
            this.maxValue = param1;
            this.Renamed2704 = this.maxValue - this.minValue;
         }
      }
      
      public function Renamed1633(param1:Number) : void
      {
         if(param1 <= this.maxValue)
         {
            this.minValue = param1;
            this.Renamed2704 = this.maxValue - this.minValue;
         }
      }
      
      public function Renamed6926() : Number
      {
         return this.minValue;
      }
      
      public function Renamed1452(param1:int, param2:int) : Number
      {
         this.value += this.Renamed6922 * param2;
         if(this.value > this.maxValue)
         {
            this.value = this.maxValue;
         }
         if(this.value < this.minValue)
         {
            this.value = this.minValue;
         }
         if(param1 >= this.Renamed6923)
         {
            if(this.Renamed6924 > this.Renamed6919)
            {
               this.Renamed6924 -= this.Renamed6920;
               if(this.Renamed6924 < this.Renamed6919)
               {
                  this.Renamed6924 = this.Renamed6919;
               }
            }
            this.Renamed6923 = param1 + this.Renamed6924;
            if(this.Renamed6922 < 0)
            {
               this.Renamed6922 = this.Renamed2706(1);
            }
            else
            {
               this.Renamed6922 = this.Renamed2706(-1);
            }
         }
         return this.value;
      }
      
      private function Renamed2706(param1:Number) : Number
      {
         return param1 * this.Renamed6921 * this.Renamed2704 / this.Renamed6924;
      }
   }
}

