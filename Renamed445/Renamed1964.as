package Renamed445
{
   import Renamed1959.Renamed5289;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.Renamed2069;
   import base.DiscreteSprite;
   import controls.Slider;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.containers.Renamed2259;
   import forms.events.SliderEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   
   public class Renamed1964 extends Renamed5289
   {
      [Inject]
      public static var Renamed3844:FullscreenService;
      
      [Inject]
      public static var display:IDisplay;
      
      public static const Renamed8956:int = 1;
      
      public static const Renamed8957:int = 20;
      
      private var mouseSensitivity:Slider;
      
      public function Renamed1964()
      {
         super();
         var _loc1_:TankWindowInner = new TankWindowInner(SettingsWindow.Renamed1967,SettingsWindow.Renamed1965,TankWindowInner.TRANSPARENT);
         addChildAt(_loc1_,0);
         var _loc2_:Renamed2259 = new Renamed2259();
         _loc2_.Renamed1987(MARGIN);
         _loc2_.x = MARGIN;
         _loc2_.y = Renamed5290;
         if(!Renamed3844.isMouseLockDisabled())
         {
            _loc2_.addItem(this.Renamed8958());
         }
         _loc2_.addItem(createCheckBox(Renamed2069.Renamed3738,localeService.getText(TanksLocale.TEXT_SETTINGS_INVERSE_TURN_CONTROL_CHECKBOX_LABEL_TEXT),settingsService.inverseBackDriving));
         _loc2_.addItem(new Renamed4824());
         addItem(_loc2_);
      }
      
      private function Renamed8958() : DiscreteSprite
      {
         var _loc1_:Renamed2259 = new Renamed2259();
         _loc1_.Renamed1987(MARGIN);
         _loc1_.addItem(createCheckBox(Renamed2069.Renamed3751,localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_CONTROL_CHECKBOX),settingsService.mouseControl));
         _loc1_.addItem(this.Renamed8959());
         _loc1_.addItem(createCheckBox(Renamed2069.Renamed3753,localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_INVERSION_CHECKBOX_LABEL),settingsService.mouseYInverse));
         _loc1_.addItem(createCheckBox(Renamed2069.Renamed3754,localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_SHAFT_SCOPE_VERTICAL_INVERSION),settingsService.mouseYInverseShaftAim));
         return _loc1_;
      }
      
      private function Renamed8959() : DiscreteSprite
      {
         var _loc1_:DiscreteSprite = null;
         _loc1_ = new DiscreteSprite();
         var _loc2_:LabelBase = new LabelBase();
         _loc2_.text = localeService.getText(TanksLocale.TEXT_SETTINGS_MOUSE_SENSITIVITY_CHECKBOX_LABEL) + ":";
         _loc1_.addChild(_loc2_);
         this.mouseSensitivity = new Slider();
         this.mouseSensitivity.maxValue = Renamed8957;
         this.mouseSensitivity.minValue = Renamed8956;
         this.mouseSensitivity.tickInterval = 1;
         this.mouseSensitivity.width = SettingsWindow.Renamed1967 - MARGIN * 4 - _loc2_.width;
         this.mouseSensitivity.x = _loc2_.width + MARGIN;
         this.mouseSensitivity.value = settingsService.mouseSensitivity;
         this.mouseSensitivity.addEventListener(SliderEvent.CHANGE_VALUE,this.Renamed8960);
         _loc2_.y = Math.round((this.mouseSensitivity.height - _loc2_.textHeight) * 0.5) - 2;
         _loc1_.addChild(this.mouseSensitivity);
         return _loc1_;
      }
      
      private function Renamed8960(param1:SliderEvent) : void
      {
         settingsService.Renamed3726(Renamed2069.Renamed3752,this.mouseSensitivity.value);
      }
      
      override public function destroy() : void
      {
         if(!Renamed3844.isMouseLockDisabled())
         {
            this.mouseSensitivity.removeEventListener(SliderEvent.CHANGE_VALUE,this.Renamed8960);
         }
         super.destroy();
      }
   }
}

