package §switch const super§
{
   import §%3§.MessageColor;
   import §-!z§.§!"L§;
   import §1!F§.§switch var super§;
   import §`#t§.§%!J§;
   import controls.Label;
   import forms.userlabel.ChatUpdateEvent;
   import §if catch while§.§="G§;
   import §if catch while§.§catch const for§;
   
   public class §super catch var§ extends §switch var super§
   {
      private var §8!z§:§="G§;
      
      private var label:Label;
      
      public function §super catch var§(param1:§!"L§, param2:String, param3:§!"L§ = null)
      {
         super();
         if(param1 != null)
         {
            this.§null for class§(param1);
         }
         this.§=q§(param2);
         if(param3 != null)
         {
            this.§null for class§(param3);
         }
      }
      
      private function §null for class§(param1:§!"L§) : void
      {
         this.§8!z§ = new §catch const for§(param1.userId);
         this.§8!z§.addEventListener(ChatUpdateEvent.UPDATE,this.§4b§);
         this.§8!z§.setUidColor(MessageColor.§null function§(param1.teamType,false),true);
         this.§8!z§.x = width + 4;
         addChild(this.§8!z§);
      }
      
      private function §4b§(param1:ChatUpdateEvent) : void
      {
         this.§8!z§.x = 4;
         this.label.x = this.§8!z§.width + 4;
         dispatchEvent(new §%!J§(§%!J§.§try catch const§,this));
      }
      
      private function §=q§(param1:String) : void
      {
         this.label = new Label();
         this.label.text = param1;
         this.label.x = width + 4;
         shadowContainer.addChild(this.label);
      }
   }
}

