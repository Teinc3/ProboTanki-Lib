package §else set break§
{
   import § !g§.§class for case§;
   import §""v§.§,"3§;
   import §'#r§.§in const if§;
   import §8!<§.§#"z§;
   import §8!<§.§use const each§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.info.§var var break§;
   import alternativa.tanks.model.info.§with var while§;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.service.address.AddressService;
   import projects.tanks.client.battleselect.model.info.§?S§;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class BattleTeamInfoModel extends §use const each§ implements §#"z§, IObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var addressService:AddressService;
      
      [Inject]
      public static var §]"j§:BattleFormatUtil;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var §=D§:ServerFightCommandAlreadySentFlag;
      
      public function BattleTeamInfoModel()
      {
         super();
      }
      
      public function updateTeamScore(param1:§class for case§, param2:int) : void
      {
         battleInfoFormService.updateTeamScore(param1,param2);
      }
      
      public function swapTeams() : void
      {
         battleInfoFormService.swapTeams();
      }
      
      public function addUser(param1:BattleInfoUser, param2:§class for case§) : void
      {
         battleInfoFormService.addUserTeam(param1,param2);
      }
      
      public function §default var do§() : void
      {
         battleInfoFormService.§package for set§();
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:§?S§ = §with var while§(object.adapt(§with var while§)).getConstructor();
         var _loc2_:BattleInfoTeamParams = new BattleInfoTeamParams();
         _loc2_.autoBalance = getInitParam().autoBalance;
         _loc2_.friendlyFire = getInitParam().friendlyFire;
         _loc2_.scoreBlue = getInitParam().scoreBlue;
         _loc2_.scoreRed = getInitParam().scoreRed;
         _loc2_.usersBlue = getInitParam().usersBlue;
         _loc2_.usersRed = getInitParam().usersRed;
         _loc2_.battleMode = _loc1_.battleMode;
         _loc2_.battleName = _loc1_.name;
         _loc2_.battleItemId = _loc1_.itemId;
         _loc2_.previewResource = §with var while§(object.adapt(§with var while§)).getPreviewResource();
         var _loc3_:String = "battle/" + _loc1_.itemId;
         var _loc4_:String = §var var break§.§return set finally§();
         _loc2_.battleUrl = (_loc4_ + "#/" + _loc3_).replace(/((.+)(\?.*)(#.*))/gi,"$2$4");
         _loc2_.clanLink = §,"3§(_loc1_.map.adapt(§,"3§)).getClanLink();
         _loc2_.clanName = §,"3§(_loc1_.map.adapt(§,"3§)).getClanName();
         _loc2_.scoreLimit = _loc1_.§function function§.scoreLimit;
         _loc2_.timeLimitInSec = _loc1_.§function function§.timeLimitInSec;
         _loc2_.timeLeftInSec = _loc1_.timeLeftInSec;
         _loc2_.maxRank = _loc1_.rankRange.max;
         _loc2_.maxPeopleCount = _loc1_.maxPeopleCount;
         _loc2_.minRank = _loc1_.rankRange.min;
         _loc2_.proBattle = _loc1_.proBattle;
         _loc2_.noSupplies = _loc1_.withoutSupplies;
         _loc2_.spectatorEnabled = _loc1_.spectator;
         _loc2_.withoutBonuses = _loc1_.withoutBonuses;
         _loc2_.withoutCrystals = _loc1_.withoutCrystals;
         _loc2_.proBattleEnterPrice = §in const if§(object.adapt(§in const if§)).getEnterPrice();
         _loc2_.noSuppliesTimeLeftInSec = §in const if§(object.adapt(§in const if§)).getTimeLeftInSec();
         _loc2_.roundStarted = _loc1_.roundStarted;
         _loc2_.userPaidNoSuppliesBattle = _loc1_.userPaidNoSuppliesBattle;
         _loc2_.upgradesDisabled = _loc1_.§4#W§;
         _loc2_.reArmor = _loc1_.reArmor;
         _loc2_.§8z§ = §]"j§.§8z§(_loc1_.equipmentConstraintsMode,_loc1_.parkourMode);
         _loc2_.§;9§ = §]"j§.§<!C§(_loc1_.equipmentConstraintsMode,_loc1_.parkourMode);
         battleInfoFormService.§implements var function§(_loc2_);
         battleInfoFormService.addEventListener(BattleInfoViewEvent.ENTER_TEAM,getFunctionWrapper(this.onEnterTeam));
      }
      
      public function objectUnloaded() : void
      {
         battleInfoFormService.removeEventListener(BattleInfoViewEvent.ENTER_TEAM,getFunctionWrapper(this.onEnterTeam));
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      public function updateUserScore(param1:String, param2:int) : void
      {
         battleInfoFormService.updateUserScore(param1,param2);
      }
      
      private function onEnterTeam(param1:BattleInfoViewEvent) : void
      {
         trackerService.trackEvent("battleList","StartTeamBattle","");
         server.§?!?§(param1.team);
      }
      
      public function §9#g§() : void
      {
         this.§`#u§();
      }
      
      private function §throw var for§() : void
      {
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.§for const import§));
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR),Vector.<String>([localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER),localeService.getText(TanksLocale.TEXT_ALERT_ANSWER_CANCEL)]));
      }
      
      private function §for const import§(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.§for const import§));
         if(param1.typeButton == localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER))
         {
            this.§native var throw§(§class for case§(getData(§class for case§)));
         }
      }
      
      public function §extends set implements§() : void
      {
         this.§`#u§();
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_ERROR_EQUIPMENT_NOT_MATCH_CONSTRAINTS),Vector.<String>([localeService.getText(TanksLocale.TEXT_CLOSE_LABEL)]));
      }
      
      private function §native var throw§(param1:§class for case§) : void
      {
         if(this.§7"z§())
         {
            this.§package switch§();
            server.§?!?§(param1);
         }
      }
      
      private function §package switch§() : void
      {
         putData(ServerFightCommandAlreadySentFlag,this.§=D§);
      }
      
      private function §`#u§() : void
      {
         clearData(ServerFightCommandAlreadySentFlag);
      }
      
      private function §7"z§() : Boolean
      {
         return getData(ServerFightCommandAlreadySentFlag) == null;
      }
      
      public function §+#W§() : void
      {
      }
   }
}

class ServerFightCommandAlreadySentFlag
{
   public function ServerFightCommandAlreadySentFlag()
   {
      super();
   }
}

