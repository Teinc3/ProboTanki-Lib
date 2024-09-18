package alternativa.init
{
   import §`C§.§##z§;
   import §`C§.§finally with§;
   import §`C§.§implements catch get§;
   import §`C§.§throw package final§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controller.commands.§4!_§;
   import alternativa.tanks.controller.commands.§8"c§;
   import alternativa.tanks.controller.commands.CheckCallsignCommand;
   import alternativa.tanks.controller.commands.ChooseInitialStateCommand;
   import alternativa.tanks.controller.commands.GetNewCaptchaCommand;
   import alternativa.tanks.controller.commands.LoginCommand;
   import alternativa.tanks.controller.commands.ParseUrlParamsCommand;
   import alternativa.tanks.controller.commands.RegisterUserCommand;
   import alternativa.tanks.controller.commands.SendRestoreEmailMessageCommand;
   import alternativa.tanks.controller.commands.captcha.CheckLoginFormCaptchaCommand;
   import alternativa.tanks.controller.commands.captcha.CheckRegistrationCaptchaCommand;
   import alternativa.tanks.controller.commands.captcha.§catch const use§;
   import alternativa.tanks.controller.commands.goto.GoToExternalLoginCommand;
   import alternativa.tanks.controller.commands.goto.GoToExternalRegistrationCommand;
   import alternativa.tanks.controller.commands.goto.GoToLoginCommand;
   import alternativa.tanks.controller.commands.goto.GoToRegistrationCommand;
   import alternativa.tanks.controller.commands.goto.GoToRestorePasswordCommand;
   import alternativa.tanks.controller.commands.goto.GoToStandaloneCaptcha;
   import alternativa.tanks.controller.commands.goto.§set set for§;
   import alternativa.tanks.controller.commands.socialnetwork.CheckExternalLoginFormCaptchaCommand;
   import alternativa.tanks.controller.commands.socialnetwork.ExternalLoginCommand;
   import alternativa.tanks.controller.commands.socialnetwork.FinishExternalRegisterUserCommand;
   import alternativa.tanks.controller.commands.socialnetwork.StartExternalLoginUserCommand;
   import alternativa.tanks.controller.commands.socialnetwork.StartExternalRegisterUserCommand;
   import alternativa.tanks.controller.events.§<#l§;
   import alternativa.tanks.controller.events.CheckCallsignEvent;
   import alternativa.tanks.controller.events.CheckCaptchaAnswerEvent;
   import alternativa.tanks.controller.events.ChooseInitialStateEvent;
   import alternativa.tanks.controller.events.GetNewCaptchaEvent;
   import alternativa.tanks.controller.events.LoginEvent;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.ParseUrlParamsEvent;
   import alternativa.tanks.controller.events.RegisterEvent;
   import alternativa.tanks.controller.events.SendNewPasswordAndEmailToChangeEvent;
   import alternativa.tanks.controller.events.socialnetwork.ExternalLoginEvent;
   import alternativa.tanks.controller.events.socialnetwork.FinishExternalRegisterEvent;
   import alternativa.tanks.controller.events.socialnetwork.NavigationExternalEvent;
   import alternativa.tanks.controller.events.socialnetwork.StartExternalEntranceEvent;
   import alternativa.tanks.model.EntranceServerParamsModel;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import alternativa.tanks.model.RegistrationBackgroundModel;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.§each const each§;
   import alternativa.tanks.service.§each package super§;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.§>$$§;
   import alternativa.tanks.view.CaptchaSectionMediator;
   import alternativa.tanks.view.EntranceViewMediator;
   import alternativa.tanks.view.ExternalRegistrationFormMediator;
   import alternativa.tanks.view.LinkExternalLoginFormMediator;
   import alternativa.tanks.view.LoginFormMediator;
   import alternativa.tanks.view.PasswordRestoreFormMediator;
   import alternativa.tanks.view.RegistrationCommonElementsSectionMediator;
   import alternativa.tanks.view.RegistrationFormMediator;
   import alternativa.tanks.view.StandAloneCaptchaForm;
   import alternativa.tanks.view.StandAloneCaptchaMediator;
   import alternativa.tanks.view.ViewTextMediator;
   import alternativa.tanks.view.§]!?§;
   import alternativa.tanks.view.events.SendRestoreEmailMessageEvent;
   import alternativa.tanks.view.forms.§!"z§;
   import alternativa.tanks.view.forms.ExternalRegistrationForm;
   import alternativa.tanks.view.forms.LinkExternalLoginForm;
   import alternativa.tanks.view.forms.LoginForm;
   import alternativa.tanks.view.forms.PasswordRestoreForm;
   import alternativa.tanks.view.forms.RegistrationForm;
   import alternativa.tanks.view.forms.ViewText;
   import alternativa.tanks.view.forms.§case do§;
   import alternativa.tanks.view.forms.commons.RegistrationCommonElementsSection;
   import alternativa.tanks.view.layers.EntranceView;
   import alternativa.tanks.view.registration.CaptchaSection;
   import flash.display.DisplayObjectContainer;
   import org.robotlegs.base.ContextEvent;
   import org.robotlegs.mvcs.Context;
   import platform.client.fp10.core.service.address.AddressService;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class EntranceContext extends Context
   {
      protected var _entranceRootView:EntranceView;
      
      public var entranceView:EntranceView;
      
      public function EntranceContext(param1:DisplayObjectContainer)
      {
         super(param1);
      }
      
      override public function startup() : void
      {
         injector.mapSingleton(RegistrationBackgroundModel);
         injector.mapSingleton(EntranceUrlParamsModel);
         injector.mapSingleton(EntranceServerParamsModel);
         injector.mapValue(ILocaleService,OSGi.getInstance().getService(ILocaleService) as ILocaleService);
         injector.mapValue(IStorageService,OSGi.getInstance().getService(IStorageService) as IStorageService);
         injector.mapValue(ILauncherParams,OSGi.getInstance().getService(ILauncherParams) as ILauncherParams);
         injector.mapValue(AddressService,OSGi.getInstance().getService(AddressService) as AddressService);
         injector.mapValue(ITrackerService,OSGi.getInstance().getService(ITrackerService) as ITrackerService);
         injector.mapSingletonOf(IEntranceServerFacade,§##z§);
         injector.mapSingletonOf(IEntranceClientFacade,§implements catch get§);
         injector.mapSingletonOf(§each package super§,§throw package final§);
         injector.mapSingletonOf(§each const each§,§finally with§);
         mediatorMap.mapView(EntranceView,EntranceViewMediator);
         mediatorMap.mapView(ExternalRegistrationForm,ExternalRegistrationFormMediator);
         mediatorMap.mapView(LinkExternalLoginForm,LinkExternalLoginFormMediator);
         mediatorMap.mapView(LoginForm,LoginFormMediator);
         mediatorMap.mapView(RegistrationForm,RegistrationFormMediator);
         mediatorMap.mapView(RegistrationCommonElementsSection,RegistrationCommonElementsSectionMediator);
         mediatorMap.mapView(§case do§,§>$$§);
         mediatorMap.mapView(PasswordRestoreForm,PasswordRestoreFormMediator);
         mediatorMap.mapView(§!"z§,§]!?§);
         mediatorMap.mapView(StandAloneCaptchaForm,StandAloneCaptchaMediator);
         mediatorMap.mapView(CaptchaSection,CaptchaSectionMediator);
         mediatorMap.mapView(ViewText,ViewTextMediator);
         commandMap.mapEvent(CheckCallsignEvent.CHECK_CALLSIGN,CheckCallsignCommand,CheckCallsignEvent);
         commandMap.mapEvent(§<#l§.INVITE_ENTERED,§8"c§,§<#l§);
         commandMap.mapEvent(SendNewPasswordAndEmailToChangeEvent.SEND,§4!_§,SendNewPasswordAndEmailToChangeEvent);
         commandMap.mapEvent(ChooseInitialStateEvent.CHOOSE_INITIAL_STATE,ChooseInitialStateCommand,ChooseInitialStateEvent);
         commandMap.mapEvent(SendRestoreEmailMessageEvent.SEND,SendRestoreEmailMessageCommand,SendRestoreEmailMessageEvent);
         commandMap.mapEvent(LoginEvent.CHECK_CAPTCHA_AND_LOGIN,CheckLoginFormCaptchaCommand,LoginEvent);
         commandMap.mapEvent(LoginEvent.LOGIN_AFTER_CAPTCHA_CHECKED,LoginCommand,LoginEvent);
         commandMap.mapEvent(ExternalLoginEvent.CHECK_CAPTCHA_AND_LOGIN,CheckExternalLoginFormCaptchaCommand,ExternalLoginEvent);
         commandMap.mapEvent(ExternalLoginEvent.LOGIN_AFTER_CAPTCHA_CHECKED,ExternalLoginCommand,ExternalLoginEvent);
         commandMap.mapEvent(StartExternalEntranceEvent.START_REGISTRATION,StartExternalRegisterUserCommand,StartExternalEntranceEvent);
         commandMap.mapEvent(StartExternalEntranceEvent.START_LOGIN,StartExternalLoginUserCommand,StartExternalEntranceEvent);
         commandMap.mapEvent(FinishExternalRegisterEvent.FINISH_REGISTRATION,FinishExternalRegisterUserCommand,FinishExternalRegisterEvent);
         commandMap.mapEvent(NavigationExternalEvent.GO_TO_EXTERNAL_REGISTRATION_FORM,GoToExternalRegistrationCommand,NavigationExternalEvent);
         commandMap.mapEvent(NavigationExternalEvent.GO_TO_EXTERNAL_LOGIN_FORM,GoToExternalLoginCommand,NavigationExternalEvent);
         commandMap.mapEvent(NavigationEvent.GO_TO_REGISTRATION_FORM,GoToRegistrationCommand,NavigationEvent);
         commandMap.mapEvent(NavigationEvent.GO_TO_LOGIN_FORM,GoToLoginCommand,NavigationEvent);
         commandMap.mapEvent(NavigationEvent.GO_TO_RESTORE_PASSWORD_FORM,GoToRestorePasswordCommand,NavigationEvent);
         commandMap.mapEvent(NavigationEvent.GO_TO_INVITE_FORM,§set set for§,NavigationEvent);
         commandMap.mapEvent(NavigationEvent.GO_TO_STAND_ALONE_CAPTCHA,GoToStandaloneCaptcha,NavigationEvent);
         commandMap.mapEvent(CheckCaptchaAnswerEvent.EVENT_TYPE,§catch const use§,CheckCaptchaAnswerEvent);
         commandMap.mapEvent(GetNewCaptchaEvent.GET_CAPTCHA,GetNewCaptchaCommand,GetNewCaptchaEvent);
         commandMap.mapEvent(ParseUrlParamsEvent.PARSE_URL_PARAMS_EVENT,ParseUrlParamsCommand,ParseUrlParamsEvent);
         commandMap.mapEvent(RegisterEvent.REGISTER_AFTER_CAPTCHA_CHECKED,RegisterUserCommand,RegisterEvent);
         commandMap.mapEvent(RegisterEvent.CHECK_CAPTCHA_AND_REGISTER,CheckRegistrationCaptchaCommand,RegisterEvent);
         this.mapPartners();
         this._entranceRootView = new EntranceView();
         contextView.addChild(this._entranceRootView);
         eventDispatcher.addEventListener(ContextEvent.SHUTDOWN,this.onShutDown);
         super.startup();
         UserModelActivator.registerClientFacade(injector.getInstance(IEntranceClientFacade));
         UserModelActivator.registerServerFacade(injector.getInstance(IEntranceServerFacade));
      }
      
      private function mapPartners() : void
      {
         injector.mapValue(IPartnerService,OSGi.getInstance().getService(IPartnerService));
      }
      
      private function onShutDown(param1:ContextEvent) : void
      {
         this.shutdown();
      }
      
      override public function shutdown() : void
      {
         while(contextView.numChildren > 0)
         {
            contextView.removeChildAt(0);
         }
         UserModelActivator.unregisterClientFacade();
         UserModelActivator.unregisterServerFacade();
         super.shutdown();
      }
   }
}

