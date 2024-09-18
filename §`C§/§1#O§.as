package §`C§
{
   import alternativa.tanks.service.IExternalEntranceService;
   import flash.utils.Dictionary;
   
   public class §1#O§ implements IExternalEntranceService
   {
      private static const VKONTAKTE:String = "vkontakte";
      
      private static const FACEBOOK:String = "facebook";
      
      private static const §9!]§:String = "google";
      
      private var §include override§:Dictionary;
      
      public function §1#O§()
      {
         this.§include override§ = new Dictionary();
         super();
      }
      
      public function get §%"I§() : Boolean
      {
         if(this.§include override§[VKONTAKTE])
         {
            return this.§include override§[VKONTAKTE];
         }
         return false;
      }
      
      public function get §package set default§() : Boolean
      {
         if(this.§include override§[FACEBOOK])
         {
            return this.§include override§[FACEBOOK];
         }
         return false;
      }
      
      public function get §final get§() : Boolean
      {
         if(this.§include override§[§9!]§])
         {
            return this.§include override§[§9!]§];
         }
         return false;
      }
      
      public function setEnabled(param1:String, param2:Boolean) : void
      {
         this.§include override§[param1] = param2;
      }
   }
}

