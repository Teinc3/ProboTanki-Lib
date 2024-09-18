package projects.tanks.clients.fp10.models.tankschatmodelflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.gui.LobbyChat;
   import alternativa.tanks.model.ChatModel;
   import alternativa.tanks.model.ChatSettingsTracker;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.utils.Antiflood;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.chat.models.chat.chat.IChatModelBase;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.contextmenu.IContextMenuService;
   
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
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            Antiflood.clientLog = IClientLog(param1);
         },function():IClientLog
         {
            return Antiflood.clientLog;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            ChatModel.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return ChatModel.trackerService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            ChatModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return ChatModel.display;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ChatModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ChatModel.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            ChatModel.userPropertyService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return ChatModel.userPropertyService;
         });
         osgi.injectService(IBattleLinkActivatorService,function(param1:Object):void
         {
            ChatModel.battleLinkActivatorService = IBattleLinkActivatorService(param1);
         },function():IBattleLinkActivatorService
         {
            return ChatModel.battleLinkActivatorService;
         });
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            ChatModel.clientLog = IClientLog(param1);
         },function():IClientLog
         {
            return ChatModel.clientLog;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            ChatSettingsTracker.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return ChatSettingsTracker.settingsService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            LobbyChat.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return LobbyChat.localeService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            LobbyChat.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return LobbyChat.storageService;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            LobbyChat.logService = LogService(param1);
         },function():LogService
         {
            return LobbyChat.logService;
         });
         osgi.injectService(IContextMenuService,function(param1:Object):void
         {
            LobbyChat.contextMenuService = IContextMenuService(param1);
         },function():IContextMenuService
         {
            return LobbyChat.contextMenuService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new ChatModel(),Vector.<Class>([IChatModelBase,ObjectLoadListener,ObjectUnloadListener]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

