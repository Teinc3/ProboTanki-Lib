package alternativa.tanks.models.battle.gui.chat
{
   import flash.events.Event;
   
   public class Renamed2573 extends Event
   {
      public static const SEND_MESSAGE:String = "sendMessage";
      
      private var _message:String;
      
      private var Renamed2586:Boolean;
      
      public function Renamed2573(param1:String, param2:String, param3:Boolean)
      {
         super(param1);
         this._message = param2;
         this.Renamed2586 = param3;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get Renamed2583() : Boolean
      {
         return this.Renamed2586;
      }
      
      [Obfuscation(rename="false")]
      override public function clone() : Event
      {
         return new Renamed2573(type,this._message,this.Renamed2586);
      }
      
      [Obfuscation(rename="false")]
      override public function toString() : String
      {
         return "[BattleChatEvent type=" + type + ", message=" + this._message + ", teamOnly=" + this.Renamed2586 + "]";
      }
   }
}

