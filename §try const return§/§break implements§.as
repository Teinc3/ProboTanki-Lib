package §try const return§
{
   import §"f§.§'"[§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.§[!;§;
   import base.DiscreteSprite;
   import controls.Slider;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.containers.§throw catch final§;
   import forms.events.SliderEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   
   public class §break implements§ extends §'"[§
   {
      [Inject]
      public static var §in package continue§:FullscreenService;
      
      [Inject]
      public static var display:IDisplay;
      
      public static const §native set package§:int = 1;
      
      public static const §;#M§:int = 20;
      
      private var mouseSensitivity:Slider;
      
      public function §break implements§()
      {
         super();
         var _loc1_:TankWindowInner = new TankWindowInner(SettingsWindow.§each package null§,SettingsWindow.§7E§,TankWindowInner.TRANSPARENT);
         addChildAt(_loc1_,0);
         var _loc2_:§throw catch final§ = new §throw catch final§();
         _loc2_.§!!t§(MARGIN);
         _loc2_.x = MARGIN;
         _loc2_.y = §include set const§;
         if(!§in package continue§.isMouseLockDisabled())
         {
            _loc2_.addItem(this.§extends for use§());
         }
         _loc2_.addItem(createCheckBox(§[!;§.§dynamic package continue§,localeService.getText(TanksLocale.TEXT_SETTINGS_INVERSE_TURN_CONTROL_CHECKBOX_LABEL_TEXT),settingsService.inverseBackDriving));
         _loc2_.addItem(new §native const get§());
         addItem(_loc2_);
      }
      
      private function §extends for use§() : DiscreteSprite
      {
         var _loc1_:§throw catch final§ = new §throw catch final§();
         _loc1_.§!!t§(MARGIN);
         _loc1_.addItem(createCheckBox(§[!;§.§0$#§,localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_CONTROL_CHECKBOX),settingsService.mouseControl));
         _loc1_.addItem(this.§override const use§());
         _loc1_.addItem(createCheckBox(§[!;§.§true for each§,localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_INVERSION_CHECKBOX_LABEL),settingsService.mouseYInverse));
         _loc1_.addItem(createCheckBox(§[!;§.§,#_§,localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_SHAFT_SCOPE_VERTICAL_INVERSION),settingsService.mouseYInverseShaftAim));
         return _loc1_;
      }
      
      private function §override const use§() : DiscreteSprite
      {
         var _loc1_:DiscreteSprite = null;
         _loc1_ = new DiscreteSprite();
         var _loc2_:LabelBase = new LabelBase();
         _loc2_.text = localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_SENSITIVITY_CHECKBOX_LABEL) + ":";
         _loc1_.addChild(_loc2_);
         this.mouseSensitivity = new Slider();
         this.mouseSensitivity.maxValue = §;#M§;
         this.mouseSensitivity.minValue = §native set package§;
         this.mouseSensitivity.tickInterval = 1;
         this.mouseSensitivity.width = SettingsWindow.§each package null§ - MARGIN * 4 - _loc2_.width;
         this.mouseSensitivity.x = _loc2_.width + MARGIN;
         this.mouseSensitivity.value = settingsService.mouseSensitivity;
         this.mouseSensitivity.addEventListener(SliderEvent.CHANGE_VALUE,this.§catch true§);
         _loc2_.y = Math.round((this.mouseSensitivity.height - _loc2_.textHeight) * 0.5) - 2;
         _loc1_.addChild(this.mouseSensitivity);
         return _loc1_;
      }
      
      private function §catch true§(param1:SliderEvent) : void
      {
         settingsService.§for function§(§[!;§.§catch default§,this.mouseSensitivity.value);
      }
      
      override public function destroy() : void
      {
         if(!§in package continue§.isMouseLockDisabled())
         {
            this.mouseSensitivity.removeEventListener(SliderEvent.CHANGE_VALUE,this.§catch true§);
         }
         super.destroy();
      }
   }
}

