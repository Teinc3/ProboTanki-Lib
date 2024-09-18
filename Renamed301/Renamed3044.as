package Renamed301
{
   public class Renamed3044
   {
      private var Renamed7485:Number;
      
      private var Renamed7487:Number;
      
      private var Renamed7486:Number;
      
      private var Renamed7488:Number;
      
      public function Renamed3044(param1:Number, param2:Number, param3:Number)
      {
         super();
         this.Renamed7485 = param1;
         this.Renamed7487 = param2;
         this.Renamed7486 = param3;
         this.Renamed7488 = param2 - param1;
      }
      
      public function Renamed3447(param1:Number) : Number
      {
         if(this.Renamed7488 <= 0)
         {
            return 1;
         }
         if(param1 <= this.Renamed7485)
         {
            return 1;
         }
         if(param1 >= this.Renamed7487)
         {
            return 0.01 * this.Renamed7486;
         }
         return 0.01 * (this.Renamed7486 + (this.Renamed7487 - param1) * (100 - this.Renamed7486) / this.Renamed7488);
      }
      
      public function Renamed3430() : Number
      {
         return this.Renamed7485;
      }
      
      public function Renamed3429() : Number
      {
         return this.Renamed7487;
      }
   }
}

