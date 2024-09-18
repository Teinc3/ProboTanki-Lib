package projects.tanks.clients.fp10.libraries.tanksservices.utils
{
   import §1!R§.§throw package static§;
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class BattleFormatUtil
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function BattleFormatUtil()
      {
         super();
      }
      
      public function §8z§(param1:§throw package static§, param2:Boolean) : Boolean
      {
         return param2 || param1 != §throw package static§.NONE;
      }
      
      public function §<!C§(param1:§throw package static§, param2:Boolean) : String
      {
         if(param2)
         {
            return this.§break for return§();
         }
         switch(param1)
         {
            case §throw package static§.NONE:
               return "";
            case §throw package static§.HORNET_RAILGUN:
               return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_XP);
            case §throw package static§.WASP_RAILGUN:
               return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_BR);
            case §throw package static§.HORNET_WASP_RAILGUN:
               return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_XPBR);
            default:
               return "";
         }
      }
      
      public function §]%§(param1:§throw package static§) : String
      {
         if(param1 == §throw package static§.NONE)
         {
            return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_NONE);
         }
         return this.§<!C§(param1,false);
      }
      
      public function §break for return§() : String
      {
         return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_PARKOUR);
      }
   }
}

