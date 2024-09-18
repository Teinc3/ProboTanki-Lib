package projects.tanks.clients.fp10.models.tanksbattleselectmodelflash
{
   import Renamed144.*;
   import Renamed1580.*;
   import Renamed188.Renamed4738;
   import Renamed195.*;
   import Renamed216.*;
   import Renamed4739.Renamed4740;
   import Renamed4741.Renamed4742;
   import Renamed1583.*;
   import Renamed4743.Renamed4744;
   import Renamed4745.Renamed4746;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.controllers.battlecreate.CreateBattleFormController;
   import alternativa.tanks.controllers.battleinfo.BattleInfoDMController;
   import alternativa.tanks.controllers.battleinfo.BattleInfoTeamController;
   import alternativa.tanks.controllers.battlelist.BattleListController;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.model.battleselect.*;
   import alternativa.tanks.model.battleselect.create.*;
   import alternativa.tanks.model.info.*;
   import alternativa.tanks.model.item.*;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.battle.BattleUserInfoService;
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battle.Renamed2077;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battleinfo.Renamed543;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.service.battlelist.Renamed544;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battlecreate.CreateBattleFormView;
   import alternativa.tanks.view.battlecreate.LocaleCreateBattleForm;
   import alternativa.tanks.view.battleinfo.BattleInfoParamsView;
   import alternativa.tanks.view.battleinfo.LocaleBattleInfo;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDMView;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamView;
   import alternativa.tanks.view.battlelist.BattleListView;
   import alternativa.tanks.view.battlelist.LocaleBattleList;
   import alternativa.tanks.view.battlelist.forms.BattleBigButton;
   import Renamed353.*;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battleselect.model.battleselect.IBattleSelectModelBase;
   import projects.tanks.client.battleselect.model.battleselect.create.IBattleCreateModelBase;
   import projects.tanks.client.battleselect.model.info.Renamed2116;
   import projects.tanks.client.battleselect.model.item.IBattleItemModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import Renamed423.*;
   import Renamed424.Renamed4747;
   import Renamed453.Renamed4748;
   
   public class Activator implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegisterAdapt:ModelRegistry;
         var modelRegister:ModelRegistry;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            LocaleBattleList.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return LocaleBattleList.localeService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            BattleBigButton.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return BattleBigButton.moneyService;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            BattleListView.helpService = IHelpService(param1);
         },function():IHelpService
         {
            return BattleListView.helpService;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            CreateBattleFormView.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return CreateBattleFormView.trackerService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            LocaleCreateBattleForm.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return LocaleCreateBattleForm.localeService;
         });
         osgi.injectService(IAchievementService,function(param1:Object):void
         {
            BattleInfoTeamView.achievementService = IAchievementService(param1);
         },function():IAchievementService
         {
            return BattleInfoTeamView.achievementService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            BattleInfoTeamView.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return BattleInfoTeamView.battleInfoService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleInfoTeamView.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleInfoTeamView.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleInfoParamsView.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleInfoParamsView.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            LocaleBattleInfo.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return LocaleBattleInfo.localeService;
         });
         osgi.injectService(IAchievementService,function(param1:Object):void
         {
            BattleInfoDMView.achievementService = IAchievementService(param1);
         },function():IAchievementService
         {
            return BattleInfoDMView.achievementService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            BattleInfoDMView.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return BattleInfoDMView.battleInfoService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleInfoDMView.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleInfoDMView.lobbyLayoutService;
         });
         osgi.injectService(IBattleInfoFormService,function(param1:Object):void
         {
            BattleListController.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return BattleListController.battleInfoFormService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            BattleListController.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return BattleListController.userPropertiesService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            BattleListController.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return BattleListController.storageService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            BattleListController.display = IDisplay(param1);
         },function():IDisplay
         {
            return BattleListController.display;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            BattleListController.logService = LogService(param1);
         },function():LogService
         {
            return BattleListController.logService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            BattleListController.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return BattleListController.battleInfoService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleListController.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleListController.lobbyLayoutService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            CreateBattleFormController.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return CreateBattleFormController.storageService;
         });
         osgi.injectService(IAchievementService,function(param1:Object):void
         {
            CreateBattleFormController.achievementService = IAchievementService(param1);
         },function():IAchievementService
         {
            return CreateBattleFormController.achievementService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            CreateBattleFormController.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return CreateBattleFormController.userPropertiesService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            BattleInfoDMController.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return BattleInfoDMController.moneyService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleInfoDMController.battleAlertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleInfoDMController.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleInfoDMController.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleInfoDMController.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            BattleInfoDMController.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return BattleInfoDMController.userPropertiesService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleInfoDMController.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleInfoDMController.lobbyLayoutService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            BattleInfoTeamController.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return BattleInfoTeamController.moneyService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleInfoTeamController.battleAlertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleInfoTeamController.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleInfoTeamController.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleInfoTeamController.localeService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleInfoTeamController.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleInfoTeamController.lobbyLayoutService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            BattleInfoTeamController.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return BattleInfoTeamController.userPropertiesService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed544.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed544.display;
         });
         osgi.injectService(IBattleCreateFormService,function(param1:Object):void
         {
            Renamed544.battleCreateFormService = IBattleCreateFormService(param1);
         },function():IBattleCreateFormService
         {
            return Renamed544.battleCreateFormService;
         });
         osgi.injectService(IBattleInfoFormService,function(param1:Object):void
         {
            Renamed544.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return Renamed544.battleInfoFormService;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            BattleUserInfoService.logService = LogService(param1);
         },function():LogService
         {
            return BattleUserInfoService.logService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            Renamed2077.friendsInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return Renamed2077.friendsInfoService;
         });
         osgi.injectService(IBattleUserInfoService,function(param1:Object):void
         {
            Renamed2077.battleUserInfoService = IBattleUserInfoService(param1);
         },function():IBattleUserInfoService
         {
            return Renamed2077.battleUserInfoService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed543.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed543.display;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            Renamed543.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return Renamed543.trackerService;
         });
         osgi.injectService(IBattleInfoFormService,function(param1:Object):void
         {
            BattleTeamInfoModel.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return BattleTeamInfoModel.battleInfoFormService;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            BattleTeamInfoModel.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return BattleTeamInfoModel.trackerService;
         });
         osgi.injectService(IBattleInfoFormService,function(param1:Object):void
         {
            Renamed2119.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return Renamed2119.battleInfoFormService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            Renamed2119.battleAlertService = IAlertService(param1);
         },function():IAlertService
         {
            return Renamed2119.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2119.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2119.localeService;
         });
         osgi.injectService(IBattleInfoFormService,function(param1:Object):void
         {
            BattleDmInfoModel.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return BattleDmInfoModel.battleInfoFormService;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            BattleDmInfoModel.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return BattleDmInfoModel.trackerService;
         });
         osgi.injectService(IBattleInfoFormService,function(param1:Object):void
         {
            Renamed4749.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return Renamed4749.battleInfoFormService;
         });
         osgi.injectService(IBattleListFormService,function(param1:Object):void
         {
            BattleTeamItemModel.battleListFormService = IBattleListFormService(param1);
         },function():IBattleListFormService
         {
            return BattleTeamItemModel.battleListFormService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            BattleTeamItemModel.friendsInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return BattleTeamItemModel.friendsInfoService;
         });
         osgi.injectService(IBattleUserInfoService,function(param1:Object):void
         {
            BattleTeamItemModel.battleUserInfoService = IBattleUserInfoService(param1);
         },function():IBattleUserInfoService
         {
            return BattleTeamItemModel.battleUserInfoService;
         });
         osgi.injectService(IBattleListFormService,function(param1:Object):void
         {
            BattleItemModel.battleListFormService = IBattleListFormService(param1);
         },function():IBattleListFormService
         {
            return BattleItemModel.battleListFormService;
         });
         osgi.injectService(IBattleUserInfoService,function(param1:Object):void
         {
            BattleItemModel.battleUserInfoService = IBattleUserInfoService(param1);
         },function():IBattleUserInfoService
         {
            return BattleItemModel.battleUserInfoService;
         });
         osgi.injectService(IBattleListFormService,function(param1:Object):void
         {
            BattleDMItemModel.battleListFormService = IBattleListFormService(param1);
         },function():IBattleListFormService
         {
            return BattleDMItemModel.battleListFormService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            BattleDMItemModel.friendsInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return BattleDMItemModel.friendsInfoService;
         });
         osgi.injectService(IBattleUserInfoService,function(param1:Object):void
         {
            BattleDMItemModel.battleUserInfoService = IBattleUserInfoService(param1);
         },function():IBattleUserInfoService
         {
            return BattleDMItemModel.battleUserInfoService;
         });
         osgi.injectService(IBattleListFormService,function(param1:Object):void
         {
            BattleSelectModel.battleListFormService = IBattleListFormService(param1);
         },function():IBattleListFormService
         {
            return BattleSelectModel.battleListFormService;
         });
         osgi.injectService(IBattleInfoFormService,function(param1:Object):void
         {
            BattleSelectModel.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return BattleSelectModel.battleInfoFormService;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            BattleSelectModel.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return BattleSelectModel.trackerService;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            BattleSelectModel.logService = LogService(param1);
         },function():LogService
         {
            return BattleSelectModel.logService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            BattleCreateModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return BattleCreateModel.display;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            BattleCreateModel.modelRegistry = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return BattleCreateModel.modelRegistry;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            BattleCreateModel.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return BattleCreateModel.trackerService;
         });
         osgi.injectService(IBattleCreateFormService,function(param1:Object):void
         {
            BattleCreateModel.battleCreateFormService = IBattleCreateFormService(param1);
         },function():IBattleCreateFormService
         {
            return BattleCreateModel.battleCreateFormService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            BattleCreateModel.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return BattleCreateModel.userPropertiesService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleCreateModel.battleAlertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleCreateModel.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleCreateModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleCreateModel.localeService;
         });
         osgi.injectService(BattleFormatUtil,function(param1:Object):void
         {
            CreateBattleFormController.Renamed1588 = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return CreateBattleFormController.Renamed1588;
         });
         osgi.injectService(BattleFormatUtil,function(param1:Object):void
         {
            BattleTeamInfoModel.Renamed1588 = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return BattleTeamInfoModel.Renamed1588;
         });
         osgi.injectService(BattleFormatUtil,function(param1:Object):void
         {
            BattleDmInfoModel.Renamed1588 = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return BattleDmInfoModel.Renamed1588;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleTeamInfoModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleTeamInfoModel.alertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleTeamInfoModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleTeamInfoModel.localeService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleDmInfoModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleDmInfoModel.alertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleDmInfoModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleDmInfoModel.localeService;
         });
         osgi.injectService(BattleFormatUtil,function(param1:Object):void
         {
            Renamed544.Renamed1588 = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return Renamed544.Renamed1588;
         });
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(Renamed2120,Renamed2124);
         modelRegisterAdapt.registerEvents(Renamed2120,Renamed2125);
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new BattleTeamInfoModel(),Vector.<Class>([Renamed4742,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegister.add(new Renamed2119(),Vector.<Class>([Renamed2116,IObjectLoadListener,Renamed2120]));
         modelRegister.add(new BattleDmInfoModel(),Vector.<Class>([Renamed4744,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(Renamed4750,Renamed4751);
         modelRegisterAdapt.registerEvents(Renamed4750,Renamed4752);
         modelRegister.add(new Renamed4749(),Vector.<Class>([Renamed4748,Renamed4750,IObjectLoadListener]));
         modelRegister.add(new Renamed4753(),Vector.<Class>([Renamed4740,Renamed1581]));
         modelRegisterAdapt.registerAdapt(Renamed1581,Renamed4754);
         modelRegisterAdapt.registerEvents(Renamed1581,Renamed4755);
         modelRegister.add(new Renamed4756(),Vector.<Class>([Renamed4738,Renamed1584,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(Renamed1584,Renamed4757);
         modelRegisterAdapt.registerEvents(Renamed1584,Renamed4758);
         modelRegisterAdapt.registerAdapt(Renamed3638,Renamed4759);
         modelRegisterAdapt.registerEvents(Renamed3638,Renamed4760);
         modelRegister.add(new BattleTeamItemModel(),Vector.<Class>([Renamed4746,Renamed3638,BattleItem,ObjectLoadListener]));
         modelRegister.add(new BattleItemModel(),Vector.<Class>([IBattleItemModelBase,IObjectLoadListener,IBattleItem]));
         modelRegisterAdapt.registerAdapt(Renamed3639,Renamed4761);
         modelRegisterAdapt.registerEvents(Renamed3639,Renamed4762);
         modelRegister.add(new BattleDMItemModel(),Vector.<Class>([Renamed4747,Renamed3639,BattleItem,ObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IBattleItem,Renamed2134);
         modelRegisterAdapt.registerEvents(IBattleItem,Renamed2132);
         modelRegisterAdapt.registerAdapt(BattleItem,Renamed2131);
         modelRegisterAdapt.registerEvents(BattleItem,Renamed2133);
         modelRegister.add(new BattleSelectModel(),Vector.<Class>([IBattleSelectModelBase,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegister.add(new BattleCreateModel(),Vector.<Class>([IBattleCreateModelBase,IObjectLoadListener]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

