package projects.tanks.clients.fp10.libraries.tanksservices.utils
{
   import Renamed232.Renamed1582;
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
      
      public function Renamed3642(param1:Renamed1582, param2:Boolean) : Boolean
      {
         return param2 || param1 != Renamed1582.NONE;
      }
      
      public function Renamed3643(param1:Renamed1582, param2:Boolean) : String
      {
         if(param2)
         {
            return this.Renamed1607();
         }
         switch(param1)
         {
            case Renamed1582.NONE:
               return "";
            case Renamed1582.HORNET_RAILGUN:
               return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_XP);
            case Renamed1582.WASP_RAILGUN:
               return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_BR);
            case Renamed1582.HORNET_WASP_RAILGUN:
               return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_XPBR);
            default:
               return "";
         }
      }
      
      public function Renamed1606(param1:Renamed1582) : String
      {
         if(param1 == Renamed1582.NONE)
         {
            return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_NONE);
         }
         return this.Renamed3643(param1,false);
      }
      
      public function Renamed1607() : String
      {
         return localeService.getText(TanksLocale.TEXT_FORMAT_NAME_PARKOUR);
      }
   }
}

