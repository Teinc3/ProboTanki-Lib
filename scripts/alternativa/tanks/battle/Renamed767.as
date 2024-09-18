package alternativa.tanks.battle
{
   import flash.utils.getTimer;
   
   public class Renamed755
   {
      private var Renamed756:int;
      
      private var Renamed757:int;
      
      private var Renamed758:int;
      
      private var Renamed759:Number = 0;
      
      private var Renamed760:int;
      
      private var frameCounter:int;
      
      private var Renamed761:int;
      
      public function Renamed755(param1:int)
      {
         super();
         this.Renamed756 = param1;
         this.reset();
      }
      
      public function Renamed762() : void
      {
         this.Renamed760 = getTimer();
      }
      
      public function Renamed763() : void
      {
         var _loc1_:int = getTimer() - this.Renamed760;
         this.Renamed761 += _loc1_;
         this.Renamed764(_loc1_);
         if(++this.frameCounter >= this.Renamed756)
         {
            this.Renamed759 = this.Renamed761 / this.frameCounter;
            this.Renamed761 = 0;
            this.frameCounter = 0;
         }
      }
      
      public function Renamed765() : Number
      {
         return this.Renamed759;
      }
      
      public function Renamed766() : Number
      {
         return 1000 / this.Renamed759;
      }
      
      private function Renamed764(param1:int) : void
      {
         if(param1 > this.Renamed758)
         {
            this.Renamed758 = param1;
         }
         else if(param1 < this.Renamed757)
         {
            this.Renamed757 = param1;
         }
      }
      
      public function reset() : void
      {
         this.Renamed757 = 0;
         this.Renamed758 = 0;
         this.Renamed759 = 0;
         this.frameCounter = 0;
         this.Renamed761 = 0;
      }
   }
}

