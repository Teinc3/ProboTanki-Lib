package Renamed496
{
   import Renamed230.Renamed2588;
   import flash.events.Event;
   
   public class Renamed2589 extends Event
   {
      public static const Renamed2598:String = "KillMe";
      
      public static const Renamed8864:String = "updateUid";
      
      private var _line:Renamed2588;
      
      public function Renamed2589(param1:String, param2:Renamed2588)
      {
         super(param1,false,false);
         this._line = param2;
      }
      
      public function get line() : Renamed2588
      {
         return this._line;
      }
   }
}

