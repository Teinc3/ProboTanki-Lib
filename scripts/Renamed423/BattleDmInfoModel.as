package Renamed423
{
   import Renamed1580.Renamed1581;
   import Renamed195.Renamed4750;
   import Renamed4743.Renamed5664;
   import Renamed4743.Renamed4744;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.info.Renamed2126;
   import alternativa.tanks.model.info.Renamed2120;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDmParams;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import projects.tanks.client.battleselect.model.info.Renamed2118;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class BattleDmInfoModel extends Renamed5664 implements Renamed4744, IObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      [Inject]
      public static var Renamed1588:BattleFormatUtil;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed8107:ServerFightCommandAlreadySentFlag;
      
      private var Renamed8746:Boolean = false;
      
      public function BattleDmInfoModel()
      {
         super();
         this.Renamed8107 = new ServerFightCommandAlreadySentFlag();
      }
      
      public function addUser(param1:BattleInfoUser) : void
      {
         battleInfoFormService.Renamed3628(param1);
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
         var _loc2_:BattleInfoDmParams = new BattleInfoDmParams();
         _loc2_.users = getInitParam().users;
         _loc2_.battleMode = _loc1_.battleMode;
         _loc2_.battleName = _loc1_.name;
         _loc2_.previewResource = Renamed2120(object.adapt(Renamed2120)).getPreviewResource();
         _loc2_.battleItemId = _loc1_.itemId;
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
         battleInfoFormService.Renamed3626(_loc2_);
         battleInfoFormService.addEventListener(BattleInfoViewEvent.ENTER_DM,getFunctionWrapper(this.onEnterDm));
      }
      
      public function objectUnloaded() : void
      {
         battleInfoFormService.removeEventListener(BattleInfoViewEvent.ENTER_DM,getFunctionWrapper(this.onEnterDm));
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      public function Renamed5662(param1:String, param2:int) : void
      {
         battleInfoFormService.updateUserScore(param1,param2);
      }
      
      private function onEnterDm(param1:BattleInfoViewEvent) : void
      {
         trackerService.trackEvent("battleList","StartDMBattle","");
         server.Renamed3612();
      }
      
      public function Renamed8108() : void
      {
         this.Renamed8109();
      }
      
      private function Renamed8110() : void
      {
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.Renamed8111));
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR),Vector.<String>([localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER),localeService.getText(TanksLocale.TEXT_ALERT_ANSWER_CANCEL)]));
         this.Renamed8746 = true;
      }
      
      private function Renamed8111(param1:AlertServiceEvent) : void
      {
         this.Renamed8746 = false;
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,getFunctionWrapper(this.Renamed8111));
         if(param1.typeButton == localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER))
         {
            this.Renamed8112();
         }
      }
      
      public function Renamed7634() : void
      {
         this.Renamed8109();
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_ERROR_EQUIPMENT_NOT_MATCH_CONSTRAINTS),Vector.<String>([localeService.getText(TanksLocale.TEXT_CLOSE_LABEL)]));
      }
      
      private function Renamed8112() : void
      {
         if(this.Renamed8113())
         {
            this.Renamed8114();
            server.Renamed3612();
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
   }
}

class ServerFightCommandAlreadySentFlag
{
   public function ServerFightCommandAlreadySentFlag()
   {
      super();
   }
}

