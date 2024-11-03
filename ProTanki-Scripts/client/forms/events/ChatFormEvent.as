package forms.events
{
   import flash.events.Event;
   
   public class ChatFormEvent extends Event
   {
      public static const SEND_MESSAGE:String = "SendMessage";
      
      public var rangTo:int;
      
      public var nameTo:String;
      
      public function ChatFormEvent(param1:int = 0, param2:String = "")
      {
         this.rangTo = param1;
         this.nameTo = param2;
         super(SEND_MESSAGE,true,false);
      }
   }
}

