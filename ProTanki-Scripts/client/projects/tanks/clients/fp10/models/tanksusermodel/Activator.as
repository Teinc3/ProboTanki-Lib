package projects.tanks.clients.fp10.models.tanksusermodel
{
   import Renamed4829.Renamed4830;
   import Renamed272.Renamed3542;
   import Renamed501.Renamed545;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.model.useremailandpassword.UserEmailAndPasswordModel;
   import alternativa.tanks.servermodels.EntranceModel;
   import alternativa.tanks.servermodels.blockvalidator.BlockValidatorModel;
   import alternativa.tanks.servermodels.captcha.Renamed3549;
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.servermodels.captcha.ServerCaptchaModel;
   import alternativa.tanks.servermodels.captcha.Renamed3550;
   import alternativa.tanks.servermodels.login.ILogin;
   import alternativa.tanks.servermodels.login.LoginModel;
   import alternativa.tanks.servermodels.loginbyhash.Renamed3555;
   import alternativa.tanks.servermodels.loginbyhash.ILoginByHash;
   import alternativa.tanks.servermodels.loginbyhash.LoginByHashModel;
   import alternativa.tanks.servermodels.loginbyhash.Renamed3556;
   import alternativa.tanks.servermodels.registartion.password.IPasswordRegistration;
   import alternativa.tanks.servermodels.registartion.password.PasswordRegistrationModel;
   import alternativa.tanks.servermodels.socialnetwork.Renamed3571;
   import alternativa.tanks.servermodels.socialnetwork.ExternalEntranceModel;
   import alternativa.tanks.servermodels.socialnetwork.IExternalEntranceModel;
   import alternativa.tanks.servermodels.socialnetwork.Renamed3573;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.IExternalEntranceService;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.bubbles.EntranceBubbleFactory;
   import alternativa.tanks.view.forms.Renamed558;
   import alternativa.tanks.view.forms.ExternalRegistrationForm;
   import alternativa.tanks.view.forms.LinkExternalLoginForm;
   import alternativa.tanks.view.forms.LoginForm;
   import alternativa.tanks.view.forms.PasswordRestoreForm;
   import alternativa.tanks.view.forms.RegistrationForm;
   import alternativa.tanks.view.forms.commons.RegistrationCommonElementsSection;
   import alternativa.tanks.view.layers.EntranceView;
   import alternativa.tanks.view.registration.ExternalEntranceForm;
   import Renamed319.Renamed4831;
   import Renamed319.Renamed4832;
   import Renamed319.Renamed4833;
   import Renamed319.Renamed4834;
   import Renamed334.Renamed3552;
   import Renamed346.Renamed4835;
   import Renamed362.Renamed4836;
   import Renamed362.Renamed4837;
   import Renamed362.Renamed4838;
   import Renamed362.Renamed4839;
   import Renamed398.Renamed4840;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.entrance.model.entrance.captcha.Renamed3545;
   import projects.tanks.client.entrance.model.entrance.entrance.IEntranceModelBase;
   import projects.tanks.client.entrance.model.entrance.externalentrance.Renamed3562;
   import projects.tanks.client.entrance.model.entrance.registration.IRegistrationModelBase;
   import projects.tanks.clients.flash.commons.services.timeunit.ITimeUnitService;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import Renamed435.Renamed4841;
   import utils.preview.IImageResource;
   import Renamed455.Renamed3553;
   
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
            EntranceView.Renamed2271 = ITimeUnitService(param1);
         },function():ITimeUnitService
         {
            return EntranceView.Renamed2271;
         });
         osgi.injectService(IExternalEntranceService,function(param1:Object):void
         {
            ExternalEntranceModel.Renamed3564 = IExternalEntranceService(param1);
         },function():IExternalEntranceService
         {
            return ExternalEntranceModel.Renamed3564;
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
            Renamed4841.facade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return Renamed4841.facade;
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
            UserEmailAndPasswordModel.Renamed2284 = ISettingsService(param1);
         },function():ISettingsService
         {
            return UserEmailAndPasswordModel.Renamed2284;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            Renamed4833.clientFacade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return Renamed4833.clientFacade;
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
            ExternalEntranceForm.Renamed3564 = IExternalEntranceService(param1);
         },function():IExternalEntranceService
         {
            return ExternalEntranceForm.Renamed3564;
         });
         osgi.injectService(IExternalEntranceService,function(param1:Object):void
         {
            LoginForm.Renamed3564 = IExternalEntranceService(param1);
         },function():IExternalEntranceService
         {
            return LoginForm.Renamed3564;
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
            RegistrationForm.Renamed3564 = IExternalEntranceService(param1);
         },function():IExternalEntranceService
         {
            return RegistrationForm.Renamed3564;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            Renamed4838.entranceClientFacade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return Renamed4838.entranceClientFacade;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4838.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4838.display;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4838.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4838.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed558.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed558.localeService;
         });
         osgi.injectService(IPasswordParamsService,function(param1:Object):void
         {
            Renamed558.passwordParamsService = IPasswordParamsService(param1);
         },function():IPasswordParamsService
         {
            return Renamed558.passwordParamsService;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            Renamed558.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return Renamed558.validateService;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            Renamed545.modelRegistry = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return Renamed545.modelRegistry;
         });
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new LoginModel(),Vector.<Class>([ILogin,Renamed3552]));
         modelRegister.add(new Renamed4841(),Vector.<Class>([Renamed4840,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(Renamed4834,Renamed4832);
         modelRegisterAdapt.registerEvents(Renamed4834,Renamed4831);
         modelRegister.add(new Renamed4833(),Vector.<Class>([Renamed4835,Renamed4834,IObjectLoadListener]));
         modelRegister.add(new LoginByHashModel(),Vector.<Class>([ILoginByHash,Renamed3553]));
         modelRegisterAdapt.registerAdapt(ILoginByHash,Renamed3556);
         modelRegisterAdapt.registerEvents(ILoginByHash,Renamed3555);
         modelRegister.add(new BlockValidatorModel(),Vector.<Class>([Renamed3542]));
         modelRegister.add(new PasswordRegistrationModel(),Vector.<Class>([IRegistrationModelBase,IPasswordRegistration,ObjectLoadListener,IImageResource]));
         modelRegisterAdapt.registerAdapt(IExternalEntranceModel,Renamed3571);
         modelRegisterAdapt.registerEvents(IExternalEntranceModel,Renamed3573);
         modelRegister.add(new ExternalEntranceModel(),Vector.<Class>([Renamed3562,ObjectLoadListener,IExternalEntranceModel]));
         modelRegister.add(new ServerCaptchaModel(),Vector.<Class>([Renamed3545,IServerCaptcha,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IServerCaptcha,Renamed3550);
         modelRegisterAdapt.registerEvents(IServerCaptcha,Renamed3549);
         modelRegister.add(new EntranceModel(),Vector.<Class>([IEntranceModelBase,ObjectLoadListener,ObjectLoadPostListener,ObjectUnloadPostListener]));
         modelRegisterAdapt.registerAdapt(Renamed4836,Renamed4839);
         modelRegisterAdapt.registerEvents(Renamed4836,Renamed4837);
         modelRegister.add(new Renamed4838(),Vector.<Class>([Renamed4836,Renamed4830]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

