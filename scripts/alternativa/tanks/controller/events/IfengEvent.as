package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class IfengEvent extends Event
   {
      public static const REGISTRATION_FAILED:String = "IfengEvent.REGISTRATION_FAILED";
      
      public static const START_REGISTRATION:String = "IfengEvent.START_REGISTRATION";
      
      public static const WRONG_URL_PARAMS:String = "IfengEvent.WRONG_URL_PARAMS";
      
      public function IfengEvent(param1:String)
      {
         super(param1);
      }
   }
}

