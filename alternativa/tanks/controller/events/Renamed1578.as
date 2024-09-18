package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class Renamed553 extends Event
   {
      public static const INVITE_ENTERED:String = "INVITE_ENTERED";
      
      private var Renamed1577:String;
      
      public function Renamed553(param1:String)
      {
         this.Renamed1577 = param1;
         super(INVITE_ENTERED);
      }
      
      public function get Renamed1571() : String
      {
         return this.Renamed1577;
      }
   }
}

