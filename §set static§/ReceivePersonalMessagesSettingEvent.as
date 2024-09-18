package §set static§
{
   import alternativa.tanks.gui.settings.§for const true§;
   
   public class ReceivePersonalMessagesSettingEvent extends §for const true§
   {
      public static var §if set get§:String = "ReceivePersonalMessagesSettingEvent";
      
      private var value:Boolean;
      
      public function ReceivePersonalMessagesSettingEvent(param1:String, param2:Boolean)
      {
         super(param1);
         this.value = param2;
      }
      
      public function getValue() : Boolean
      {
         return this.value;
      }
   }
}

