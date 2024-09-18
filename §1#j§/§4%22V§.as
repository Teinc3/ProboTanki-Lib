package §1#j§
{
   import controls.base.LabelBase;
   import flash.events.FocusEvent;
   import flash.text.TextField;
   import forms.ColorConstants;
   
   public class §4"V§ extends LabelBase
   {
      private var input:TextField;
      
      public function §4"V§(param1:TextField)
      {
         super();
         this.input = param1;
         param1.addEventListener(FocusEvent.FOCUS_IN,this.§override var switch§);
         param1.addEventListener(FocusEvent.FOCUS_OUT,this.§do catch break§);
         mouseEnabled = false;
         color = ColorConstants.LIST_LABEL_HINT;
      }
      
      private function §override var switch§(param1:FocusEvent) : void
      {
         visible = false;
      }
      
      private function §do catch break§(param1:FocusEvent) : void
      {
         if(this.input.text.length == 0)
         {
            visible = true;
         }
      }
   }
}

