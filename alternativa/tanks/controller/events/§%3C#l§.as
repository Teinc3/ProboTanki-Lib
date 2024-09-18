package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class §<#l§ extends Event
   {
      public static const INVITE_ENTERED:String = "INVITE_ENTERED";
      
      private var §override for include§:String;
      
      public function §<#l§(param1:String)
      {
         this.§override for include§ = param1;
         super(INVITE_ENTERED);
      }
      
      public function get §9!,§() : String
      {
         return this.§override for include§;
      }
   }
}

