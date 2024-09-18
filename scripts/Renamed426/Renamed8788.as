package Renamed426
{
   import flash.events.Event;
   
   public class Renamed8788 extends Event
   {
      public static const Renamed8789:String = "REANAME_EVENT";
      
      private var nickname:String;
      
      public function Renamed8788(param1:String)
      {
         super(Renamed8789);
         this.nickname = param1;
      }
      
      public function Renamed8790() : String
      {
         return this.nickname;
      }
   }
}

