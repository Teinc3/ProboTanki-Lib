package projects.tanks.clients.fp10.models.battlefieldmodelflash
{
   import Renamed137.Renamed4536;
   import Renamed137.Renamed2400;
   import Renamed137.Renamed4537;
   import Renamed9.Renamed11;
   import Renamed142.Renamed4538;
   import Renamed142.Renamed4539;
   import Renamed142.Renamed2741;
   import Renamed143.Renamed2742;
   import Renamed4540.Renamed4541;
   import Renamed12.Renamed14;
   import Renamed15.Renamed4542;
   import Renamed4543.Renamed4544;
   import Renamed4543.Renamed4545;
   import Renamed4543.Renamed4546;
   import Renamed4543.Renamed4547;
   import Renamed4548.Renamed4549;
   import Renamed4548.Renamed4550;
   import Renamed4548.Renamed4551;
   import Renamed4548.Renamed4552;
   import Renamed4553.Renamed4554;
   import Renamed148.Renamed2743;
   import Renamed150.Renamed2745;
   import Renamed155.Renamed4555;
   import Renamed17.Renamed4556;
   import Renamed17.Renamed4557;
   import Renamed17.Renamed4558;
   import Renamed17.Renamed4559;
   import Renamed17.Renamed18;
   import Renamed17.Renamed4560;
   import Renamed4561.Renamed4562;
   import Renamed4561.Renamed4563;
   import Renamed194.Renamed4564;
   import Renamed200.Renamed2746;
   import Renamed200.Renamed2747;
   import Renamed200.Renamed2748;
   import Renamed200.Renamed2749;
   import Renamed200.Renamed2401;
   import Renamed200.Renamed2750;
   import Renamed200.Renamed2751;
   import Renamed200.Renamed4565;
   import Renamed201.Renamed4566;
   import Renamed4567.Renamed4568;
   import Renamed202.Renamed4569;
   import Renamed19.Renamed4570;
   import Renamed19.Renamed20;
   import Renamed19.Renamed4571;
   import Renamed207.Renamed4572;
   import Renamed206.Renamed4573;
   import Renamed209.Renamed2752;
   import Renamed215.Renamed4574;
   import Renamed220.Renamed4575;
   import Renamed220.Renamed4576;
   import Renamed21.Renamed22;
   import Renamed224.Renamed4577;
   import Renamed224.Renamed4578;
   import Renamed224.Renamed4579;
   import Renamed224.Renamed4580;
   import Renamed224.Renamed4581;
   import Renamed224.Renamed4582;
   import Renamed226.Renamed4583;
   import Renamed226.Renamed4584;
   import Renamed226.Renamed4585;
   import Renamed226.Renamed3433;
   import Renamed4586.Renamed4587;
   import Renamed27.Renamed28;
   import Renamed29.Renamed30;
   import Renamed3253.Renamed4588;
   import Renamed3253.Renamed4589;
   import Renamed3253.Renamed3254;
   import Renamed3253.Renamed4590;
   import Renamed244.Renamed4591;
   import Renamed250.Renamed4592;
   import Renamed250.Renamed4593;
   import Renamed4594.Renamed4595;
   import Renamed3505.Renamed3506;
   import Renamed3505.Renamed4596;
   import Renamed3505.Renamed3511;
   import Renamed257.Renamed4597;
   import Renamed258.Renamed3512;
   import Renamed258.Renamed3507;
   import Renamed258.Renamed4598;
   import Renamed259.Renamed4599;
   import Renamed259.Renamed3435;
   import Renamed259.Renamed3255;
   import Renamed259.Renamed4600;
   import Renamed31.Renamed32;
   import Renamed264.Renamed508;
   import Renamed264.Renamed4601;
   import Renamed264.Renamed509;
   import Renamed264.Renamed4602;
   import Renamed1.Renamed4603;
   import Renamed1.Renamed4604;
   import Renamed1.Renamed1441;
   import Renamed4605.Renamed4606;
   import Renamed4607.Renamed4608;
   import Renamed279.Renamed4609;
   import Renamed280.Renamed3292;
   import Renamed280.Renamed3293;
   import Renamed281.Renamed4610;
   import Renamed4611.Renamed4612;
   import Renamed292.Renamed4613;
   import Renamed293.Renamed1228;
   import Renamed34.Renamed36;
   import Renamed4614.Renamed4615;
   import Renamed4614.Renamed4616;
   import Renamed4614.Renamed4617;
   import Renamed4614.Renamed4618;
   import Renamed4619.Renamed4620;
   import Renamed37.Renamed38;
   import Renamed301.Renamed3043;
   import Renamed301.Renamed4621;
   import Renamed4622.Renamed4623;
   import Renamed4624.Renamed4625;
   import Renamed3294.Renamed3295;
   import Renamed4626.Renamed4627;
   import Renamed4626.Renamed4628;
   import Renamed39.Renamed40;
   import Renamed306.Renamed4629;
   import Renamed41.Renamed42;
   import Renamed475.Renamed4630;
   import Renamed475.Renamed4631;
   import Renamed477.Renamed4632;
   import Renamed479.Renamed2753;
   import Renamed479.Renamed2754;
   import Renamed479.Renamed4633;
   import Renamed479.Renamed2755;
   import Renamed479.Renamed3148;
   import Renamed479.Renamed3149;
   import Renamed479.Renamed914;
   import Renamed479.Renamed915;
   import Renamed482.Renamed4634;
   import Renamed487.Renamed4635;
   import Renamed487.Renamed4636;
   import Renamed487.Renamed4637;
   import Renamed487.Renamed4638;
   import Renamed485.Renamed4639;
   import Renamed485.Renamed4640;
   import Renamed485.Renamed4641;
   import Renamed485.Renamed4642;
   import Renamed488.Renamed2613;
   import Renamed488.Renamed2614;
   import Renamed4643.Renamed4644;
   import Renamed4645.Renamed4646;
   import Renamed2615.Renamed4647;
   import Renamed2615.Renamed4648;
   import Renamed2615.Renamed4649;
   import Renamed2615.Renamed4650;
   import Renamed2615.Renamed4651;
   import Renamed2615.Renamed4652;
   import Renamed2615.Renamed2757;
   import Renamed2615.Renamed4653;
   import Renamed2615.Renamed2616;
   import Renamed2615.Renamed4654;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.dump.IDumper;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed623;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.objects.tank.skintexturesregistry.TankSkinTextureRegistry;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.battle.scene3d.Renamed1304;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.bonuses.BattleBonus;
   import alternativa.tanks.bonuses.BonusMesh;
   import alternativa.tanks.bonuses.BonusObject3DBase;
   import alternativa.tanks.bonuses.BonusPickupAnimation;
   import alternativa.tanks.bonuses.GroundSpawnRenderer;
   import alternativa.tanks.bonuses.ParachuteDetachAnimation;
   import alternativa.tanks.bonuses.RemovalAnimation;
   import alternativa.tanks.bonuses.SpawnAnimation;
   import alternativa.tanks.bonuses.SpawnFlashRenderer;
   import alternativa.tanks.camera.Renamed1453;
   import alternativa.tanks.camera.Renamed1458;
   import alternativa.tanks.camera.Renamed1498;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed1656;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.models.battle.battlefield.Renamed2310;
   import alternativa.tanks.models.battle.battlefield.Renamed2383;
   import alternativa.tanks.models.battle.battlefield.Renamed2320;
   import alternativa.tanks.models.battle.battlefield.Renamed2326;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.battlefield.Renamed2453;
   import alternativa.tanks.models.battle.battlefield.Renamed2311;
   import alternativa.tanks.models.battle.battlefield.Renamed2394;
   import alternativa.tanks.models.battle.battlefield.Renamed2417;
   import alternativa.tanks.models.battle.battlefield.Renamed2524;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import alternativa.tanks.models.battle.gui.chat.Renamed2568;
   import alternativa.tanks.models.battle.gui.chat.Renamed2571;
   import alternativa.tanks.models.battle.gui.chat.ChatModel;
   import alternativa.tanks.models.battle.gui.chat.Renamed2566;
   import alternativa.tanks.models.battle.gui.chat.Renamed2597;
   import alternativa.tanks.models.tank.Renamed2735;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2787;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.tank.Renamed2813;
   import alternativa.tanks.models.tank.spawn.spawnhandlers.Renamed2758;
   import alternativa.tanks.models.tank.Renamed2865;
   import alternativa.tanks.models.tank.Renamed2864;
   import alternativa.tanks.models.tank.Renamed2409;
   import alternativa.tanks.models.tank.Renamed2867;
   import alternativa.tanks.models.weapon.Renamed43;
   import alternativa.tanks.models.weapon.machinegun.Renamed3076;
   import alternativa.tanks.models.weapon.machinegun.Renamed3106;
   import alternativa.tanks.models.weapon.machinegun.Renamed44;
   import alternativa.tanks.models.weapon.machinegun.Renamed3081;
   import alternativa.tanks.models.weapon.shaft.Renamed3153;
   import alternativa.tanks.models.weapon.shaft.Renamed3257;
   import alternativa.tanks.models.weapon.shaft.Renamed45;
   import alternativa.tanks.models.weapon.shaft.Renamed3170;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.models.weapon.shared.Renamed2943;
   import alternativa.tanks.models.weapon.shotgun.Renamed3418;
   import alternativa.tanks.models.weapon.shotgun.Renamed46;
   import alternativa.tanks.models.weapon.smoky.Renamed3480;
   import alternativa.tanks.models.weapon.smoky.Renamed47;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battlegui.Renamed522;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import alternativa.tanks.services.battlereadiness.Renamed524;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.tanks.services.ping.PingService;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.tanks.services.targeting.Renamed530;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.services.targeting.Renamed531;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.utils.TextureMaterialRegistry;
   import Renamed310.Renamed3121;
   import Renamed48.Renamed4655;
   import Renamed48.Renamed49;
   import Renamed50.Renamed51;
   import Renamed50.Renamed4656;
   import Renamed50.Renamed4657;
   import Renamed320.Renamed4658;
   import Renamed325.Renamed2411;
   import Renamed52.Renamed53;
   import Renamed56.Renamed4659;
   import Renamed56.Renamed4660;
   import Renamed56.Renamed57;
   import Renamed332.Renamed4661;
   import Renamed333.Renamed2382;
   import Renamed333.Renamed4662;
   import Renamed335.Renamed4663;
   import Renamed342.Renamed2412;
   import Renamed344.Renamed4664;
   import Renamed61.Renamed62;
   import Renamed349.Renamed4665;
   import Renamed351.ControlsHelper;
   import Renamed351.Renamed4666;
   import Renamed357.Renamed2763;
   import Renamed358.Renamed4667;
   import Renamed63.Renamed64;
   import Renamed63.Renamed4668;
   import Renamed63.Renamed4669;
   import Renamed63.Renamed4670;
   import Renamed63.Renamed4671;
   import Renamed361.Renamed4672;
   import Renamed65.Renamed67;
   import Renamed364.Renamed4673;
   import Renamed364.Renamed4674;
   import Renamed364.Renamed4675;
   import Renamed364.Renamed4676;
   import Renamed365.Renamed2766;
   import Renamed368.IChatModelBase;
   import Renamed369.Renamed4677;
   import Renamed370.Renamed4678;
   import Renamed373.Renamed4679;
   import Renamed375.Renamed4680;
   import Renamed375.Renamed4681;
   import Renamed375.Renamed4682;
   import Renamed375.Renamed2767;
   import Renamed379.Renamed2647;
   import Renamed383.Renamed4683;
   import Renamed384.Renamed4684;
   import Renamed68.Renamed69;
   import Renamed388.Renamed4685;
   import Renamed70.Renamed4686;
   import Renamed70.Renamed4687;
   import Renamed70.Renamed71;
   import Renamed70.Renamed4688;
   import Renamed394.Renamed3074;
   import Renamed394.Renamed4689;
   import Renamed394.Renamed4690;
   import Renamed394.Renamed4691;
   import Renamed394.Renamed4692;
   import Renamed396.Renamed4693;
   import Renamed72.Renamed73;
   import Renamed72.Renamed4694;
   import Renamed72.Renamed4695;
   import Renamed74.Renamed3436;
   import Renamed74.Renamed4696;
   import Renamed74.Renamed75;
   import Renamed74.Renamed4697;
   import Renamed74.Renamed4698;
   import Renamed74.Renamed4699;
   import Renamed74.Renamed76;
   import Renamed399.Renamed4700;
   import Renamed77.Renamed4701;
   import Renamed403.Renamed4702;
   import Renamed403.Renamed4703;
   import Renamed403.Renamed2414;
   import Renamed403.Renamed4704;
   import Renamed408.Renamed4705;
   import Renamed410.Renamed4706;
   import Renamed411.Renamed4707;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import projects.tanks.client.battlefield.models.battle.battlefield.Renamed2415;
   import projects.tanks.client.battleservice.model.statistics.Renamed4214;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import Renamed79.Renamed2769;
   import Renamed79.Renamed80;
   import Renamed79.Renamed81;
   import services.contextmenu.IContextMenuService;
   import Renamed82.Renamed83;
   import Renamed428.Renamed4708;
   import Renamed431.Renamed4709;
   import Renamed87.Renamed88;
   import Renamed87.Renamed4710;
   import Renamed87.Renamed4711;
   import Renamed87.Renamed4712;
   import Renamed87.Renamed4713;
   import Renamed87.Renamed4714;
   import Renamed439.Renamed4715;
   import Renamed444.Renamed4716;
   import Renamed446.Renamed2770;
   import Renamed446.Renamed2771;
   import Renamed91.Renamed93;
   import Renamed451.Renamed4717;
   import Renamed451.Renamed4718;
   import Renamed451.Renamed4719;
   import Renamed94.Renamed95;
   import Renamed462.Renamed4720;
   import Renamed462.Renamed4721;
   import Renamed462.Renamed4722;
   import Renamed462.Renamed4723;
   import Renamed462.Renamed3122;
   import Renamed462.Renamed3128;
   import Renamed462.Renamed3075;
   import Renamed462.Renamed4724;
   import Renamed97.Renamed98;
   
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
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed522.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed522.display;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed3148.Renamed1499 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed3148.Renamed1499;
         });
         osgi.injectService(TargetingModeService,function(param1:Object):void
         {
            Renamed3148.Renamed926 = TargetingModeService(param1);
         },function():TargetingModeService
         {
            return Renamed3148.Renamed926;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed2383.Renamed2384 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed2383.Renamed2384;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2320.Renamed2321 = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2320.Renamed2321;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed2320.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed2320.Renamed718;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2320.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2320.battleService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4652.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4652.display;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            Renamed4652.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return Renamed4652.panelView;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed4652.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed4652.settingsService;
         });
         osgi.injectService(SpectatorService,function(param1:Object):void
         {
            Renamed4652.Renamed2545 = SpectatorService(param1);
         },function():SpectatorService
         {
            return Renamed4652.Renamed2545;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed4652.Renamed4725 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed4652.Renamed4725;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4652.Renamed4726 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4652.Renamed4726;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            Renamed2401.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return Renamed2401.dialogWindowsDispatcherService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed2401.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed2401.lobbyLayoutService;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            Renamed2401.dialogService = IDialogsService(param1);
         },function():IDialogsService
         {
            return Renamed2401.dialogService;
         });
         osgi.injectService(IBlurService,function(param1:Object):void
         {
            Renamed2401.blurService = IBlurService(param1);
         },function():IBlurService
         {
            return Renamed2401.blurService;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed2401.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed2401.Renamed718;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2401.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2401.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2453.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2453.battleEventDispatcher;
         });
         osgi.injectService(SpectatorService,function(param1:Object):void
         {
            Renamed2453.Renamed2545 = SpectatorService(param1);
         },function():SpectatorService
         {
            return Renamed2453.Renamed2545;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed2751.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed2751.Renamed718;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2763.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2763.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4662.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4662.display;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed4662.Renamed2775 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed4662.Renamed2775;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4662.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4662.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4662.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4662.battleEventDispatcher;
         });
         osgi.injectService(IContextMenuService,function(param1:Object):void
         {
            Renamed4662.contextMenuService = IContextMenuService(param1);
         },function():IContextMenuService
         {
            return Renamed4662.contextMenuService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2568.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2568.display;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed2568.Renamed2384 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed2568.Renamed2384;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2568.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2568.battleEventDispatcher;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2568.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2568.localeService;
         });
         osgi.injectService(IBlockUserService,function(param1:Object):void
         {
            Renamed2568.blockUserService = IBlockUserService(param1);
         },function():IBlockUserService
         {
            return Renamed2568.blockUserService;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed2568.Renamed2423 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed2568.Renamed2423;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed2568.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed2568.battleInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed2568.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed2568.userPropertiesService;
         });
         osgi.injectService(BattleUserInfoService,function(param1:Object):void
         {
            Renamed2568.userInfoService = BattleUserInfoService(param1);
         },function():BattleUserInfoService
         {
            return Renamed2568.userInfoService;
         });
         osgi.injectService(FullscreenService,function(param1:Object):void
         {
            Renamed2568.fullscreenService = FullscreenService(param1);
         },function():FullscreenService
         {
            return Renamed2568.fullscreenService;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed2568.Renamed2425 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed2568.Renamed2425;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2597.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2597.localeService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed4717.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed4717.battleInfoService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            Renamed4651.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return Renamed4651.storageService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4651.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4651.battleEventDispatcher;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed4651.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed4651.userPropertiesService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4651.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4651.display;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4651.Renamed2423 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4651.Renamed2423;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            Renamed4666.helpService = IHelpService(param1);
         },function():IHelpService
         {
            return Renamed4666.helpService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4666.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4666.localeService;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed1228.Renamed1233 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed1228.Renamed1233;
         });
         osgi.injectService(TankSkinTextureRegistry,function(param1:Object):void
         {
            Renamed1228.Renamed4727 = TankSkinTextureRegistry(param1);
         },function():TankSkinTextureRegistry
         {
            return Renamed1228.Renamed4727;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed1228.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed1228.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4630.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4630.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4630.Renamed4728 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4630.Renamed4728;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4630.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4630.battleEventDispatcher;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4630.Renamed2423 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4630.Renamed2423;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed4630.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed4630.battleInfoService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4574.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4574.display;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4574.Renamed4729 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4574.Renamed4729;
         });
         osgi.injectService(ColorTransformService,function(param1:Object):void
         {
            Renamed4554.Renamed2421 = ColorTransformService(param1);
         },function():ColorTransformService
         {
            return Renamed4554.Renamed2421;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed4554.Renamed1368 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed4554.Renamed1368;
         });
         osgi.injectService(ILightingEffectsService,function(param1:Object):void
         {
            Renamed4554.Renamed4730 = ILightingEffectsService(param1);
         },function():ILightingEffectsService
         {
            return Renamed4554.Renamed4730;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed2411.Renamed1368 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed2411.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2411.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2411.battleService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed2647.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed2647.battleInfoService;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed2647.Renamed2775 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed2647.Renamed2775;
         });
         osgi.injectService(BattleUserInfoService,function(param1:Object):void
         {
            Renamed2647.userInfoService = BattleUserInfoService(param1);
         },function():BattleUserInfoService
         {
            return Renamed2647.userInfoService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed1304.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed1304.battleService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed40.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed40.display;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed40.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed40.lobbyLayoutService;
         });
         osgi.injectService(IServerHaltService,function(param1:Object):void
         {
            Renamed40.Renamed4481 = IServerHaltService(param1);
         },function():IServerHaltService
         {
            return Renamed40.Renamed4481;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed40.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed40.userPropertiesService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed40.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed40.battleEventDispatcher;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed40.Renamed4729 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed40.Renamed4729;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed40.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed40.Renamed718;
         });
         osgi.injectService(INotificationService,function(param1:Object):void
         {
            Renamed40.notificationService = INotificationService(param1);
         },function():INotificationService
         {
            return Renamed40.notificationService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed40.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed40.battleInfoService;
         });
         osgi.injectService(PremiumService,function(param1:Object):void
         {
            Renamed40.premiumService = PremiumService(param1);
         },function():PremiumService
         {
            return Renamed40.premiumService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4718.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4718.localeService;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed531.Renamed1499 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed531.Renamed1499;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed531.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed531.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed531.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed531.display;
         });
         osgi.injectService(FullscreenStateService,function(param1:Object):void
         {
            Renamed531.Renamed3870 = FullscreenStateService(param1);
         },function():FullscreenStateService
         {
            return Renamed531.Renamed3870;
         });
         osgi.injectService(FullscreenService,function(param1:Object):void
         {
            Renamed531.Renamed3844 = FullscreenService(param1);
         },function():FullscreenService
         {
            return Renamed531.Renamed3844;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed531.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed531.settingsService;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed531.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed531.Renamed719;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed530.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed530.display;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed530.Renamed3843 = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed530.Renamed3843;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed530.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed530.Renamed718;
         });
         osgi.injectService(FullscreenService,function(param1:Object):void
         {
            Renamed530.Renamed3844 = FullscreenService(param1);
         },function():FullscreenService
         {
            return Renamed530.Renamed3844;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed530.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed530.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4719.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4719.display;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4719.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4719.localeService;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed4719.Renamed1499 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed4719.Renamed1499;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4709.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4709.display;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed98.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed98.display;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed98.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed98.lobbyLayoutService;
         });
         osgi.injectService(IServerHaltService,function(param1:Object):void
         {
            Renamed98.Renamed4481 = IServerHaltService(param1);
         },function():IServerHaltService
         {
            return Renamed98.Renamed4481;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed98.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed98.userPropertiesService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed98.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed98.battleEventDispatcher;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed98.Renamed4729 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed98.Renamed4729;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed98.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed98.Renamed718;
         });
         osgi.injectService(INotificationService,function(param1:Object):void
         {
            Renamed98.notificationService = INotificationService(param1);
         },function():INotificationService
         {
            return Renamed98.notificationService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed98.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed98.battleInfoService;
         });
         osgi.injectService(PremiumService,function(param1:Object):void
         {
            Renamed98.premiumService = PremiumService(param1);
         },function():PremiumService
         {
            return Renamed98.premiumService;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed4648.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed4648.settingsService;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4648.Renamed2423 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4648.Renamed2423;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2748.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2748.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2748.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2748.battleService;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed2748.Renamed2384 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed2748.Renamed2384;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2748.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2748.display;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed2748.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed2748.Renamed719;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed1458.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed1458.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed524.Renamed3809 = BattleService(param1);
         },function():BattleService
         {
            return Renamed524.Renamed3809;
         });
         osgi.injectService(ILoaderWindowService,function(param1:Object):void
         {
            Renamed524.loaderWindowService = ILoaderWindowService(param1);
         },function():ILoaderWindowService
         {
            return Renamed524.loaderWindowService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed524.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed524.lobbyLayoutService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed832.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed832.battleService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            Renamed623.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return Renamed623.storageService;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed623.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed623.Renamed718;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed623.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed623.display;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed623.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed623.Renamed719;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed623.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed623.battleService;
         });
         osgi.injectService(IBackgroundService,function(param1:Object):void
         {
            Renamed623.Renamed720 = IBackgroundService(param1);
         },function():IBackgroundService
         {
            return Renamed623.Renamed720;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            Renamed2417.logService = LogService(param1);
         },function():LogService
         {
            return Renamed2417.logService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            Renamed2417.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return Renamed2417.storageService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2417.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2417.display;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2417.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2417.battleEventDispatcher;
         });
         osgi.injectService(DataValidator,function(param1:Object):void
         {
            Renamed2417.Renamed2419 = DataValidator(param1);
         },function():DataValidator
         {
            return Renamed2417.Renamed2419;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed2417.settings = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed2417.settings;
         });
         osgi.injectService(IBackgroundService,function(param1:Object):void
         {
            Renamed2417.Renamed720 = IBackgroundService(param1);
         },function():IBackgroundService
         {
            return Renamed2417.Renamed720;
         });
         osgi.injectService(MipMappingService,function(param1:Object):void
         {
            Renamed2417.Renamed2420 = MipMappingService(param1);
         },function():MipMappingService
         {
            return Renamed2417.Renamed2420;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed2417.Renamed1368 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed2417.Renamed1368;
         });
         osgi.injectService(ColorTransformService,function(param1:Object):void
         {
            Renamed2417.Renamed2421 = ColorTransformService(param1);
         },function():ColorTransformService
         {
            return Renamed2417.Renamed2421;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed2417.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed2417.battleInfoService;
         });
         osgi.injectService(BattleReadinessService,function(param1:Object):void
         {
            Renamed2417.Renamed2422 = BattleReadinessService(param1);
         },function():BattleReadinessService
         {
            return Renamed2417.Renamed2422;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed2417.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed2417.Renamed718;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed2417.Renamed2423 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed2417.Renamed2423;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed2417.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed2417.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2417.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2417.localeService;
         });
         osgi.injectService(ILightingEffectsService,function(param1:Object):void
         {
            Renamed2417.Renamed2424 = ILightingEffectsService(param1);
         },function():ILightingEffectsService
         {
            return Renamed2417.Renamed2424;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed2417.Renamed2425 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed2417.Renamed2425;
         });
         osgi.injectService(TargetingModeService,function(param1:Object):void
         {
            Renamed2417.Renamed926 = TargetingModeService(param1);
         },function():TargetingModeService
         {
            return Renamed2417.Renamed926;
         });
         osgi.injectService(INotificationService,function(param1:Object):void
         {
            Renamed2417.notificationService = INotificationService(param1);
         },function():INotificationService
         {
            return Renamed2417.notificationService;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed2417.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed2417.Renamed719;
         });
         osgi.injectService(ResourceRegistry,function(param1:Object):void
         {
            Renamed2417.resourceRegistry = ResourceRegistry(param1);
         },function():ResourceRegistry
         {
            return Renamed2417.resourceRegistry;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4608.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4608.localeService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4644.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4644.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            SpawnFlashRenderer.battleService = BattleService(param1);
         },function():BattleService
         {
            return SpawnFlashRenderer.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            ParachuteDetachAnimation.battleService = BattleService(param1);
         },function():BattleService
         {
            return ParachuteDetachAnimation.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            BonusPickupAnimation.battleService = BattleService(param1);
         },function():BattleService
         {
            return BonusPickupAnimation.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            RemovalAnimation.battleService = BattleService(param1);
         },function():BattleService
         {
            return RemovalAnimation.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2865.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2865.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2865.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2865.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            BonusObject3DBase.battleService = BattleService(param1);
         },function():BattleService
         {
            return BonusObject3DBase.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            SpawnAnimation.battleService = BattleService(param1);
         },function():BattleService
         {
            return SpawnAnimation.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            GroundSpawnRenderer.battleService = BattleService(param1);
         },function():BattleService
         {
            return GroundSpawnRenderer.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4609.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4609.battleService;
         });
         osgi.injectService(ILightingEffectsService,function(param1:Object):void
         {
            BattleBonus.Renamed1445 = ILightingEffectsService(param1);
         },function():ILightingEffectsService
         {
            return BattleBonus.Renamed1445;
         });
         osgi.injectService(ILightingEffectsService,function(param1:Object):void
         {
            BonusMesh.Renamed1445 = ILightingEffectsService(param1);
         },function():ILightingEffectsService
         {
            return BonusMesh.Renamed1445;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3512.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3512.battleService;
         });
         osgi.injectService(PingService,function(param1:Object):void
         {
            Renamed4632.Renamed4731 = PingService(param1);
         },function():PingService
         {
            return Renamed4632.Renamed4731;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4694.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4694.battleService;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed1498.settings = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed1498.settings;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            Renamed1498.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return Renamed1498.storageService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed1498.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed1498.display;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed1498.Renamed1499 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed1498.Renamed1499;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed1498.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed1498.battleEventDispatcher;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed1498.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed1498.Renamed719;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4705.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4705.battleService;
         });
         osgi.injectService(TargetingModeService,function(param1:Object):void
         {
            Renamed4545.Renamed926 = TargetingModeService(param1);
         },function():TargetingModeService
         {
            return Renamed4545.Renamed926;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed4545.Renamed1499 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed4545.Renamed1499;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed4545.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed4545.Renamed719;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4603.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4603.battleService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            Renamed4603.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return Renamed4603.userInfoService;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed4603.Renamed1368 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed4603.Renamed1368;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2753.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2753.display;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2753.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2753.battleEventDispatcher;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed2753.Renamed4732 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed2753.Renamed4732;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed914.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed914.display;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed914.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed914.battleService;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed914.Renamed2384 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed914.Renamed2384;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed914.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed914.battleEventDispatcher;
         });
         osgi.injectService(TargetingModeService,function(param1:Object):void
         {
            Renamed914.Renamed4733 = TargetingModeService(param1);
         },function():TargetingModeService
         {
            return Renamed914.Renamed4733;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed914.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed914.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2943.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2943.battleService;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed4544.Renamed4734 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed4544.Renamed4734;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed4544.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed4544.settingsService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4544.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4544.display;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3511.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3511.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed20.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed20.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed20.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed20.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4685.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4685.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4571.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4571.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4571.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4571.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4549.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4549.battleEventDispatcher;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            Renamed4549.modelRegistry = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return Renamed4549.modelRegistry;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4547.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4547.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3295.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3295.battleService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed3295.Renamed3672 = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed3295.Renamed3672;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed3295.settings = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed3295.settings;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4546.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4546.battleService;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed4546.Renamed1499 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed4546.Renamed1499;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4633.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4633.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4596.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4596.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3507.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3507.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4592.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4592.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4679.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4679.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed1441.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed1441.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2813.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2813.battleService;
         });
         osgi.injectService(BattleReadinessService,function(param1:Object):void
         {
            Renamed2813.Renamed2422 = BattleReadinessService(param1);
         },function():BattleReadinessService
         {
            return Renamed2813.Renamed2422;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4628.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4628.display;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4628.Renamed4729 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4628.Renamed4729;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4628.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4628.localeService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4676.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4676.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4676.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4676.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4551.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4551.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed1656.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed1656.battleService;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed915.Renamed1499 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed915.Renamed1499;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            ChatModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return ChatModel.display;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            ChatModel.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return ChatModel.battleInfoService;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            ChatModel.Renamed2423 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return ChatModel.Renamed2423;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed2571.Renamed2384 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed2571.Renamed2384;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4598.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4598.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed668.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed668.battleService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed3150.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed3150.display;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed3150.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed3150.battleEventDispatcher;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed3150.Renamed1499 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed3150.Renamed1499;
         });
         osgi.injectService(TargetingModeService,function(param1:Object):void
         {
            Renamed3150.Renamed926 = TargetingModeService(param1);
         },function():TargetingModeService
         {
            return Renamed3150.Renamed926;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed3150.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed3150.settingsService;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed3150.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed3150.Renamed719;
         });
         osgi.injectService(TargetingModeService,function(param1:Object):void
         {
            Renamed3293.Renamed926 = TargetingModeService(param1);
         },function():TargetingModeService
         {
            return Renamed3293.Renamed926;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed3293.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed3293.display;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed3292.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed3292.display;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4565.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4565.display;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4565.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4565.battleEventDispatcher;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed4565.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed4565.Renamed718;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed4565.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed4565.lobbyLayoutService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            Renamed4565.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return Renamed4565.dialogWindowsDispatcherService;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            Renamed4565.dialogsService = IDialogsService(param1);
         },function():IDialogsService
         {
            return Renamed4565.dialogsService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4565.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4565.battleService;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4565.Renamed4729 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4565.Renamed4729;
         });
         osgi.injectService(FullscreenStateService,function(param1:Object):void
         {
            Renamed4565.fullscreenStateService = FullscreenStateService(param1);
         },function():FullscreenStateService
         {
            return Renamed4565.fullscreenStateService;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed4565.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed4565.Renamed719;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed509.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed509.battleService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4649.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4649.display;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4649.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4649.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4649.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4649.battleService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4649.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4649.localeService;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4649.Renamed4729 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4649.Renamed4729;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4558.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4558.battleService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed18.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed18.battleInfoService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed18.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed18.battleService;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed18.Renamed1368 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed18.Renamed1368;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed18.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed18.battleEventDispatcher;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed18.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed18.localeService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed18.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed18.display;
         });
         osgi.injectService(BattleUserInfoService,function(param1:Object):void
         {
            Renamed18.userInfoService = BattleUserInfoService(param1);
         },function():BattleUserInfoService
         {
            return Renamed18.userInfoService;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed18.Renamed2384 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed18.Renamed2384;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed18.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed18.Renamed719;
         });
         osgi.injectService(ILightingEffectsService,function(param1:Object):void
         {
            Renamed4556.Renamed4730 = ILightingEffectsService(param1);
         },function():ILightingEffectsService
         {
            return Renamed4556.Renamed4730;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4556.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4556.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2787.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2787.battleEventDispatcher;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2747.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2747.battleEventDispatcher;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed4712.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed4712.battleInfoService;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed88.Renamed1233 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed88.Renamed1233;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed88.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed88.battleService;
         });
         osgi.injectService(IDumpService,function(param1:Object):void
         {
            Renamed88.Renamed4735 = IDumpService(param1);
         },function():IDumpService
         {
            return Renamed88.Renamed4735;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed88.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed88.battleEventDispatcher;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2771.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2771.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2771.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2771.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4593.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4593.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4593.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4593.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed47.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed47.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed47.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed47.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed57.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed57.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed57.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed57.battleEventDispatcher;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed57.Renamed2775 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed57.Renamed2775;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4659.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4659.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4659.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4659.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed45.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed45.battleService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed45.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed45.display;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed45.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed45.battleEventDispatcher;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed45.Renamed2775 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed45.Renamed2775;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed3257.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed3257.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3257.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3257.battleService;
         });
         osgi.injectService(TargetingModeService,function(param1:Object):void
         {
            Renamed3170.Renamed926 = TargetingModeService(param1);
         },function():TargetingModeService
         {
            return Renamed3170.Renamed926;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed3170.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed3170.display;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed64.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed64.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed64.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed64.battleEventDispatcher;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4669.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4669.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4669.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4669.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4668.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4668.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4670.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4670.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4604.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4604.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4686.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4686.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4687.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4687.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4687.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4687.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed71.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed71.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed71.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed71.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed73.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed73.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed73.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed73.battleEventDispatcher;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4695.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4695.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4695.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4695.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4655.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4655.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4655.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4655.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed49.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed49.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed49.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed49.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4610.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4610.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4656.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4656.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4656.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4656.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed51.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed51.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed51.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed51.battleEventDispatcher;
         });
         osgi.injectService(DataValidator,function(param1:Object):void
         {
            Renamed2412.Renamed2419 = DataValidator(param1);
         },function():DataValidator
         {
            return Renamed2412.Renamed2419;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2412.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2412.battleService;
         });
         osgi.injectService(CommandService,function(param1:Object):void
         {
            Renamed2412.commandService = CommandService(param1);
         },function():CommandService
         {
            return Renamed2412.commandService;
         });
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            Renamed2326.clientLog = IClientLog(param1);
         },function():IClientLog
         {
            return Renamed2326.clientLog;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2326.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2326.display;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed62.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed62.localeService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed62.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed62.battleService;
         });
         osgi.injectService(BattleUserInfoService,function(param1:Object):void
         {
            Renamed62.userInfoService = BattleUserInfoService(param1);
         },function():BattleUserInfoService
         {
            return Renamed62.userInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed62.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed62.userPropertiesService;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed2735.Renamed2736 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed2735.Renamed2736;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4608.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4608.localeService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            Renamed2742.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return Renamed2742.userInfoService;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed2742.Renamed2775 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed2742.Renamed2775;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed620.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed620.battleService;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed2411.Renamed1368 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed2411.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2411.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2411.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4706.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4706.battleEventDispatcher;
         });
         osgi.injectService(BattleUserInfoService,function(param1:Object):void
         {
            Renamed4706.userInfoService = BattleUserInfoService(param1);
         },function():BattleUserInfoService
         {
            return Renamed4706.userInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed4706.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed4706.userPropertiesService;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            Renamed4653.helpService = IHelpService(param1);
         },function():IHelpService
         {
            return Renamed4653.helpService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed4653.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed4653.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ControlsHelper.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ControlsHelper.localeService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed30.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed30.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed30.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed30.battleEventDispatcher;
         });
         osgi.injectService(BattleUserInfoService,function(param1:Object):void
         {
            Renamed4550.battleUserInfoService = BattleUserInfoService(param1);
         },function():BattleUserInfoService
         {
            return Renamed4550.battleUserInfoService;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed4550.Renamed2775 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed4550.Renamed2775;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            Renamed4550.modelRegistry = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return Renamed4550.modelRegistry;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2613.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2613.localeService;
         });
         osgi.injectService(IBlockUserService,function(param1:Object):void
         {
            Renamed2613.blockUserService = IBlockUserService(param1);
         },function():IBlockUserService
         {
            return Renamed2613.blockUserService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2614.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2614.localeService;
         });
         osgi.injectService(IBlockUserService,function(param1:Object):void
         {
            Renamed2614.blockUserService = IBlockUserService(param1);
         },function():IBlockUserService
         {
            return Renamed2614.blockUserService;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed2749.settings = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed2749.settings;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed38.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed38.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4647.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4647.battleEventDispatcher;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4647.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4647.localeService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2763.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2763.battleEventDispatcher;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed2770.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed2770.lobbyLayoutService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2766.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2766.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4627.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4627.display;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4627.Renamed4729 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4627.Renamed4729;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4627.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4627.localeService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2746.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2746.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2746.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2746.display;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2746.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2746.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4563.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4563.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4563.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4563.battleService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            Renamed4563.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return Renamed4563.dialogWindowsDispatcherService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed4563.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed4563.lobbyLayoutService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4562.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4562.display;
         });
         osgi.injectService(IBlurService,function(param1:Object):void
         {
            Renamed4562.blurService = IBlurService(param1);
         },function():IBlurService
         {
            return Renamed4562.blurService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4562.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4562.localeService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2750.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2750.display;
         });
         osgi.injectService(BattleFormatUtil,function(param1:Object):void
         {
            Renamed2757.Renamed1588 = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return Renamed2757.Renamed1588;
         });
         osgi.injectService(DataValidator,function(param1:Object):void
         {
            Renamed2864.Renamed2419 = DataValidator(param1);
         },function():DataValidator
         {
            return Renamed2864.Renamed2419;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed1453.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed1453.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3506.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3506.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4641.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4641.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4639.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4639.display;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4639.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4639.battleEventDispatcher;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed4639.Renamed718 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed4639.Renamed718;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed4639.Renamed2423 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed4639.Renamed2423;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed4639.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed4639.Renamed719;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4639.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4639.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4568.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4568.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4555.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4555.battleService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2757.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2757.localeService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2757.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2757.battleService;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed2757.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed2757.settingsService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            Renamed2757.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return Renamed2757.storageService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed2757.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed2757.userPropertiesService;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            Renamed2757.helpService = IHelpService(param1);
         },function():IHelpService
         {
            return Renamed2757.helpService;
         });
         osgi.injectService(BattleGUIService,function(param1:Object):void
         {
            Renamed2757.Renamed4729 = BattleGUIService(param1);
         },function():BattleGUIService
         {
            return Renamed2757.Renamed4729;
         });
         osgi.injectService(BattleFormatUtil,function(param1:Object):void
         {
            Renamed2757.Renamed1588 = BattleFormatUtil(param1);
         },function():BattleFormatUtil
         {
            return Renamed2757.Renamed1588;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2757.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2757.display;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            Renamed2407.logService = LogService(param1);
         },function():LogService
         {
            return Renamed2407.logService;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed2407.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed2407.settingsService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2407.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2407.battleEventDispatcher;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2407.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2407.display;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2407.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2407.battleService;
         });
         osgi.injectService(BattleUserInfoService,function(param1:Object):void
         {
            Renamed2407.battleUserInfoService = BattleUserInfoService(param1);
         },function():BattleUserInfoService
         {
            return Renamed2407.battleUserInfoService;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            Renamed2407.modelRegistry = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return Renamed2407.modelRegistry;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed2407.Renamed2775 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed2407.Renamed2775;
         });
         osgi.injectService(IInitialEffectsService,function(param1:Object):void
         {
            Renamed2407.Renamed2776 = IInitialEffectsService(param1);
         },function():IInitialEffectsService
         {
            return Renamed2407.Renamed2776;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed2407.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed2407.battleInfoService;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed4715.Renamed2775 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed4715.Renamed2775;
         });
         osgi.injectService(PingService,function(param1:Object):void
         {
            Renamed28.Renamed4731 = PingService(param1);
         },function():PingService
         {
            return Renamed28.Renamed4731;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2867.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2867.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed69.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed69.battleService;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed917.Renamed1233 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed917.Renamed1233;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed917.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed917.battleService;
         });
         osgi.injectService(BattleReadinessService,function(param1:Object):void
         {
            Renamed2758.Renamed2422 = BattleReadinessService(param1);
         },function():BattleReadinessService
         {
            return Renamed2758.Renamed2422;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2758.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2758.battleEventDispatcher;
         });
         osgi.injectService(TankUsersRegistry,function(param1:Object):void
         {
            Renamed42.Renamed2775 = TankUsersRegistry(param1);
         },function():TankUsersRegistry
         {
            return Renamed42.Renamed2775;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed2745.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed2745.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed46.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed46.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4584.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4584.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4583.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4583.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed4585.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed4585.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3433.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3433.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3418.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3418.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3418.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3418.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed75.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed75.battleEventDispatcher;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4578.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4578.battleService;
         });
         osgi.injectService(ILightingEffectsService,function(param1:Object):void
         {
            Renamed4578.Renamed4730 = ILightingEffectsService(param1);
         },function():ILightingEffectsService
         {
            return Renamed4578.Renamed4730;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4577.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4577.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4700.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4700.battleService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed4581.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed4581.battleInfoService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4581.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4581.battleService;
         });
         osgi.injectService(TextureMaterialRegistry,function(param1:Object):void
         {
            Renamed4581.Renamed1368 = TextureMaterialRegistry(param1);
         },function():TextureMaterialRegistry
         {
            return Renamed4581.Renamed1368;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4581.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4581.battleEventDispatcher;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4581.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4581.localeService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4581.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4581.display;
         });
         osgi.injectService(BattleUserInfoService,function(param1:Object):void
         {
            Renamed4581.userInfoService = BattleUserInfoService(param1);
         },function():BattleUserInfoService
         {
            return Renamed4581.userInfoService;
         });
         osgi.injectService(BattleInputService,function(param1:Object):void
         {
            Renamed4581.Renamed2384 = BattleInputService(param1);
         },function():BattleInputService
         {
            return Renamed4581.Renamed2384;
         });
         osgi.injectService(ILightingEffectsService,function(param1:Object):void
         {
            Renamed4581.Renamed4730 = ILightingEffectsService(param1);
         },function():ILightingEffectsService
         {
            return Renamed4581.Renamed4730;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed4581.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed4581.Renamed719;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            Renamed2409.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return Renamed2409.dialogWindowsDispatcherService;
         });
         osgi.injectService(TargetingInputManager,function(param1:Object):void
         {
            Renamed2409.Renamed1499 = TargetingInputManager(param1);
         },function():TargetingInputManager
         {
            return Renamed2409.Renamed1499;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2382.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2382.display;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed2769.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed2769.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3076.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3076.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3081.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3081.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3106.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3106.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed44.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed44.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4720.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4720.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4693.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4693.battleService;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed3128.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed3128.battleService;
         });
         osgi.injectService(EffectsMaterialRegistry,function(param1:Object):void
         {
            Renamed3075.Renamed1368 = EffectsMaterialRegistry(param1);
         },function():EffectsMaterialRegistry
         {
            return Renamed3075.Renamed1368;
         });
         osgi.injectService(BattleService,function(param1:Object):void
         {
            Renamed4724.battleService = BattleService(param1);
         },function():BattleService
         {
            return Renamed4724.battleService;
         });
         osgi.injectService(BattleEventDispatcher,function(param1:Object):void
         {
            Renamed4690.battleEventDispatcher = BattleEventDispatcher(param1);
         },function():BattleEventDispatcher
         {
            return Renamed4690.battleEventDispatcher;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new Renamed4630(),Vector.<Class>([Renamed4573,ObjectLoadListener,ObjectLoadPostListener,ObjectUnloadListener,Renamed2524,Renamed4631,Renamed511]));
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new ChatModel(),Vector.<Class>([IChatModelBase,Renamed2566,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new Renamed4541(),Vector.<Class>([Renamed4663,Renamed4575,Renamed511,Renamed4576]));
         modelRegister.add(new Renamed40(),Vector.<Class>([Renamed4683,IObjectLoadListener,Renamed2616,Renamed511,Renamed4650]));
         modelRegister.add(new Renamed98(),Vector.<Class>([Renamed4569,ObjectLoadListener,ObjectLoadPostListener,ObjectUnloadListener,Renamed2616,Renamed511,Renamed4650]));
         modelRegister.add(new Renamed4615(),Vector.<Class>([Renamed4591,Renamed4618]));
         modelRegisterAdapt.registerAdapt(Renamed4618,Renamed4617);
         modelRegisterAdapt.registerEvents(Renamed4618,Renamed4616);
         modelRegister.add(new Renamed18(),Vector.<Class>([Renamed4612,Renamed4557,ObjectLoadListener,ObjectUnloadListener,Renamed511]));
         modelRegisterAdapt.registerAdapt(Renamed4557,Renamed4560);
         modelRegisterAdapt.registerEvents(Renamed4557,Renamed4559);
         modelRegister.add(new Renamed4702(),Vector.<Class>([Renamed4736,Renamed2414]));
         modelRegisterAdapt.registerAdapt(Renamed2414,Renamed4703);
         modelRegisterAdapt.registerEvents(Renamed2414,Renamed4704);
         modelRegister.add(new Renamed4682(),Vector.<Class>([Renamed4672,Renamed2767]));
         modelRegisterAdapt.registerAdapt(Renamed2767,Renamed4681);
         modelRegisterAdapt.registerEvents(Renamed2767,Renamed4680);
         modelRegisterAdapt.registerAdapt(Renamed4674,Renamed4675);
         modelRegisterAdapt.registerEvents(Renamed4674,Renamed4673);
         modelRegister.add(new Renamed4676(),Vector.<Class>([Renamed4606,ObjectLoadListener,ObjectUnloadListener,Renamed4674]));
         modelRegister.add(new Renamed4589(),Vector.<Class>([Renamed4658,ObjectLoadListener,Renamed3254]));
         modelRegisterAdapt.registerAdapt(Renamed3254,Renamed4590);
         modelRegisterAdapt.registerEvents(Renamed3254,Renamed4588);
         modelRegisterAdapt.registerAdapt(Renamed3255,Renamed4737);
         modelRegisterAdapt.registerEvents(Renamed3255,Renamed4599);
         modelRegister.add(new Renamed4600(),Vector.<Class>([Renamed4623,Renamed3255]));
         modelRegister.add(new Renamed62(),Vector.<Class>([Renamed4542,ObjectLoadListener]));
         modelRegister.add(new Renamed2417(),Vector.<Class>([Renamed2415,ObjectLoadListener,ObjectUnloadListener,BattleService]));
         modelRegisterAdapt.registerAdapt(Renamed4637,Renamed4638);
         modelRegisterAdapt.registerEvents(Renamed4637,Renamed4635);
         modelRegister.add(new Renamed4636(),Vector.<Class>([Renamed4646,Renamed4637]));
         modelRegister.add(new Renamed2411(),Vector.<Class>([Renamed4667,ObjectLoadListener,ObjectUnloadListener,Renamed2400]));
         modelRegisterAdapt.registerAdapt(Renamed2400,Renamed4537);
         modelRegisterAdapt.registerEvents(Renamed2400,Renamed4536);
         modelRegister.add(new Renamed4706(),Vector.<Class>([Renamed4613,Renamed511,Renamed2311]));
         modelRegisterAdapt.registerAdapt(Renamed2311,Renamed2310);
         modelRegisterAdapt.registerEvents(Renamed2311,Renamed2394);
         modelRegister.add(new Renamed30(),Vector.<Class>([Renamed4661,ObjectLoadPostListener,ObjectUnloadListener,Renamed511,Renamed2524]));
         modelRegister.add(new Renamed38(),Vector.<Class>([Renamed4597,ObjectLoadPostListener,ObjectUnloadListener,Renamed2524]));
         modelRegister.add(new Renamed2766(),Vector.<Class>([Renamed4620,Renamed4575]));
         modelRegisterAdapt.registerAdapt(Renamed2741,Renamed4539);
         modelRegisterAdapt.registerEvents(Renamed2741,Renamed4538);
         modelRegister.add(new Renamed4639(),Vector.<Class>([Renamed4707,ObjectLoadListener,ObjectLoadPostListener,ObjectUnloadListener,Renamed4642,Renamed2741,Renamed511]));
         modelRegisterAdapt.registerAdapt(Renamed4711,Renamed4714);
         modelRegisterAdapt.registerEvents(Renamed4711,Renamed4713);
         modelRegister.add(new Renamed88(),Vector.<Class>([Renamed4677,ObjectLoadListener,ObjectUnloadListener,IDumper,Renamed511,Renamed4710,Renamed4711]));
         modelRegister.add(new Renamed2407(),Vector.<Class>([Renamed2743,ObjectLoadListener,ObjectUnloadListener,Renamed2408,Renamed2774,Renamed511,Renamed2754]));
         modelRegister.add(new Renamed2757(),Vector.<Class>([Renamed4214,Renamed4654,ObjectLoadListener,ObjectLoadPostListener,ObjectUnloadListener,Renamed2553,Renamed768]));
         modelRegister.add(new Renamed69(),Vector.<Class>([Renamed4566]));
         modelRegister.add(new Renamed42(),Vector.<Class>([Renamed4564]));
         modelRegisterAdapt.registerAdapt(Renamed508,Renamed4601);
         modelRegisterAdapt.registerEvents(Renamed508,Renamed4602);
         modelRegister.add(new Renamed509(),Vector.<Class>([Renamed4708,Renamed508,Renamed4575]));
         modelRegister.add(new Renamed28(),Vector.<Class>([Renamed4587]));
         modelRegister.add(new Renamed4678(),Vector.<Class>([Renamed4625]));
         modelRegister.add(new Renamed2745(),Vector.<Class>([Renamed2752,Renamed4575]));
         modelRegister.add(new Renamed47(),Vector.<Class>([Renamed22,Renamed43,Renamed3480,Renamed511]));
         modelRegister.add(new Renamed51(),Vector.<Class>([Renamed83,Renamed511,Renamed43,Renamed4657,ObjectLoadListener]));
         modelRegister.add(new Renamed20(),Vector.<Class>([Renamed53,Renamed43,Renamed511,Renamed4570]));
         modelRegister.add(new Renamed73(),Vector.<Class>([Renamed32,Renamed43,Renamed4684,ObjectLoadListener,Renamed511]));
         modelRegister.add(new Renamed57(),Vector.<Class>([Renamed11,ObjectLoadListener,Renamed43,Renamed511,Renamed4660]));
         modelRegister.add(new Renamed45(),Vector.<Class>([Renamed95,Renamed43,Renamed3153,Renamed511,Renamed3149,ObjectLoadListener]));
         modelRegister.add(new Renamed49(),Vector.<Class>([Renamed14,ObjectLoadListener,Renamed43,Renamed4684,Renamed511]));
         modelRegister.add(new Renamed46(),Vector.<Class>([Renamed36,Renamed43,Renamed3436]));
         modelRegister.add(new Renamed64(),Vector.<Class>([Renamed93,ObjectLoadListener,Renamed43,Renamed4671,Renamed511]));
         modelRegister.add(new Renamed71(),Vector.<Class>([Renamed67,ObjectLoadListener,Renamed43,Renamed4688,Renamed511]));
         modelRegister.add(new Renamed4621(),Vector.<Class>([Renamed4716,Renamed3043,ObjectLoadListener]));
         modelRegister.add(new Renamed4551(),Vector.<Class>([Renamed4664,ObjectLoadListener,ObjectUnloadListener,Renamed4552]));
         modelRegister.add(new Renamed4641(),Vector.<Class>([Renamed4572,ObjectUnloadListener,ObjectLoadListener,Renamed4640]));
         modelRegisterAdapt.registerAdapt(Renamed3436,Renamed4696);
         modelRegisterAdapt.registerEvents(Renamed3436,Renamed4699);
         modelRegister.add(new Renamed75(),Vector.<Class>([Renamed4665,Renamed76]));
         modelRegisterAdapt.registerAdapt(Renamed76,Renamed4698);
         modelRegisterAdapt.registerEvents(Renamed76,Renamed4697);
         modelRegisterAdapt.registerAdapt(Renamed4580,Renamed4582);
         modelRegisterAdapt.registerEvents(Renamed4580,Renamed4579);
         modelRegister.add(new Renamed4581(),Vector.<Class>([Renamed4595,ObjectLoadPostListener,ObjectUnloadListener,Renamed511,Renamed2524,Renamed4580]));
         modelRegister.add(new Renamed81(),Vector.<Class>([Renamed80,Renamed4701]));
         modelRegister.add(new Renamed44(),Vector.<Class>([Renamed3121,Renamed4691,Renamed43]));
         modelRegister.add(new Renamed4721(),Vector.<Class>([Renamed4634,Renamed3122,ObjectLoadPostListener]));
         modelRegisterAdapt.registerAdapt(Renamed3122,Renamed4723);
         modelRegisterAdapt.registerEvents(Renamed3122,Renamed4722);
         modelRegisterAdapt.registerAdapt(Renamed3074,Renamed4692);
         modelRegisterAdapt.registerEvents(Renamed3074,Renamed4689);
         modelRegister.add(new Renamed4690(),Vector.<Class>([undefined,Renamed3074]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

