package alternativa.tanks.view.battlelist
{
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class LocaleBattleList implements ILocaleBattleList
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function LocaleBattleList()
      {
         super();
      }
      
      public function get headerLang() : String
      {
         return localeService.getText(TanksLocale.TEXT_GUI_LANG);
      }
      
      public function get showBattleCreateFormLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLELIST_PANEL_BUTTON_CREATE);
      }
      
      public function get battleSelectLockedMapHelperName() : String
      {
         return localeService.getText(TanksLocale.TEXT_HELP_BATTLE_SELECT_LOCKED_MAP_HELPER_TEXT);
      }
      
      public function get battleSelectLockedMapHelperArrowLength() : int
      {
         return int(localeService.getText(TanksLocale.TEXT_HELP_BATTLE_SELECT_LOCKED_MAP_HELPER_ARROW_LENGTH));
      }
   }
}

