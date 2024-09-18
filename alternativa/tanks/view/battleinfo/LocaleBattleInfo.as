package alternativa.tanks.view.battleinfo
{
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class LocaleBattleInfo implements ILocaleBattleInfo
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function LocaleBattleInfo()
      {
         super();
      }
      
      public function get headerLang() : String
      {
         return localeService.getText(TanksLocale.TEXT_GUI_LANG);
      }
      
      public function get fightButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_BUTTON_PLAY);
      }
      
      public function get noNameText() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_NONAME_TEXT);
      }
      
      public function get noSubscribeBattleLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_PRO_BATTLE_SUBSCRIBE);
      }
      
      public function get returnToBattleButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_REARM_BATTLE_RETURN);
      }
      
      public function get exitFromBattleButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_REARM_BATTLE_EXIT);
      }
   }
}

