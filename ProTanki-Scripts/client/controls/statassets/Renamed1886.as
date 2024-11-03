package controls.statassets
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.events.Renamed1888;
   
   public class Renamed1886 extends Sprite
   {
      protected var tabs:Array;
      
      protected var Renamed4043:Array;
      
      protected var Renamed4044:int = 1;
      
      protected var Renamed4045:int = 1;
      
      protected var _width:int = 800;
      
      public function Renamed1886()
      {
         var _loc2_:Renamed4041 = null;
         this.tabs = new Array();
         super();
         var _loc1_:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         this.Renamed4043 = [_loc1_.getText(TextConst.REFERAL_STATISTICS_HEADER_CALLSIGN),_loc1_.getText(TextConst.REFERAL_STATISTICS_HEADER_INCOME)];
         var _loc3_:int = 0;
         while(_loc3_ < 2)
         {
            _loc2_ = new Renamed4041(_loc3_ == 1);
            _loc2_.label = this.Renamed4043[_loc3_];
            _loc2_.height = 18;
            _loc2_.Renamed4042 = _loc3_;
            addChild(_loc2_);
            _loc2_.addEventListener(MouseEvent.CLICK,this.AbstractPackets2);
            _loc3_++;
         }
         this.draw();
      }
      
      protected function draw() : void
      {
         var _loc1_:Renamed4041 = null;
         var _loc3_:int = 0;
         var _loc2_:int = int(this._width - 345);
         this.tabs = [0,this._width - 120,this._width - 1];
         _loc3_ = 0;
         while(_loc3_ < 2)
         {
            _loc1_ = getChildAt(_loc3_) as Renamed4041;
            _loc1_.width = this.tabs[_loc3_ + 1] - this.tabs[_loc3_] - 2;
            _loc1_.x = this.tabs[_loc3_];
            _loc1_.selected = _loc3_ == this.Renamed4044;
            _loc3_++;
         }
      }
      
      protected function AbstractPackets2(param1:MouseEvent) : void
      {
         var _loc2_:Renamed4041 = param1.currentTarget as Renamed4041;
         this.Renamed4044 = _loc2_.Renamed4042;
         if(this.Renamed4044 != this.Renamed4045)
         {
            this.draw();
            dispatchEvent(new Renamed1888(Renamed1888.AbstractPackets1,0,0,this.Renamed4044));
            this.Renamed4045 = this.Renamed4044;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.draw();
      }
   }
}

