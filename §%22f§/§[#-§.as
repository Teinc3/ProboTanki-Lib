package §"f§
{
   import §1!J§.GridLayout;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.§[!;§;
   import controls.TankWindowInner;
   import controls.checkbox.§while var import§;
   import flash.events.MouseEvent;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §[#-§ extends §with for import§
   {
      private var performanceInner:TankWindowInner;
      
      private var cbShowFPS:§while var import§;
      
      private var cbAdaptiveFPS:§while var import§;
      
      private var cbShowSkyBox:§while var import§;
      
      private var cbAntialiasing:§while var import§;
      
      private var cbDynamicLighting:§while var import§;
      
      private var cbMipMapping:§while var import§;
      
      private var cbFog:§while var import§;
      
      private var cbTankShadow:§while var import§;
      
      private var cbDynamicShadows:§while var import§;
      
      private var cbSoftParticles:§while var import§;
      
      private var cbDust:§while var import§;
      
      private var cbSSAO:§while var import§;
      
      private var cbGraphicsAutoQuality:§while var import§;
      
      public function §[#-§()
      {
         var _loc1_:int = 0;
         super();
         this.performanceInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         this.performanceInner.width = SettingsWindow.§each package null§;
         this.performanceInner.x = this.performanceInner.y = 0;
         addChild(this.performanceInner);
         this.cbShowFPS = createCheckBox(§[!;§.§<!r§,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_FPS_CHECKBOX),settingsService.showFPS);
         addChild(this.cbShowFPS);
         this.cbAdaptiveFPS = createCheckBox(§[!;§.§each package implements§,localeService.getText(TanksLocale.TEXT_SETTINGS_ENABLE_ADAPTIVE_FPS_CHECKBOX_LABEL_TEXT),settingsService.adaptiveFPS);
         addChild(this.cbAdaptiveFPS);
         this.cbShowSkyBox = createCheckBox(§[!;§.§2!_§,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_SKYBOX_CHECKBOX_LABEL_TEXT),settingsService.showSkyBox);
         addChild(this.cbShowSkyBox);
         this.cbMipMapping = createCheckBox(§[!;§.§set for false§,localeService.getText(TanksLocale.TEXT_SETTINGS_MIPMAPPING_LABEL_TEXT),settingsService.mipMapping);
         addChild(this.cbMipMapping);
         var _loc2_:GridLayout = new GridLayout(MARGIN,MARGIN,SettingsWindow.§each package null§ * 0.5,this.cbShowFPS.height + MARGIN);
         if(this.§import catch catch§())
         {
            this.cbFog = createCheckBox(§[!;§.FOG,localeService.getText(TanksLocale.TEXT_SETTINGS_FOG_LABEL_TEXT),settingsService.fog);
            addChild(this.cbFog);
            this.cbTankShadow = createCheckBox(§[!;§.§"$#§,localeService.getText(TanksLocale.TEXT_SETTINGS_SHADOWS_LABEL_TEXT),settingsService.shadows);
            addChild(this.cbTankShadow);
            this.cbDynamicShadows = createCheckBox(§[!;§.§]w§,localeService.getText(TanksLocale.TEXT_SETTINGS_DYNAMIC_SHADOWS_LABEL_TEXT),settingsService.dynamicShadows);
            addChild(this.cbDynamicShadows);
            this.cbSoftParticles = createCheckBox(§[!;§.§`&§,localeService.getText(TanksLocale.TEXT_SETTINGS_SOFT_PARTICLES_LABEL_TEXT),settingsService.§catch package throw§);
            addChild(this.cbSoftParticles);
            this.cbSoftParticles.addEventListener(MouseEvent.CLICK,this.onSoftParticlesClick);
            this.cbDust = createCheckBox(§[!;§.§%S§,localeService.getText(TanksLocale.TEXT_SETTINGS_DUST_LABEL_TEXT),settingsService.dust);
            addChild(this.cbDust);
            this.cbSSAO = createCheckBox(§[!;§.SSAO,localeService.getText(TanksLocale.TEXT_SETTINGS_SSAO),settingsService.ssao);
            addChild(this.cbSSAO);
            this.cbAntialiasing = createCheckBox(§[!;§.§;5§,localeService.getText(TanksLocale.TEXT_SETTINGS_ANTIALIASING),settingsService.antialiasing);
            addChild(this.cbAntialiasing);
            this.cbDynamicLighting = createCheckBox(§[!;§.§get for dynamic§,localeService.getText(TanksLocale.TEXT_SETTINGS_DYNAMIC_LIGHTING),settingsService.dynamicLighting);
            addChild(this.cbDynamicLighting);
            this.createGraphicsAutoQualityCheckBox();
            _loc1_ = this.layoutPerformanceFull(_loc2_);
            if(this.cbGraphicsAutoQuality.§ !w§)
            {
               _loc1_ = this.cbGraphicsAutoQuality.y + this.cbGraphicsAutoQuality.height;
            }
         }
         else
         {
            _loc1_ = this.layoutPerformanceConstrained(_loc2_);
         }
         this.performanceInner.height = _loc1_ + MARGIN;
      }
      
      private function §import catch catch§() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained;
      }
      
      private function onSoftParticlesClick(param1:MouseEvent) : void
      {
         this.checkDustAvailable();
      }
      
      private function checkDustAvailable() : void
      {
         this.cbDust.visible = Boolean(this.cbSoftParticles) && !this.cbGraphicsAutoQuality.§ !w§ && this.cbSoftParticles.§ !w§;
      }
      
      private function createGraphicsAutoQualityCheckBox() : void
      {
         this.cbGraphicsAutoQuality = createCheckBox(§[!;§.§finally var set§,localeService.getText(TanksLocale.TEXT_SETTINGS_GRAPHICS_AUTO_QUALITY),settingsService.graphicsAutoQuality);
         addChild(this.cbGraphicsAutoQuality);
         this.onGraphicsAutQualityClick();
         this.cbGraphicsAutoQuality.addEventListener(MouseEvent.CLICK,this.onGraphicsAutQualityClick);
      }
      
      private function onGraphicsAutQualityClick(param1:MouseEvent = null) : void
      {
         var _loc2_:* = !this.cbGraphicsAutoQuality.§ !w§;
         this.cbFog.visible = _loc2_;
         this.cbTankShadow.visible = _loc2_;
         this.cbDynamicShadows.visible = _loc2_;
         this.cbSoftParticles.visible = _loc2_;
         this.cbSSAO.visible = _loc2_;
         this.cbDynamicLighting.visible = _loc2_;
         this.cbAntialiasing.visible = _loc2_;
         this.performanceInner.height = _loc2_ ? Number(7 * this.cbShowFPS.height + 8 * MARGIN) : Number(3 * this.cbShowFPS.height + 4 * MARGIN);
         this.checkDustAvailable();
      }
      
      private function layoutPerformanceConstrained(param1:GridLayout) : int
      {
         return param1.layout([[this.cbShowFPS,this.cbAdaptiveFPS],[this.cbShowSkyBox,this.cbMipMapping]]);
      }
      
      private function layoutPerformanceFull(param1:GridLayout) : int
      {
         return param1.layout([[this.cbShowFPS,this.cbAdaptiveFPS],[this.cbShowSkyBox,this.cbMipMapping],[this.cbGraphicsAutoQuality],[this.cbDynamicShadows,this.cbSSAO],[this.cbDynamicLighting,this.cbFog],[this.cbTankShadow,this.cbAntialiasing],[this.cbSoftParticles,this.cbDust]]);
      }
      
      override public function destroy() : void
      {
         if(this.§import catch catch§())
         {
            this.cbGraphicsAutoQuality.removeEventListener(MouseEvent.CLICK,this.onGraphicsAutQualityClick);
            this.cbSoftParticles.removeEventListener(MouseEvent.CLICK,this.onSoftParticlesClick);
         }
         super.destroy();
      }
   }
}

