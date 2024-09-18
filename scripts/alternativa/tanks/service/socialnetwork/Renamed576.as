package alternativa.tanks.service.socialnetwork
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.events.EventDispatcher;
   
   public class Renamed576 extends EventDispatcher implements ISocialNetworkPanelService
   {
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      private const VKONTAKTE:String = "vkontakte";
      
      private const FACEBOOK:String = "facebook";
      
      private const Renamed3786:String = "google";
      
      private var _passwordCreated:Boolean;
      
      private var Renamed3787:Boolean;
      
      private var Renamed3788:Boolean;
      
      private var Renamed3789:Boolean;
      
      public function Renamed576()
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
      
      public function set Renamed2277(param1:Boolean) : void
      {
         this.Renamed3787 = param1;
      }
      
      public function set Renamed2278(param1:Boolean) : void
      {
         this.Renamed3788 = param1;
      }
      
      public function set googleLinkExists(param1:Boolean) : void
      {
         this.Renamed3789 = param1;
      }
      
      public function Renamed3785(param1:String) : Boolean
      {
         switch(param1)
         {
            case this.VKONTAKTE:
               return true;
            default:
               return false;
         }
      }
      
      public function Renamed1879(param1:String) : Boolean
      {
         switch(param1)
         {
            case this.VKONTAKTE:
               return this.Renamed3787;
            case this.FACEBOOK:
               return this.Renamed3788;
            case this.Renamed3786:
               return this.Renamed3789;
            default:
               return false;
         }
      }
      
      public function Renamed1881(param1:String) : void
      {
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.CREATE_LINK,param1));
      }
      
      public function Renamed1880(param1:String) : void
      {
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.UNLINK,param1));
      }
      
      public function Renamed2280(param1:String) : void
      {
         if(param1 == this.VKONTAKTE)
         {
            this.Renamed3787 = true;
         }
         else if(param1 == this.Renamed3786)
         {
            this.Renamed3789 = true;
         }
         else
         {
            this.Renamed3788 = true;
         }
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.LINK_SUCCESS,param1));
      }
      
      public function Renamed2281(param1:String) : void
      {
         if(param1 == this.VKONTAKTE)
         {
            this.Renamed3787 = false;
         }
         else if(param1 == this.Renamed3786)
         {
            this.Renamed3789 = false;
         }
         else
         {
            this.Renamed3788 = false;
         }
         dispatchEvent(new SocialNetworkServiceEvent(SocialNetworkServiceEvent.UNLINK_SUCCESS,param1));
      }
   }
}

