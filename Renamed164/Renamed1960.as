package Renamed1959
{
   import Renamed231.GridLayout;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.Renamed2069;
   import controls.TankWindowInner;
   import controls.checkbox.Renamed3902;
   import flash.events.MouseEvent;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed1960 extends Renamed1961
   {
      private var performanceInner:TankWindowInner;
      
      private var cbShowFPS:Renamed3902;
      
      private var cbAdaptiveFPS:Renamed3902;
      
      private var cbShowSkyBox:Renamed3902;
      
      private var cbAntialiasing:Renamed3902;
      
      private var cbDynamicLighting:Renamed3902;
      
      private var cbMipMapping:Renamed3902;
      
      private var cbFog:Renamed3902;
      
      private var cbTankShadow:Renamed3902;
      
      private var cbDynamicShadows:Renamed3902;
      
      private var cbSoftParticles:Renamed3902;
      
      private var cbDust:Renamed3902;
      
      private var cbSSAO:Renamed3902;
      
      private var cbGraphicsAutoQuality:Renamed3902;
      
      public function Renamed1960()
      {
         var _loc1_:int = 0;
         super();
         this.performanceInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         this.performanceInner.width = SettingsWindow.Renamed1967;
         this.performanceInner.x = this.performanceInner.y = 0;
         addChild(this.performanceInner);
         this.cbShowFPS = createCheckBox(Renamed2069.Renamed3734,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_FPS_CHECKBOX),settingsService.showFPS);
         addChild(this.cbShowFPS);
         this.cbAdaptiveFPS = createCheckBox(Renamed2069.Renamed3737,localeService.getText(TanksLocale.TEXT_SETTINGS_ENABLE_ADAPTIVE_FPS_CHECKBOX_LABEL_TEXT),settingsService.adaptiveFPS);
         addChild(this.cbAdaptiveFPS);
         this.cbShowSkyBox = createCheckBox(Renamed2069.Renamed3733,localeService.getText(TanksLocale.TEXT_SETTINGS_SHOW_SKYBOX_CHECKBOX_LABEL_TEXT),settingsService.showSkyBox);
         addChild(this.cbShowSkyBox);
         this.cbMipMapping = createCheckBox(Renamed2069.Renamed3735,localeService.getText(TanksLocale.TEXT_SETTINGS_MIPMAPPING_LABEL_TEXT),settingsService.mipMapping);
         addChild(this.cbMipMapping);
         var _loc2_:GridLayout = new GridLayout(MARGIN,MARGIN,SettingsWindow.Renamed1967 * 0.5,this.cbShowFPS.height + MARGIN);
         if(this.Renamed5308())
         {
            this.cbFog = createCheckBox(Renamed2069.FOG,localeService.getText(TanksLocale.TEXT_SETTINGS_FOG_LABEL_TEXT),settingsService.fog);
            addChild(this.cbFog);
            this.cbTankShadow = createCheckBox(Renamed2069.Renamed3741,localeService.getText(TanksLocale.TEXT_SETTINGS_SHADOWS_LABEL_TEXT),settingsService.shadows);
            addChild(this.cbTankShadow);
            this.cbDynamicShadows = createCheckBox(Renamed2069.Renamed3744,localeService.getText(TanksLocale.TEXT_SETTINGS_DYNAMIC_SHADOWS_LABEL_TEXT),settingsService.dynamicShadows);
            addChild(this.cbDynamicShadows);
            this.cbSoftParticles = createCheckBox(Renamed2069.Renamed3742,localeService.getText(TanksLocale.TEXT_SETTINGS_SOFT_PARTICLES_LABEL_TEXT),settingsService.Renamed2472);
            addChild(this.cbSoftParticles);
            this.cbSoftParticles.addEventListener(MouseEvent.CLICK,this.onSoftParticlesClick);
            this.cbDust = createCheckBox(Renamed2069.Renamed3743,localeService.getText(TanksLocale.TEXT_SETTINGS_DUST_LABEL_TEXT),settingsService.dust);
            addChild(this.cbDust);
            this.cbSSAO = createCheckBox(Renamed2069.SSAO,localeService.getText(TanksLocale.TEXT_SETTINGS_SSAO),settingsService.ssao);
            addChild(this.cbSSAO);
            this.cbAntialiasing = createCheckBox(Renamed2069.Renamed3746,localeService.getText(TanksLocale.TEXT_SETTINGS_ANTIALIASING),settingsService.antialiasing);
            addChild(this.cbAntialiasing);
            this.cbDynamicLighting = createCheckBox(Renamed2069.Renamed3745,localeService.getText(TanksLocale.TEXT_SETTINGS_DYNAMIC_LIGHTING),settingsService.dynamicLighting);
            addChild(this.cbDynamicLighting);
            this.createGraphicsAutoQualityCheckBox();
            _loc1_ = this.layoutPerformanceFull(_loc2_);
            if(this.cbGraphicsAutoQuality.Renamed1878)
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
      
      private function Renamed5308() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained;
      }
      
      private function onSoftParticlesClick(param1:MouseEvent) : void
      {
         this.checkDustAvailable();
      }
      
      private function checkDustAvailable() : void
      {
         this.cbDust.visible = Boolean(this.cbSoftParticles) && !this.cbGraphicsAutoQuality.Renamed1878 && this.cbSoftParticles.Renamed1878;
      }
      
      private function createGraphicsAutoQualityCheckBox() : void
      {
         this.cbGraphicsAutoQuality = createCheckBox(Renamed2069.Renamed3748,localeService.getText(TanksLocale.TEXT_SETTINGS_GRAPHICS_AUTO_QUALITY),settingsService.graphicsAutoQuality);
         addChild(this.cbGraphicsAutoQuality);
         this.onGraphicsAutQualityClick();
         this.cbGraphicsAutoQuality.addEventListener(MouseEvent.CLICK,this.onGraphicsAutQualityClick);
      }
      
      private function onGraphicsAutQualityClick(param1:MouseEvent = null) : void
      {
         var _loc2_:* = !this.cbGraphicsAutoQuality.Renamed1878;
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
         if(this.Renamed5308())
         {
            this.cbGraphicsAutoQuality.removeEventListener(MouseEvent.CLICK,this.onGraphicsAutQualityClick);
            this.cbSoftParticles.removeEventListener(MouseEvent.CLICK,this.onSoftParticlesClick);
         }
         super.destroy();
      }
   }
}

