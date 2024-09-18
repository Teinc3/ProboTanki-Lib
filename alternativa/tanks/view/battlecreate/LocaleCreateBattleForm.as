package alternativa.tanks.view.battlecreate
{
   import §?"a§.§finally for do§;
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class LocaleCreateBattleForm implements ILocaleCreateBattleForm
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function LocaleCreateBattleForm()
      {
         super();
      }
      
      public function get headerLang() : String
      {
         return localeService.getText(TanksLocale.TEXT_GUI_LANG);
      }
      
      public function get battleNameLabel() : String
      {
         return localeService.getText(TanksLocale.§-!Y§);
      }
      
      public function get mapNameLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_MAP_TYPE_LABEL);
      }
      
      public function get themeMapNameLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_MAP_THEME_LABEL);
      }
      
      public function get stepperMaxPlayersLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_MAX_PLAYERS);
      }
      
      public function get stepperMaxTeamPlayersLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_MAX_TEAM_SIZE);
      }
      
      public function get stepperTimeLimitLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_TIME_LIMIT);
      }
      
      public function get stepperKillsLimitLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_KILLS_LIMIT);
      }
      
      public function get stepperFlagsLimitLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_FLAG_LIMIT);
      }
      
      public function get checkBoxAutoBalanceLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_CHECKBOX_AUTOBALANCE);
      }
      
      public function get checkBoxFriendlyFireLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_CHECKBOX_FRIENDLY_FIRE);
      }
      
      public function get checkBoxNoSuppliesLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_SUPPLIES_TEXT);
      }
      
      public function get checkBoxBonusesLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_BONUS_BOX_TEXT);
      }
      
      public function get checkBoxCrystalsLabel() : String
      {
         return localeService.getText(TanksLocale.§<G§);
      }
      
      public function get checkBoxSportModeLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_PRO_BATTLE);
      }
      
      public function get checkBoxUpgradesLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_UPGRADES_TEXT);
      }
      
      public function get checkBoxPrivateBattleLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_CHECKBOX_PRIVATE_BATTLE);
      }
      
      public function get startButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_START);
      }
      
      public function get deathMatchButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_DEATHMATCH);
      }
      
      public function get teamDeathMatchButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_TEAM_DEATHMATCH);
      }
      
      public function get captureTheFlagButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_CAPTURE_THE_FLAG);
      }
      
      public function get dominationButtonLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_BUTTON_CONTROL_THE_POINT);
      }
      
      public function get deathMatchButtonShortLabel() : String
      {
         return "DM";
      }
      
      public function get teamDeathMatchButtonShortLabel() : String
      {
         return "TDM";
      }
      
      public function get captureTheFlagButtonShortLabel() : String
      {
         return "CTF";
      }
      
      public function get dominationButtonShortLabel() : String
      {
         return "CP";
      }
      
      public function get stepperDominationLimitLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_STEPPER_TEAM_SCORE_LIMIT);
      }
      
      public function get checkBoxReArmorLabel() : String
      {
         return localeService.getText(TanksLocale.TEXT_REARM_OPTION_TEXT);
      }
      
      public function getThemeName(param1:§finally for do§) : String
      {
         var _loc2_:String = null;
         switch(param1.value)
         {
            case §finally for do§.SUMMER.value:
               _loc2_ = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_SUMMER);
               break;
            case §finally for do§.WINTER.value:
               _loc2_ = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_WINTER);
               break;
            case §finally for do§.SPACE.value:
               _loc2_ = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_SPACE);
               break;
            case §finally for do§.SUMMER_DAY.value:
               _loc2_ = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_SUMMER_DAY);
               break;
            case §finally for do§.SUMMER_NIGHT.value:
               _loc2_ = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_SUMMER_NIGHT);
               break;
            case §finally for do§.WINTER_DAY.value:
               _loc2_ = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_WINTER_DAY);
               break;
            case §finally for do§.WINTER_NIGHT.value:
               _loc2_ = localeService.getText(TanksLocale.TEXT_MAP_THEME_NAME_WINTER_NIGHT);
         }
         return _loc2_;
      }
   }
}

