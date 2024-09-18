package alternativa.init
{
   import §7!8§.§<c§;
   import §7!8§.§continue var static§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.battle.events.§<# §;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.objects.tank.skintexturesregistry.§8!a§;
   import alternativa.tanks.battle.objects.tank.skintexturesregistry.TankSkinTextureRegistry;
   import alternativa.tanks.battle.objects.tank.tankskin.§<"t§;
   import alternativa.tanks.engine3d.§,!s§;
   import alternativa.tanks.engine3d.§<p§;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.§`#c§;
   import alternativa.tanks.engine3d.§case for extends§;
   import alternativa.tanks.engine3d.§get const super§;
   import alternativa.tanks.engine3d.§package var else§;
   import alternativa.tanks.engine3d.§with set try§;
   import alternativa.tanks.models.battle.battlefield.§4#t§;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battlegui.§continue for else§;
   import alternativa.tanks.services.battleinput.§@"u§;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import alternativa.tanks.services.battlereadiness.§case each§;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.initialeffects.§;!;§;
   import alternativa.tanks.services.initialeffects.IInitialEffectsService;
   import alternativa.tanks.services.lightingeffects.§,"D§;
   import alternativa.tanks.services.lightingeffects.ILightingEffectsService;
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.tanks.services.ping.PingService;
   import alternativa.tanks.services.ping.§override package set§;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.tanks.services.spectatorservice.§extends if§;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.tanks.services.tankregistry.§super const import§;
   import alternativa.tanks.services.targeting.§+"S§;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.services.targeting.§continue for const§;
   import alternativa.tanks.utils.DataValidator;
   import alternativa.tanks.utils.DataValidatorImpl;
   import alternativa.utils.TextureMaterialRegistry;
   import §default set implements§.§!s§;
   import §default set implements§.§^o§;
   import §dynamic package catch§.§super for override§;
   import §final for while§.§if set var§;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import scpacker.networking.protocol.§?"s§;
   
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
         param1.registerService(IInitialEffectsService,new §;!;§());
         param1.registerService(BattleEventDispatcher,new §<# §());
         param1.registerService(BattleGUIService,new §continue for else§());
         param1.registerService(PingService,new §override package set§());
         param1.registerService(ILightingEffectsService,new §,"D§());
         param1.registerService(§<c§,new §continue var static§());
         param1.registerService(TankUsersRegistry,new §super const import§());
         param1.registerService(BattleReadinessService,new §case each§());
         param1.registerService(BattleInputService,new §@"u§());
         param1.registerService(SpectatorService,new §extends if§());
         param1.registerService(TargetingInputManager,new §+"S§());
         param1.registerService(TargetingModeService,new §continue for const§());
         this.registerMipMappingService();
         this.registerColorTransformService();
         this.registerColorCorrectedTextureService();
         this.registerEffectsMaterialService();
         this.registerTextureMaterialService();
         this.§each var dynamic§();
         param1.registerService(DataValidator,new DataValidatorImpl(param1));
      }
      
      private function registerMipMappingService() : void
      {
         this.osgi.registerService(MipMappingService,new §super for override§());
      }
      
      private function registerColorTransformService() : void
      {
         if(!GPUCapabilities.gpuEnabled || GPUCapabilities.constrained)
         {
            this.osgi.registerService(ColorTransformService,new §!s§());
         }
         else
         {
            this.osgi.registerService(ColorTransformService,new §^o§());
         }
      }
      
      private function registerColorCorrectedTextureService() : void
      {
         var _loc1_:§package var else§ = new §<p§();
         this.osgi.registerService(§package var else§,_loc1_);
         this.registerBattleEventListener(§4#t§,new §get const super§(_loc1_));
         var _loc2_:ColorTransformService = ColorTransformService(this.osgi.getService(ColorTransformService));
         _loc2_.§!# §(_loc1_);
      }
      
      private function registerEffectsMaterialService() : void
      {
         var _loc1_:§case for extends§ = new §case for extends§();
         this.osgi.registerService(EffectsMaterialRegistry,_loc1_);
         this.enableMipMappingControl(_loc1_);
         this.registerBattleEventListener(§4#t§,new §,!s§(_loc1_));
      }
      
      private function registerTextureMaterialService() : void
      {
         var _loc1_:§package var else§ = §package var else§(this.osgi.getService(§package var else§));
         var _loc2_:§`#c§ = new §`#c§(new §with set try§(),_loc1_);
         this.osgi.registerService(TextureMaterialRegistry,_loc2_);
         this.enableMipMappingControl(_loc2_);
         this.registerBattleEventListener(§4#t§,new §,!s§(_loc2_));
      }
      
      private function §each var dynamic§() : void
      {
         var _loc1_:TankSkinTextureRegistry = new §8!a§();
         this.osgi.registerService(TankSkinTextureRegistry,_loc1_);
         this.registerBattleEventListener(§4#t§,new §<"t§(_loc1_));
      }
      
      private function registerBattleEventListener(param1:Class, param2:§throw package continue§) : void
      {
         var _loc3_:BattleEventDispatcher = BattleEventDispatcher(this.osgi.getService(BattleEventDispatcher));
         _loc3_.§set for each§(param1,param2);
      }
      
      private function enableMipMappingControl(param1:TextureMaterialRegistry) : void
      {
         var _loc2_:MipMappingService = MipMappingService(this.osgi.getService(MipMappingService));
         _loc2_.§dynamic var extends§(param1);
      }
      
      private function §false set if§() : void
      {
         var _loc1_:§?"s§ = §?"s§(this.osgi.getService(§?"s§));
         _loc1_.registerCodecForType(new §if set var§());
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

