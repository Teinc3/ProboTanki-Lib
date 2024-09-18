package alternativa.tanks.service.socialnetwork
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.events.EventDispatcher;
   
   public class §5!p§ extends EventDispatcher implements ISocialNetworkPanelService
   {
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      private const VKONTAKTE:String = "vkontakte";
      
      private const FACEBOOK:String = "facebook";
      
      private const §9!]§:String = "google";
      
      private var _passwordCreated:Boolean;
      
      private var §#j§:Boolean;
      
      private var §+T§:Boolean;
      
      private var §return false§:Boolean;
      
      public function §5!p§()
      {
         super();
      }
      
      public function get passwordCreated() : Boolean
      {
         return this._passwordCreated;
      }
      
      public function set passwordCreated(param1:Boolean) : void
      {
         this._passwordCreated = param1;
      }
      
      public function set §6o§(param1:Boolean) : void
      {
         this.§#j§ = param1;
      }
      
      public function set §3"V§(param1:Boolean) : void
      {
         this.§+T§ = param1;
      }
      
      public function set googleLinkExists(param1:Boolean) : void
      {
         this.§return false§ = param1;
      }
      
      public function §&!T§(param1:String) : Boolean
      {
         switch(param1)
         {
            case this.VKONTAKTE:
               return true;
            default:
               return false;
         }
      }
      
      public function §if catch var§(param1:String) : Boolean
      {
         switch(param1)
         {
            case this.VKONTAKTE:
               return this.§#j§;
            case this.FACEBOOK:
               return this.§+T§;
            case this.§9!]§:
               return this.§return false§;
            default:
               return false;
         }
      }
      
      public function §null set throw§(param1:String) : void
      {
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.CREATE_LINK,param1));
      }
      
      public function §4"L§(param1:String) : void
      {
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.UNLINK,param1));
      }
      
      public function §class const throw§(param1:String) : void
      {
         if(param1 == this.VKONTAKTE)
         {
            this.§#j§ = true;
         }
         else if(param1 == this.§9!]§)
         {
            this.§return false§ = true;
         }
         else
         {
            this.§+T§ = true;
         }
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.LINK_SUCCESS,param1));
      }
      
      public function §>#u§(param1:String) : void
      {
         if(param1 == this.VKONTAKTE)
         {
            this.§#j§ = false;
         }
         else if(param1 == this.§9!]§)
         {
            this.§return false§ = false;
         }
         else
         {
            this.§+T§ = false;
         }
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.UNLINK_SUCCESS,param1));
      }
   }
}

