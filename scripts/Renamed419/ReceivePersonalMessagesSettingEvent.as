package Renamed419
{
   import alternativa.tanks.gui.settings.Renamed1979;
   
   public class ReceivePersonalMessagesSettingEvent extends Renamed1979
   {
      public static var Renamed2193:String = "ReceivePersonalMessagesSettingEvent";
      
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

