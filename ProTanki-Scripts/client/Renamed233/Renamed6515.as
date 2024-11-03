package Renamed233
{
   import controls.base.LabelBase;
   import flash.events.FocusEvent;
   import flash.text.TextField;
   import forms.ColorConstants;
   
   public class Renamed6507 extends LabelBase
   {
      private var input:TextField;
      
      public function Renamed6507(param1:TextField)
      {
         super();
         this.input = param1;
         param1.addEventListener(FocusEvent.FOCUS_IN,this.Renamed2638);
         param1.addEventListener(FocusEvent.FOCUS_OUT,this.Renamed2640);
         mouseEnabled = false;
         color = ColorConstants.LIST_LABEL_HINT;
      }
      
      private function Renamed2638(param1:FocusEvent) : void
      {
         visible = false;
      }
      
      private function Renamed2640(param1:FocusEvent) : void
      {
         if(this.input.text.length == 0)
         {
            visible = true;
         }
      }
   }
}

