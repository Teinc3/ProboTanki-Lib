package §static set for§
{
   import controls.base.TankInput;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import forms.ColorConstants;
   
   public class §[#>§ extends TankInput
   {
      private var §?",§:String;
      
      private const §<C§:uint = 8421504;
      
      public function §[#>§(param1:String)
      {
         super();
         this.§?",§ = param1;
         value = param1;
         textField.textColor = this.§<C§;
         textField.displayAsPassword = false;
         addEventListener(FocusEvent.FOCUS_IN,this.§%!,§);
         addEventListener(FocusEvent.FOCUS_OUT,this.§while for null§);
      }
      
      public function §%!,§(param1:Event) : void
      {
         if(value == this.§?",§)
         {
            textField.textColor = ColorConstants.WHITE;
            value = "";
            textField.displayAsPassword = this.hidden;
         }
      }
      
      public function §while for null§(param1:Event) : void
      {
         if(value == "")
         {
            textField.textColor = this.§<C§;
            value = this.§?",§;
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

