package Renamed1959
{
   import Renamed231.Renamed5301;
   import Renamed231.Renamed5302;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.Renamed2069;
   import base.DiscreteSprite;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class Renamed1961 extends DiscreteSprite
   {
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const MARGIN:int = 8;
      
      public static const Renamed5303:int = 10;
      
      public static const Renamed5304:int = 3;
      
      protected var Renamed5305:Vector.<DisplayObject>;
      
      public function Renamed1961()
      {
         this.Renamed5305 = new Vector.<DisplayObject>();
         super();
      }
      
      public function show() : void
      {
      }
      
      public function hide() : void
      {
      }
      
      protected function createCheckBox(param1:Renamed2069, param2:String, param3:Boolean, param4:int = 0, param5:int = 0) : Renamed5301
      {
         var _loc6_:Renamed5301;
         (_loc6_ = new Renamed5301(param1,param2)).Renamed1878 = param3;
         _loc6_.addEventListener(MouseEvent.CLICK,this.Renamed5306);
         _loc6_.x = param4;
         _loc6_.y = param5;
         this.Renamed5305.push(_loc6_);
         _loc6_.label = param2;
         return _loc6_;
      }
      
      protected function Renamed5306(param1:MouseEvent) : void
      {
         var _loc2_:Renamed5302 = null;
         if(param1.currentTarget is Renamed5302)
         {
            _loc2_ = Renamed5302(param1.currentTarget);
            settingsService.Renamed3726(_loc2_.Renamed2070(),_loc2_.Renamed5307());
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:DisplayObject = null;
         for each(_loc1_ in this.Renamed5305)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.Renamed5306);
         }
      }
   }
}

