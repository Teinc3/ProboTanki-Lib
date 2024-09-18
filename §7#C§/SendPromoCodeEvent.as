package §7#C§
{
   import flash.events.Event;
   
   public class SendPromoCodeEvent extends Event
   {
      public static var §dynamic catch true§:String = "SendPromoCodeEvent";
      
      private var §4"]§:String;
      
      public function SendPromoCodeEvent(param1:String)
      {
         this.§4"]§ = param1;
         super(§dynamic catch true§);
      }
      
      public function §""4§() : String
      {
         return this.§4"]§;
      }
   }
}

