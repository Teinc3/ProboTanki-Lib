package Renamed266
{
   import flash.events.Event;
   
   public class SendPromoCodeEvent extends Event
   {
      public static var Renamed2232:String = "SendPromoCodeEvent";
      
      private var Renamed6841:String;
      
      public function SendPromoCodeEvent(param1:String)
      {
         this.Renamed6841 = param1;
         super(Renamed2232);
      }
      
      public function Renamed2226() : String
      {
         return this.Renamed6841;
      }
   }
}

