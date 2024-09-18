package Renamed1959
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.service.settings.Renamed2069;
   import controls.Slider;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.checkbox.Renamed3902;
   import forms.events.SliderEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.Renamed3761;
   
   public class Renamed4797 extends Renamed1961
   {
      [Inject]
      public static var display:IDisplay;
      
      private var volumeLevel:Slider;
      
      private var bgSound:Renamed3902;
      
      public function Renamed4797()
      {
         var _loc1_:TankWindowInner = null;
         super();
         _loc1_ = new TankWindowInner(SettingsWindow.Renamed1967 - 7,0,TankWindowInner.TRANSPARENT);
         var _loc2_:LabelBase = new LabelBase();
         _loc1_.addChild(_loc2_);
         _loc2_.text = localeService.getText(TanksLocale.TEXT_SETTINGS_SOUND_VOLUME_LABEL_TEXT);
         _loc2_.x = MARGIN;
         this.volumeLevel = new Slider();
         this.volumeLevel.maxValue = 100;
         this.volumeLevel.minValue = 0;
         this.volumeLevel.tickInterval = 5;
         this.volumeLevel.x = _loc2_.x + _loc2_.textWidth + MARGIN;
         this.volumeLevel.y = MARGIN;
         this.volumeLevel.width = SettingsWindow.Renamed1967 - 2 * MARGIN - _loc2_.width - 8;
         if(localeService.language == Renamed3761.Renamed4529)
         {
            this.volumeLevel.width -= 4;
         }
         this.volume = settingsService.Renamed3722;
         this.volumeLevel.addEventListener(SliderEvent.CHANGE_VALUE,this.onChangeVolume);
         _loc1_.addChild(this.volumeLevel);
         this.bgSound = createCheckBox(Renamed2069.Renamed3739,localeService.getText(TanksLocale.TEXT_SETTINGS_BACKGROUND_SOUND_CHECKBOX_LABEL_TEXT),settingsService.bgSound,MARGIN,0);
         this.bgSound.x = MARGIN;
         this.bgSound.y = MARGIN + this.volumeLevel.y + this.volumeLevel.height;
         _loc1_.addChild(this.bgSound);
         _loc1_.height = MARGIN + this.bgSound.y + this.bgSound.height;
         _loc2_.y = this.volumeLevel.y + Math.round((this.volumeLevel.height - _loc2_.textHeight) * 0.5) - 2;
         addChild(_loc1_);
      }
      
      private function onChangeVolume(param1:SliderEvent) : void
      {
         settingsService.Renamed3722 = this.volume;
      }
      
      override public function hide() : void
      {
         super.hide();
      }
      
      public function Renamed5299() : Boolean
      {
         return this.bgSound.Renamed1878;
      }
      
      public function Renamed5300(param1:Boolean) : void
      {
         this.bgSound.Renamed1878 = param1;
      }
      
      public function get volume() : Number
      {
         return this.volumeLevel.value / 100;
      }
      
      public function set volume(param1:Number) : void
      {
         this.volumeLevel.value = int(param1 * 100);
      }
      
      override public function destroy() : void
      {
         this.volumeLevel.removeEventListener(SliderEvent.CHANGE_VALUE,this.onChangeVolume);
         super.destroy();
      }
   }
}

