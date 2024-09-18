package Renamed353
{
   import Renamed136.Renamed663;
   import Renamed1580.Renamed1581;
   import Renamed195.Renamed4750;
   import Renamed4741.Renamed4742;
   import Renamed4741.Renamed7078;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.info.Renamed2126;
   import alternativa.tanks.model.info.Renamed2120;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.service.address.AddressService;
   import projects.tanks.client.battleselect.model.info.Renamed2118;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class BattleTeamInfoModel extends Renamed7078 implements Renamed4742, IObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var addressService:AddressService;
      
      [Inject]
      public static var Renamed1588:BattleFormatUtil;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed8107:ServerFightCommandAlreadySentFlag;
      
      public function BattleTeamInfoModel()
      {
         super();
      }
      
      public function updateTeamScore(param1:Renamed663, param2:int) : void
      {
         battleInfoFormService.updateTeamScore(param1,param2);
      }
      
      public function swapTeams() : void
      {
         battleInfoFormService.swapTeams();
      }
      
      public function addUser(param1:BattleInfoUser, param2:Renamed663) : void
      {
         battleInfoFormService.addUserTeam(param1,param2);
      }
      
      public function Renamed5661() : void
      {
         battleInfoFormService.Renamed3630();
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:Renamed2118 = Renamed2120(object.adapt(Renamed2120)).getConstructor();
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
         _loc2_.previewResource = Renamed2120(object.adapt(Renamed2120)).getPreviewResource();
         var _loc3_:String = "battle/" + _loc1_.itemId;
         var _loc4_:String = Renamed2126.Renamed2127();
         _loc2_.battleUrl = (_loc4_ + "#/" + _loc3_).replace(/((.+)(\?.*)(#.*))/gi,"$2$4");
         _loc2_.clanLink = Renamed1581(_loc1_.map.adapt(Renamed1581)).getClanLink();
         _loc2_.clanName = Renamed1581(_loc1_.map.adapt(Renamed1581)).getClanName();
         _loc2_.scoreLimit = _loc1_.Renamed1601.scoreLimit;
         _loc2_.timeLimitInSec = _loc1_.Renamed1601.timeLimitInSec;
         _loc2_.timeLeftInSec = _loc1_.timeLeftInSec;
         _loc2_.maxRank = _loc1_.rankRange.max;
         _loc2_.maxPeopleCount = _loc1_.maxPeopleCount;
         _loc2_.minRank = _loc1_.rankRange.min;
         _loc2_.proBattle = _loc1_.proBattle;
         _loc2_.noSupplies = _loc1_.withoutSupplies;
         _loc2_.spectatorEnabled = _loc1_.spectator;
         _loc2_.withoutBonuses = _loc1_.withoutBonuses;
         _loc2_.withoutCrystals = _loc1_.withoutCrystals;
         _loc2_.proBattleEnterPrice = Renamed4750(object.adapt(Renamed4750)).getEnterPrice();
         _loc2_.noSuppliesTimeLeftInSec = Renamed4750(object.adapt(Renamed4750)).getTimeLeftInSec();
         _loc2_.roundStarted = _loc1_.roundStarted;
         _loc2_.userPaidNoSuppliesBattle = _loc1_.userPaidNoSuppliesBattle;
         _loc2_.upgradesDisabled = _loc1_.Renamed1602;
         _loc2_.reArmor = _loc1_.reArmor;
         _loc2_.Renamed3642 = Renamed1588.Renamed3642(_loc1_.equipmentConstraintsMode,_loc1_.parkourMode);
         _loc2_.Renamed1625 = Renamed1588.Renamed3643(_loc1_.equipmentConstraintsMode,_loc1_.parkourMode);
         battleInfoFormService.Renamed3627(_loc2_);
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
         server.Renamed3612(param1.team);
      }
      
      public function Renamed8108() : void
      {
         this.Renamed8109();
      }
      
      private function Renamed8110() : void
      {
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.Renamed8111));
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR),Vector.<String>([localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER),localeService.getText(TanksLocale.TEXT_ALERT_ANSWER_CANCEL)]));
      }
      
      private function Renamed8111(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.Renamed8111));
         if(param1.typeButton == localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER))
         {
            this.Renamed8112(Renamed663(getData(Renamed663)));
         }
      }
      
      public function Renamed7634() : void
      {
         this.Renamed8109();
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_ERROR_EQUIPMENT_NOT_MATCH_CONSTRAINTS),Vector.<String>([localeService.getText(TanksLocale.TEXT_CLOSE_LABEL)]));
      }
      
      private function Renamed8112(param1:Renamed663) : void
      {
         if(this.Renamed8113())
         {
            this.Renamed8114();
            server.Renamed3612(param1);
         }
      }
      
      private function Renamed8114() : void
      {
         putData(ServerFightCommandAlreadySentFlag,this.Renamed8107);
      }
      
      private function Renamed8109() : void
      {
         clearData(ServerFightCommandAlreadySentFlag);
      }
      
      private function Renamed8113() : Boolean
      {
         return getData(ServerFightCommandAlreadySentFlag) == null;
      }
      
      public function Renamed8115() : void
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

