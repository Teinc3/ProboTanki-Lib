package projects.tanks.clients.flash.commons.services.nameutils
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class SocialNetworkNameUtils
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function SocialNetworkNameUtils()
      {
         super();
      }
      
      public static function makeSocialNetworkNameFromId(param1:String) : String
      {
         switch(param1)
         {
            case "vkontakte":
               return localeService.getText(TextConst.STRING_VKONTAKTE_NAME);
            case "facebook":
               return localeService.getText(TextConst.STRING_FACEBOOK_NAME);
            default:
               return param1.substr(0,1).toUpperCase() + param1.substr(1);
         }
      }
   }
}

