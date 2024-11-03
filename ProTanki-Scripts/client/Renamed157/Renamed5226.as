package Renamed5196
{
   internal class Renamed5220 implements Renamed5216
   {
      private var Renamed4164:int;
      
      private var Renamed4234:int;
      
      public function Renamed5220(param1:int)
      {
         super();
         this.Renamed4164 = param1;
      }
      
      public function init() : void
      {
         this.Renamed4234 = this.Renamed4164;
      }
      
      public function update(param1:int) : Boolean
      {
         if(this.Renamed4234 <= 0)
         {
            return false;
         }
         this.Renamed4234 -= param1;
         return true;
      }
      
      public function Renamed5221(param1:int) : void
      {
         this.Renamed4164 = param1;
      }
   }
}

