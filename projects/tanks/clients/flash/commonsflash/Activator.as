package projects.tanks.clients.flash.commonsflash
{
   import Renamed252.Renamed4473;
   import Renamed270.Renamed4474;
   import Renamed270.Renamed4475;
   import Renamed298.Renamed4448;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.loader.Renamed2059;
   import Renamed324.Renamed4476;
   import Renamed330.Renamed4477;
   import Renamed341.Renamed4478;
   import Renamed350.Renamed4449;
   import Renamed404.Renamed1899;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.client.commons.models.coloring.IColoringModelBase;
   import projects.tanks.client.commons.models.layout.Renamed4254;
   import projects.tanks.clients.flash.commons.models.battlelinkactivator.BattleLinkActivatorModel;
   import projects.tanks.clients.flash.commons.models.coloring.ColoringModel;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   import projects.tanks.clients.flash.commons.models.coloring.IColoringAdapt;
   import projects.tanks.clients.flash.commons.models.coloring.IColoringEvents;
   import projects.tanks.clients.flash.commons.models.layout.ILobbyLayout;
   import projects.tanks.clients.flash.commons.models.layout.LobbyLayoutModel;
   import projects.tanks.clients.flash.commons.models.layout.notify.ILobbyLayoutNotify;
   import projects.tanks.clients.flash.commons.models.layout.notify.LobbyLayoutNotifyModel;
   import projects.tanks.clients.flash.commons.models.layout.notify.Renamed4451;
   import projects.tanks.clients.flash.commons.models.layout.notify.Renamed4452;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutService;
   import projects.tanks.clients.flash.commons.services.nameutils.SocialNetworkNameUtils;
   import projects.tanks.clients.flash.commons.services.notification.Notification;
   import projects.tanks.clients.flash.commons.services.notification.sound.INotificationSoundService;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   import projects.tanks.clients.flash.commons.services.timeunit.Renamed4454;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import Renamed417.Renamed4479;
   import Renamed443.Renamed4480;
   
   public class Activator implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegister:ModelRegistry;
         var modelRegisterAdapt:ModelRegistry;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(IBattleLinkActivatorService,function(param1:Object):void
         {
            BattleLinkActivatorModel.battleLinkActivatorService = IBattleLinkActivatorService(param1);
         },function():IBattleLinkActivatorService
         {
            return BattleLinkActivatorModel.battleLinkActivatorService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleLinkActivatorModel.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleLinkActivatorModel.lobbyLayoutService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleLinkActivatorModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleLinkActivatorModel.alertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleLinkActivatorModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleLinkActivatorModel.localeService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            BattleLinkActivatorModel.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return BattleLinkActivatorModel.storageService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            BattleLinkActivatorModel.userPropertyService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return BattleLinkActivatorModel.userPropertyService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            LobbyLayoutNotifyModel.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return LobbyLayoutNotifyModel.lobbyLayoutService;
         });
         osgi.injectService(ILoaderWindowService,function(param1:Object):void
         {
            LobbyLayoutNotifyModel.loaderWindowService = ILoaderWindowService(param1);
         },function():ILoaderWindowService
         {
            return LobbyLayoutNotifyModel.loaderWindowService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            LobbyLayoutService.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return LobbyLayoutService.alertService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            LobbyLayoutService.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return LobbyLayoutService.storageService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            LobbyLayoutService.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return LobbyLayoutService.localeService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            LobbyLayoutService.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return LobbyLayoutService.battleInfoService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            LobbyLayoutService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return LobbyLayoutService.dialogWindowsDispatcherService;
         });
         osgi.injectService(IPartnerService,function(param1:Object):void
         {
            LobbyLayoutService.partnersService = IPartnerService(param1);
         },function():IPartnerService
         {
            return LobbyLayoutService.partnersService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            LobbyLayoutService.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return LobbyLayoutService.userInfoService;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            LobbyLayoutService.modelRegistry = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return LobbyLayoutService.modelRegistry;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            Renamed4473.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return Renamed4473.alertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4473.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4473.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4454.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4454.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed1899.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed1899.localeService;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            Renamed1899.logService = LogService(param1);
         },function():LogService
         {
            return Renamed1899.logService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Notification.display = IDisplay(param1);
         },function():IDisplay
         {
            return Notification.display;
         });
         osgi.injectService(INotificationSoundService,function(param1:Object):void
         {
            Notification.Renamed2086 = INotificationSoundService(param1);
         },function():INotificationSoundService
         {
            return Notification.Renamed2086;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            SocialNetworkNameUtils.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return SocialNetworkNameUtils.localeService;
         });
         osgi.injectService(IServerHaltService,function(param1:Object):void
         {
            Renamed4480.Renamed4481 = IServerHaltService(param1);
         },function():IServerHaltService
         {
            return Renamed4480.Renamed4481;
         });
         osgi.injectService(ILoaderWindowService,function(param1:Object):void
         {
            Renamed4475.loader = ILoaderWindowService(param1);
         },function():ILoaderWindowService
         {
            return Renamed4475.loader;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(IColoring,IColoringAdapt);
         modelRegisterAdapt.registerEvents(IColoring,IColoringEvents);
         modelRegister.add(new ColoringModel(),Vector.<Class>([IColoringModelBase,IColoring]));
         modelRegister.add(new Renamed4473(),Vector.<Class>([Renamed4479]));
         modelRegister.add(new LobbyLayoutNotifyModel(),Vector.<Class>([Renamed4449,ILobbyLayoutNotify]));
         modelRegisterAdapt.registerAdapt(ILobbyLayoutNotify,Renamed4451);
         modelRegisterAdapt.registerEvents(ILobbyLayoutNotify,Renamed4452);
         modelRegister.add(new BattleLinkActivatorModel(),Vector.<Class>([Renamed4448,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new LobbyLayoutModel(),Vector.<Class>([Renamed4254,ILobbyLayout,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new Renamed4480(),Vector.<Class>([Renamed4477]));
         modelRegister.add(new Renamed4475(),Vector.<Class>([Renamed4478,ObjectLoadListener]));
         modelRegister.add(new Renamed4474(),Vector.<Class>([Renamed4476,ObjectLoadListener,ObjectUnloadListener,Renamed2059]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

