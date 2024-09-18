package projects.tanks.clients.fp10.models.tanksbattleselectmodelflash
{
   import §!#%§.*;
   import §""v§.*;
   import §%@§.§`#`§;
   import §'#r§.*;
   import §-#e§.*;
   import §0"k§.§native package if§;
   import §8!<§.§#"z§;
   import §>6§.*;
   import §>Y§.§native true§;
   import §?#!§.§if catch break§;
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
   import alternativa.tanks.service.battle.§final package throw§;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battleinfo.§override set const§;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.service.battlelist.§while for do§;
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
   import §else set break§.*;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battleselect.model.battleselect.IBattleSelectModelBase;
   import projects.tanks.client.battleselect.model.battleselect.create.IBattleCreateModelBase;
   import projects.tanks.client.battleselect.model.info.§ !t§;
   import projects.tanks.client.battleselect.model.item.IBattleItemModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import §static set function§.*;
   import §static set get§.§default var class§;
   import §var for get§.§in var static§;
   
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
            §while for do§.display = IDisplay(param1);
         },function():IDisplay
         {
            return §while for do§.display;
         });
         osgi.injectService(IBattleCreateFormService,function(param1:Object):void
         {
            §while for do§.battleCreateFormService = IBattleCreateFormService(param1);
         },function():IBattleCreateFormService
         {
            return §while for do§.battleCreateFormService;
         });
         osgi.injectService(IBattleInfoFormService,function(param1:Object):void
         {
            §while for do§.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return §while for do§.battleInfoFormService;
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
            §final package throw§.friendsInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return §final package throw§.friendsInfoService;
         });
         osgi.injectService(IBattleUserInfoService,function(param1:Object):void
         {
            §final package throw§.battleUserInfoService = IBattleUserInfoService(param1);
         },function():IBattleUserInfoService
         {
            return §final package throw§.battleUserInfoService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            §override set const§.display = IDisplay(param1);
         },function():IDisplay
         {
            return §override set const§.display;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            §override set const§.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return §override set const§.trackerService;
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
            §do false§.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return §do false§.battleInfoFormService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            §do false§.battleAlertService = IAlertService(param1);
         },function():IAlertService
         {
            return §do false§.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            §do false§.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return §do false§.localeService;
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
            §4!A§.battleInfoFormService = IBattleInfoFormService(param1);
         },function():IBattleInfoFormService
         {
            return §4!A§.battleInfoFormService;
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
            CreateBattleFormController.§]"j§ = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return CreateBattleFormController.§]"j§;
         });
         osgi.injectService(BattleFormatUtil,function(param1:Object):void
         {
            BattleTeamInfoModel.§]"j§ = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return BattleTeamInfoModel.§]"j§;
         });
         osgi.injectService(BattleFormatUtil,function(param1:Object):void
         {
            BattleDmInfoModel.§]"j§ = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return BattleDmInfoModel.§]"j§;
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
            §while for do§.§]"j§ = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return §while for do§.§]"j§;
         });
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(§with var while§,§return var catch§);
         modelRegisterAdapt.registerEvents(§with var while§,§var for try§);
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new BattleTeamInfoModel(),Vector.<Class>([§#"z§,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegister.add(new §do false§(),Vector.<Class>([§ !t§,IObjectLoadListener,§with var while§]));
         modelRegister.add(new BattleDmInfoModel(),Vector.<Class>([§native true§,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(§in const if§,§var set switch§);
         modelRegisterAdapt.registerEvents(§in const if§,§false package class§);
         modelRegister.add(new §4!A§(),Vector.<Class>([§in var static§,§in const if§,IObjectLoadListener]));
         modelRegister.add(new §0"^§(),Vector.<Class>([§native package if§,§,"3§]));
         modelRegisterAdapt.registerAdapt(§,"3§,§;G§);
         modelRegisterAdapt.registerEvents(§,"3§,§do throw§);
         modelRegister.add(new §+!2§(),Vector.<Class>([§`#`§,§null for do§,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(§null for do§,§package§);
         modelRegisterAdapt.registerEvents(§null for do§,§`!f§);
         modelRegisterAdapt.registerAdapt(§<"U§,§with set in§);
         modelRegisterAdapt.registerEvents(§<"U§,§<"<§);
         modelRegister.add(new BattleTeamItemModel(),Vector.<Class>([§if catch break§,§<"U§,BattleItem,ObjectLoadListener]));
         modelRegister.add(new BattleItemModel(),Vector.<Class>([IBattleItemModelBase,IObjectLoadListener,IBattleItem]));
         modelRegisterAdapt.registerAdapt(§break package const§,§implements get§);
         modelRegisterAdapt.registerEvents(§break package const§,§=V§);
         modelRegister.add(new BattleDMItemModel(),Vector.<Class>([§default var class§,§break package const§,BattleItem,ObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IBattleItem,§`"m§);
         modelRegisterAdapt.registerEvents(IBattleItem,§import for var§);
         modelRegisterAdapt.registerAdapt(BattleItem,§ h§);
         modelRegisterAdapt.registerEvents(BattleItem,§in package final§);
         modelRegister.add(new BattleSelectModel(),Vector.<Class>([IBattleSelectModelBase,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegister.add(new BattleCreateModel(),Vector.<Class>([IBattleCreateModelBase,IObjectLoadListener]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

