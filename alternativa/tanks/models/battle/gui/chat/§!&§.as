package alternativa.tanks.models.battle.gui.chat
{
   import flash.events.Event;
   
   public class §!&§ extends Event
   {
      public static const SEND_MESSAGE:String = "sendMessage";
      
      private var _message:String;
      
      private var §=#F§:Boolean;
      
      public function §!&§(param1:String, param2:String, param3:Boolean)
      {
         super(param1);
         this._message = param2;
         this.§=#F§ = param3;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get §7"W§() : Boolean
      {
         return this.§=#F§;
      }
      
      [Obfuscation(rename="false")]
      override public function clone() : Event
      {
         return new §!&§(type,this._message,this.§=#F§);
      }
      
      [Obfuscation(rename="false")]
      override public function toString() : String
      {
         return "[BattleChatEvent type=" + type + ", message=" + this._message + ", teamOnly=" + this.§=#F§ + "]";
      }
   }
}

