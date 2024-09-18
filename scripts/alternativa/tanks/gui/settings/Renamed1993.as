package alternativa.tanks.gui.settings
{
   import Renamed1959.Renamed1961;
   import Renamed231.Renamed1980;
   import Renamed231.Renamed1981;
   import alternativa.osgi.service.locale.ILocaleService;
   import base.DiscreteSprite;
   import controls.containers.Renamed1982;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed1969 extends DiscreteSprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed1983:Dictionary;
      
      private var Renamed1984:Vector.<Renamed1980>;
      
      private var Renamed1985:Renamed1958;
      
      private var Renamed1986:Renamed1982;
      
      public function Renamed1969()
      {
         this.Renamed1983 = new Dictionary();
         this.Renamed1984 = new Vector.<Renamed1980>();
         this.Renamed1986 = new Renamed1982();
         super();
         this.Renamed1986.Renamed1987(Renamed1961.MARGIN);
         addChild(this.Renamed1986);
      }
      
      public function Renamed1972(param1:Renamed1958) : void
      {
         switch(param1)
         {
            case Renamed1958.GAME:
               this.Renamed1986.addItem(this.Renamed1988(Renamed1958.GAME,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_GAME),Renamed1981.Renamed1989));
               break;
            case Renamed1958.GRAPHIC:
               this.Renamed1986.addItem(this.Renamed1988(Renamed1958.GRAPHIC,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_GRAPHICS),Renamed1981.Renamed1990));
               break;
            case Renamed1958.ACCOUNT:
               this.Renamed1986.addItem(this.Renamed1988(Renamed1958.ACCOUNT,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_ACCOUNT),Renamed1981.Renamed1991));
               break;
            case Renamed1958.CONTROL:
               this.Renamed1986.addItem(this.Renamed1988(Renamed1958.CONTROL,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_CONTROLS),Renamed1981.Renamed1992));
         }
      }
      
      private function Renamed1988(param1:Renamed1958, param2:String, param3:Class) : Renamed1980
      {
         var _loc4_:Renamed1980 = null;
         _loc4_ = new Renamed1980(param1,param2,param3);
         this.Renamed1983[param1] = _loc4_;
         _loc4_.width = SettingsWindow.BUTTON_WIDTH;
         this.Renamed1984.push(_loc4_);
         _loc4_.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         return _loc4_;
      }
      
      private function onButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:Renamed1958 = param1.currentTarget.getCategory();
         if(this.Renamed1985 != _loc2_)
         {
            this.Renamed1973(_loc2_);
         }
      }
      
      public function Renamed1973(param1:Renamed1958) : void
      {
         if(this.Renamed1985)
         {
            this.Renamed1983[this.Renamed1985].enabled = true;
         }
         this.Renamed1983[param1].enabled = false;
         this.Renamed1985 = param1;
         dispatchEvent(new SelectTabEvent(param1));
      }
      
      override public function get height() : Number
      {
         return this.Renamed1984[0].height;
      }
      
      override public function get width() : Number
      {
         return this.Renamed1986.width;
      }
      
      public function destroy() : void
      {
         var _loc1_:Renamed1980 = null;
         for each(_loc1_ in this.Renamed1984)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         }
      }
   }
}

