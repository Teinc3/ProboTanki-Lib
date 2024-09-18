package alternativa.tanks.servermodels.socialnetwork
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IExternalEntranceService;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.client.entrance.model.entrance.externalentrance.SocialNetworkEntranceParams;
   import projects.tanks.client.entrance.model.entrance.externalentrance.Renamed3562;
   import projects.tanks.client.entrance.model.entrance.externalentrance.Renamed3563;
   import projects.tanks.clients.flash.commons.services.nameutils.SocialNetworkNameUtils;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.Renamed1616;
   
   public class ExternalEntranceModel extends Renamed3563 implements Renamed3562, ObjectLoadListener, IExternalEntranceModel
   {
      [Inject]
      public static var Renamed3564:IExternalEntranceService;
      
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      private var isSendStartRegisterFacade:Boolean;
      
      private var isSendStartLoginFacade:Boolean;
      
      private var _socialNetworkId:String;
      
      public function ExternalEntranceModel()
      {
         super();
      }
      
      private static function goToURL(param1:String) : void
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
      
      public function login(param1:String, param2:String) : void
      {
         server.Renamed3565(param1,param2);
      }
      
      public function startExternalRegisterUser(param1:String, param2:Boolean, param3:String) : void
      {
         this.isSendStartRegisterFacade = true;
         this.isSendStartLoginFacade = false;
         this.startExternalEnter(param1,param2,param3);
      }
      
      public function startExternalLoginUser(param1:String, param2:Boolean, param3:String) : void
      {
         this.isSendStartLoginFacade = true;
         this.isSendStartRegisterFacade = false;
         this.startExternalEnter(param1,param2,param3);
      }
      
      private function startExternalEnter(param1:String, param2:Boolean, param3:String) : void
      {
         this._socialNetworkId = param1;
         server.Renamed3566(param2,param3);
         goToURL(this.getAuthorizationUrl(param1));
      }
      
      private function getAuthorizationUrl(param1:String) : String
      {
         var _loc2_:SocialNetworkEntranceParams = null;
         for each(_loc2_ in getInitParam().socialNetworkParams)
         {
            if(_loc2_.snId == param1)
            {
               return _loc2_.authorizationUrl;
            }
         }
         return null;
      }
      
      public function finishExternalRegisterUser(param1:String, param2:String) : void
      {
         server.Renamed3567(param1,param2);
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:SocialNetworkEntranceParams = null;
         for each(_loc1_ in getInitParam().socialNetworkParams)
         {
            Renamed3564.setEnabled(_loc1_.snId,true);
         }
      }
      
      public function validationSuccess() : void
      {
         if(this.isSendStartRegisterFacade)
         {
            this.isSendStartRegisterFacade = false;
            clientFacade.Renamed3568(this._socialNetworkId);
         }
         if(this.isSendStartLoginFacade)
         {
            this.isSendStartLoginFacade = false;
            clientFacade.Renamed3569(this._socialNetworkId);
         }
      }
      
      public function wrongPassword() : void
      {
         clientFacade.Renamed3570();
      }
      
      public function validationFailed() : void
      {
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_ALERT_ERROR_EXTERNAL_ENTER),Vector.<String>([localeService.getText(Renamed1616.OK)]));
         clientFacade.externalValidationFailed();
      }
      
      public function linkAlreadyExists() : void
      {
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_ALERT_GAME_ACCOUNT_ALREADY_LINKED,SocialNetworkNameUtils.makeSocialNetworkNameFromId(this._socialNetworkId)),Vector.<String>([localeService.getText(Renamed1616.OK)]));
         clientFacade.externalLinkAlreadyExists();
      }
   }
}

