package alternativa.init
{
   import Renamed264.Renamed508;
   import Renamed264.Renamed509;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.battle.events.Renamed510;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.objects.tank.skintexturesregistry.Renamed512;
   import alternativa.tanks.battle.objects.tank.skintexturesregistry.TankSkinTextureRegistry;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed513;
   import alternativa.tanks.engine3d.Renamed514;
   import alternativa.tanks.engine3d.Renamed515;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.Renamed516;
   import alternativa.tanks.engine3d.Renamed517;
   import alternativa.tanks.engine3d.Renamed518;
   import alternativa.tanks.engine3d.Renamed519;
   import alternativa.tanks.engine3d.Renamed520;
   import alternativa.tanks.models.battle.battlefield.Renamed521;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battlegui.Renamed522;
   import alternativa.tanks.services.battleinput.Renamed523;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import alternativa.tanks.services.battlereadiness.Renamed524;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.initialeffects.Renamed525;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.lightingeffects.Renamed526;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.tanks.services.ping.PingService;
   import alternativa.tanks.services.ping.Renamed527;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.tanks.services.spectatorservice.Renamed528;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.tanks.services.tankregistry.Renamed529;
   import alternativa.tanks.services.targeting.Renamed530;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.services.targeting.Renamed531;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.tanks.utils.DataValidatorImpl;
   import alternativa.utils.TextureMaterialRegistry;
   import Renamed340.Renamed532;
   import Renamed340.Renamed533;
   import Renamed343.Renamed534;
   import Renamed360.Renamed535;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class BattlefieldModelActivator implements IBundleActivator
   {
      private var osgi:OSGi;
      
      public function BattlefieldModelActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         this.osgi = param1;
         param1.registerService(IInitialEffectsService,new Renamed525());
         param1.registerService(BattleEventDispatcher,new Renamed510());
         param1.registerService(BattleGUIService,new Renamed522());
         param1.registerService(PingService,new Renamed527());
         param1.registerService(ILightingEffectsService,new Renamed526());
         param1.registerService(Renamed508,new Renamed509());
         param1.registerService(TankUsersRegistry,new Renamed529());
         param1.registerService(BattleReadinessService,new Renamed524());
         param1.registerService(BattleInputService,new Renamed523());
         param1.registerService(SpectatorService,new Renamed528());
         param1.registerService(TargetingInputManager,new Renamed530());
         param1.registerService(TargetingModeService,new Renamed531());
         this.registerMipMappingService();
         this.registerColorTransformService();
         this.registerColorCorrectedTextureService();
         this.registerEffectsMaterialService();
         this.registerTextureMaterialService();
         this.Renamed537();
         param1.registerService(DataValidator,new DataValidatorImpl(param1));
      }
      
      private function registerMipMappingService() : void
      {
         this.osgi.registerService(MipMappingService,new Renamed534());
      }
      
      private function registerColorTransformService() : void
      {
         if(!GPUCapabilities.gpuEnabled || GPUCapabilities.constrained)
         {
            this.osgi.registerService(ColorTransformService,new Renamed532());
         }
         else
         {
            this.osgi.registerService(ColorTransformService,new Renamed533());
         }
      }
      
      private function registerColorCorrectedTextureService() : void
      {
         var _loc1_:Renamed519 = new Renamed515();
         this.osgi.registerService(Renamed519,_loc1_);
         this.registerBattleEventListener(Renamed521,new Renamed518(_loc1_));
         var _loc2_:ColorTransformService = ColorTransformService(this.osgi.getService(ColorTransformService));
         _loc2_.Renamed538(_loc1_);
      }
      
      private function registerEffectsMaterialService() : void
      {
         var _loc1_:Renamed517 = new Renamed517();
         this.osgi.registerService(EffectsMaterialRegistry,_loc1_);
         this.enableMipMappingControl(_loc1_);
         this.registerBattleEventListener(Renamed521,new Renamed514(_loc1_));
      }
      
      private function registerTextureMaterialService() : void
      {
         var _loc1_:Renamed519 = Renamed519(this.osgi.getService(Renamed519));
         var _loc2_:Renamed516 = new Renamed516(new Renamed520(),_loc1_);
         this.osgi.registerService(TextureMaterialRegistry,_loc2_);
         this.enableMipMappingControl(_loc2_);
         this.registerBattleEventListener(Renamed521,new Renamed514(_loc2_));
      }
      
      private function Renamed537() : void
      {
         var _loc1_:TankSkinTextureRegistry = new Renamed512();
         this.osgi.registerService(TankSkinTextureRegistry,_loc1_);
         this.registerBattleEventListener(Renamed521,new Renamed513(_loc1_));
      }
      
      private function registerBattleEventListener(param1:Class, param2:Renamed511) : void
      {
         var _loc3_:BattleEventDispatcher = BattleEventDispatcher(this.osgi.getService(BattleEventDispatcher));
         _loc3_.Renamed539(param1,param2);
      }
      
      private function enableMipMappingControl(param1:TextureMaterialRegistry) : void
      {
         var _loc2_:MipMappingService = MipMappingService(this.osgi.getService(MipMappingService));
         _loc2_.Renamed540(param1);
      }
      
      private function Renamed541() : void
      {
         var _loc1_:CodecRegisterer = CodecRegisterer(this.osgi.getService(CodecRegisterer));
         _loc1_.registerCodecForType(new Renamed535());
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

