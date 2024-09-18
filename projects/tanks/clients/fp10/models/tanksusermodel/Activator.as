package projects.tanks.clients.fp10.models.tanksusermodel
{
   import §-!?§.§for for true§;
   import §8!2§.§`!@§;
   import §`C§.§##z§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.model.useremailandpassword.UserEmailAndPasswordModel;
   import alternativa.tanks.servermodels.EntranceModel;
   import alternativa.tanks.servermodels.blockvalidator.BlockValidatorModel;
   import alternativa.tanks.servermodels.captcha.§9J§;
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.servermodels.captcha.ServerCaptchaModel;
   import alternativa.tanks.servermodels.captcha.§native implements§;
   import alternativa.tanks.servermodels.login.ILogin;
   import alternativa.tanks.servermodels.login.LoginModel;
   import alternativa.tanks.servermodels.loginbyhash.§;z§;
   import alternativa.tanks.servermodels.loginbyhash.ILoginByHash;
   import alternativa.tanks.servermodels.loginbyhash.LoginByHashModel;
   import alternativa.tanks.servermodels.loginbyhash.§for set use§;
   import alternativa.tanks.servermodels.registartion.password.IPasswordRegistration;
   import alternativa.tanks.servermodels.registartion.password.PasswordRegistrationModel;
   import alternativa.tanks.servermodels.socialnetwork.§2"'§;
   import alternativa.tanks.servermodels.socialnetwork.ExternalEntranceModel;
   import alternativa.tanks.servermodels.socialnetwork.IExternalEntranceModel;
   import alternativa.tanks.servermodels.socialnetwork.§`"c§;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.IExternalEntranceService;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.bubbles.EntranceBubbleFactory;
   import alternativa.tanks.view.forms.§!"z§;
   import alternativa.tanks.view.forms.ExternalRegistrationForm;
   import alternativa.tanks.view.forms.LinkExternalLoginForm;
   import alternativa.tanks.view.forms.LoginForm;
   import alternativa.tanks.view.forms.PasswordRestoreForm;
   import alternativa.tanks.view.forms.RegistrationForm;
   import alternativa.tanks.view.forms.commons.RegistrationCommonElementsSection;
   import alternativa.tanks.view.layers.EntranceView;
   import alternativa.tanks.view.registration.ExternalEntranceForm;
   import §case var include§.§^k§;
   import §case var include§.§default var dynamic§;
   import §case var include§.§for set do§;
   import §case var include§.§switch set false§;
   import §const catch import§.§var if§;
   import §dynamic use§.§>#M§;
   import §final set continue§.§=n§;
   import §final set continue§.§]"y§;
   import §final set continue§.§dynamic const continue§;
   import §final set continue§.§null catch null§;
   import §in var var§.§<!V§;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.entrance.model.entrance.captcha.§'"p§;
   import projects.tanks.client.entrance.model.entrance.entrance.IEntranceModelBase;
   import projects.tanks.client.entrance.model.entrance.externalentrance.§native catch while§;
   import projects.tanks.client.entrance.model.entrance.registration.IRegistrationModelBase;
   import projects.tanks.clients.flash.commons.services.timeunit.ITimeUnitService;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import §throw const package§.§"!M§;
   import utils.preview.IImageResource;
   import §var set dynamic§.§ "e§;
   
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
         osgi.injectService(IEntranceServerFacade,function(param1:Object):void
         {
            EntranceModel.serverFacade = IEntranceServerFacade(param1);
         },function():IEntranceServerFacade
         {
            return EntranceModel.serverFacade;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            EntranceModel.clientFacade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return EntranceModel.clientFacade;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            EntranceModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return EntranceModel.display;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            BlockValidatorModel.clientFacade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return BlockValidatorModel.clientFacade;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            BlockValidatorModel.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return BlockValidatorModel.storageService;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            BlockValidatorModel.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return BlockValidatorModel.trackerService;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            PasswordRegistrationModel.facade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return PasswordRegistrationModel.facade;
         });
         osgi.injectService(IPasswordParamsService,function(param1:Object):void
         {
            PasswordRegistrationModel.passwordParamsService = IPasswordParamsService(param1);
         },function():IPasswordParamsService
         {
            return PasswordRegistrationModel.passwordParamsService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            PasswordRegistrationModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return PasswordRegistrationModel.alertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            PasswordRegistrationModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return PasswordRegistrationModel.localeService;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            PasswordRegistrationModel.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return PasswordRegistrationModel.trackerService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            EntranceBubbleFactory.LocaleService = ILocaleService(param1);
         },function():ILocaleService
         {
            return EntranceBubbleFactory.LocaleService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            EntranceView.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return EntranceView.localeService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            EntranceView.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return EntranceView.alertService;
         });
         osgi.injectService(ITimeUnitService,function(param1:Object):void
         {
            EntranceView.§&J§ = ITimeUnitService(param1);
         },function():ITimeUnitService
         {
            return EntranceView.§&J§;
         });
         osgi.injectService(IExternalEntranceService,function(param1:Object):void
         {
            ExternalEntranceModel.§7#L§ = IExternalEntranceService(param1);
         },function():IExternalEntranceService
         {
            return ExternalEntranceModel.§7#L§;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            ExternalEntranceModel.clientFacade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return ExternalEntranceModel.clientFacade;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ExternalEntranceModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ExternalEntranceModel.localeService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            ExternalEntranceModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return ExternalEntranceModel.alertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ExternalRegistrationForm.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ExternalRegistrationForm.localeService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            ExternalRegistrationForm.display = IDisplay(param1);
         },function():IDisplay
         {
            return ExternalRegistrationForm.display;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            ExternalRegistrationForm.helperService = IHelpService(param1);
         },function():IHelpService
         {
            return ExternalRegistrationForm.helperService;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            ExternalRegistrationForm.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return ExternalRegistrationForm.validateService;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            §"!M§.facade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return §"!M§.facade;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            UserEmailAndPasswordModel.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return UserEmailAndPasswordModel.panelView;
         });
         osgi.injectService(ISocialNetworkPanelService,function(param1:Object):void
         {
            UserEmailAndPasswordModel.socialNetworkPanelService = ISocialNetworkPanelService(param1);
         },function():ISocialNetworkPanelService
         {
            return UserEmailAndPasswordModel.socialNetworkPanelService;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            UserEmailAndPasswordModel.§null import§ = ISettingsService(param1);
         },function():ISettingsService
         {
            return UserEmailAndPasswordModel.§null import§;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            §for set do§.clientFacade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return §for set do§.clientFacade;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            LinkExternalLoginForm.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return LinkExternalLoginForm.localeService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            LinkExternalLoginForm.display = IDisplay(param1);
         },function():IDisplay
         {
            return LinkExternalLoginForm.display;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            LinkExternalLoginForm.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return LinkExternalLoginForm.validateService;
         });
         osgi.injectService(IExternalEntranceService,function(param1:Object):void
         {
            ExternalEntranceForm.§7#L§ = IExternalEntranceService(param1);
         },function():IExternalEntranceService
         {
            return ExternalEntranceForm.§7#L§;
         });
         osgi.injectService(IExternalEntranceService,function(param1:Object):void
         {
            LoginForm.§7#L§ = IExternalEntranceService(param1);
         },function():IExternalEntranceService
         {
            return LoginForm.§7#L§;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            LoginForm.display = IDisplay(param1);
         },function():IDisplay
         {
            return LoginForm.display;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            LoginForm.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return LoginForm.validateService;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            LoginModel.entranceClientFacade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return LoginModel.entranceClientFacade;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            PasswordRestoreForm.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return PasswordRestoreForm.validateService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            RegistrationCommonElementsSection.display = IDisplay(param1);
         },function():IDisplay
         {
            return RegistrationCommonElementsSection.display;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            RegistrationCommonElementsSection.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return RegistrationCommonElementsSection.localeService;
         });
         osgi.injectService(IPasswordParamsService,function(param1:Object):void
         {
            RegistrationCommonElementsSection.passwordParamsService = IPasswordParamsService(param1);
         },function():IPasswordParamsService
         {
            return RegistrationCommonElementsSection.passwordParamsService;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            RegistrationCommonElementsSection.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return RegistrationCommonElementsSection.validateService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            RegistrationForm.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return RegistrationForm.localeService;
         });
         osgi.injectService(IExternalEntranceService,function(param1:Object):void
         {
            RegistrationForm.§7#L§ = IExternalEntranceService(param1);
         },function():IExternalEntranceService
         {
            return RegistrationForm.§7#L§;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            §dynamic const continue§.entranceClientFacade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return §dynamic const continue§.entranceClientFacade;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            §dynamic const continue§.display = IDisplay(param1);
         },function():IDisplay
         {
            return §dynamic const continue§.display;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            §dynamic const continue§.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return §dynamic const continue§.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            §!"z§.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return §!"z§.localeService;
         });
         osgi.injectService(IPasswordParamsService,function(param1:Object):void
         {
            §!"z§.passwordParamsService = IPasswordParamsService(param1);
         },function():IPasswordParamsService
         {
            return §!"z§.passwordParamsService;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            §!"z§.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return §!"z§.validateService;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            §##z§.modelRegistry = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return §##z§.modelRegistry;
         });
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new LoginModel(),Vector.<Class>([ILogin,§var if§]));
         modelRegister.add(new §"!M§(),Vector.<Class>([§<!V§,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(§switch set false§,§default var dynamic§);
         modelRegisterAdapt.registerEvents(§switch set false§,§^k§);
         modelRegister.add(new §for set do§(),Vector.<Class>([§>#M§,§switch set false§,IObjectLoadListener]));
         modelRegister.add(new LoginByHashModel(),Vector.<Class>([ILoginByHash,§ "e§]));
         modelRegisterAdapt.registerAdapt(ILoginByHash,§for set use§);
         modelRegisterAdapt.registerEvents(ILoginByHash,§;z§);
         modelRegister.add(new BlockValidatorModel(),Vector.<Class>([§`!@§]));
         modelRegister.add(new PasswordRegistrationModel(),Vector.<Class>([IRegistrationModelBase,IPasswordRegistration,ObjectLoadListener,IImageResource]));
         modelRegisterAdapt.registerAdapt(IExternalEntranceModel,§2"'§);
         modelRegisterAdapt.registerEvents(IExternalEntranceModel,§`"c§);
         modelRegister.add(new ExternalEntranceModel(),Vector.<Class>([§native catch while§,ObjectLoadListener,IExternalEntranceModel]));
         modelRegister.add(new ServerCaptchaModel(),Vector.<Class>([§'"p§,IServerCaptcha,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IServerCaptcha,§native implements§);
         modelRegisterAdapt.registerEvents(IServerCaptcha,§9J§);
         modelRegister.add(new EntranceModel(),Vector.<Class>([IEntranceModelBase,ObjectLoadListener,ObjectLoadPostListener,ObjectUnloadPostListener]));
         modelRegisterAdapt.registerAdapt(§=n§,§null catch null§);
         modelRegisterAdapt.registerEvents(§=n§,§]"y§);
         modelRegister.add(new §dynamic const continue§(),Vector.<Class>([§=n§,§for for true§]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

