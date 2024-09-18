package Renamed333
{
   public class Renamed7857
   {
      private var Renamed7858:Vector.<Renamed7835>;
      
      private var Renamed7859:int;
      
      public function Renamed7857(param1:Vector.<Renamed7835>)
      {
         super();
         this.Renamed7858 = param1;
      }
      
      public function Renamed7860() : Renamed7835
      {
         return this.Renamed7858[this.Renamed7859];
      }
      
      public function Renamed7861() : void
      {
         this.Renamed7859 = (this.Renamed7859 + 1) % this.Renamed7858.length;
      }
   }
}

