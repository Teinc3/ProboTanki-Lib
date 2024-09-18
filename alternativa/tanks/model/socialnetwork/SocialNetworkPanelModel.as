package alternativa.tanks.model.socialnetwork
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.service.socialnetwork.SocialNetworkServiceEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.panel.model.socialnetwork.§8k§;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelParams;
   import projects.tanks.client.panel.model.socialnetwork.§throw set catch§;
   import projects.tanks.clients.flash.commons.services.nameutils.SocialNetworkNameUtils;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.§get const use§;
   
   public class SocialNetworkPanelModel extends §throw set catch§ implements §8k§, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var socialNetworkService:ISocialNetworkPanelService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      public function SocialNetworkPanelModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         socialNetworkService.passwordCreated = getInitParam().passwordCreated;
         socialNetworkService.§6o§ = this.getLinkExists("vkontakte");
         socialNetworkService.§3"V§ = this.getLinkExists("facebook");
         socialNetworkService.googleLinkExists = this.getLinkExists("google");
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.CREATE_LINK,this.onCreateLink);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.UNLINK,this.onUnlink);
      }
      
      public function objectUnloaded() : void
      {
         socialNetworkService.removeEventListener(SocialNetworkServiceEvent.CREATE_LINK,this.onCreateLink);
         socialNetworkService.removeEventListener(SocialNetworkServiceEvent.UNLINK,this.onUnlink);
      }
      
      private function onUnlink(param1:SocialNetworkServiceEvent) : void
      {
         if(socialNetworkService.passwordCreated)
         {
            server.§+"'§(param1.socialNetworkId);
         }
         else
         {
            alertService.showAlert(localeService.getText(TanksLocale.TEXT_ALERT_ACCOUNT_CANT_BE_UNLINKED,SocialNetworkNameUtils.makeSocialNetworkNameFromId(param1.socialNetworkId)),Vector.<String>([localeService.getText(§get const use§.OK)]));
         }
      }
      
      private function onCreateLink(param1:SocialNetworkServiceEvent) : void
      {
         this.goToURL(this.getAuthorizationUrl(param1.socialNetworkId));
      }
      
      private function getAuthorizationUrl(param1:String) : String
      {
         var _loc2_:SocialNetworkPanelParams = null;
         for each(_loc2_ in getInitParam().socialNetworkParams)
         {
            if(_loc2_.snId == param1)
            {
               return _loc2_.authorizationUrl;
            }
         }
         return "";
      }
      
      private function getLinkExists(param1:String) : Boolean
      {
         var _loc2_:SocialNetworkPanelParams = null;
         for each(_loc2_ in getInitParam().socialNetworkParams)
         {
            if(_loc2_.snId == param1)
            {
               return _loc2_.linkExists;
            }
         }
         return false;
      }
      
      private function goToURL(param1:String) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("newPopup",param1);
         }
         else
         {
            navigateToURL(new URLRequest(param1));
         }
      }
      
      public function validationFailed() : void
      {
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_ALERT_ACCOUNT_LINKING_ERROR),Vector.<String>([localeService.getText(§get const use§.OK)]));
      }
      
      public function linkAlreadyExists(param1:String) : void
      {
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_ALERT_ACCOUNT_ALREADY_LINKED,SocialNetworkNameUtils.makeSocialNetworkNameFromId(param1)),Vector.<String>([localeService.getText(§get const use§.OK)]));
      }
      
      public function linkCreated(param1:String) : void
      {
         socialNetworkService.§class const throw§(param1);
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_ALERT_ACCOUNT_SUCCESS_LINKED),Vector.<String>([localeService.getText(§get const use§.OK)]));
      }
      
      public function unlinkSuccess(param1:String) : void
      {
         socialNetworkService.§>#u§(param1);
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_ALERT_ACCOUNT_UNLINKED,SocialNetworkNameUtils.makeSocialNetworkNameFromId(param1)),Vector.<String>([localeService.getText(§get const use§.OK)]));
      }
   }
}

