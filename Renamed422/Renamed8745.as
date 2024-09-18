package Renamed422
{
   import controls.base.TankInput;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import forms.ColorConstants;
   
   public class Renamed8740 extends TankInput
   {
      private var Renamed8741:String;
      
      private const Renamed8742:uint = 8421504;
      
      public function Renamed8740(param1:String)
      {
         super();
         this.Renamed8741 = param1;
         value = param1;
         textField.textColor = this.Renamed8742;
         textField.displayAsPassword = false;
         addEventListener(FocusEvent.FOCUS_IN,this.Renamed8743);
         addEventListener(FocusEvent.FOCUS_OUT,this.Renamed8744);
      }
      
      public function Renamed8743(param1:Event) : void
      {
         if(value == this.Renamed8741)
         {
            textField.textColor = ColorConstants.WHITE;
            value = "";
            textField.displayAsPassword = this.hidden;
         }
      }
      
      public function Renamed8744(param1:Event) : void
      {
         if(value == "")
         {
            textField.textColor = this.Renamed8742;
            value = this.Renamed8741;
            textField.displayAsPassword = false;
         }
      }
      
      public function setValue(param1:String) : void
      {
         this.value = param1;
         textField.textColor = ColorConstants.WHITE;
      }
      
      override public function set hidden(param1:Boolean) : void
      {
         super.hidden = param1;
         textField.displayAsPassword = false;
      }
   }
}

