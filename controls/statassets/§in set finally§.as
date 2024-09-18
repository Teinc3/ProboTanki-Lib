package controls.statassets
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.events.§final package in§;
   
   public class §in set finally§ extends Sprite
   {
      protected var tabs:Array;
      
      protected var §7"k§:Array;
      
      protected var §if for in§:int = 1;
      
      protected var §finally package implements§:int = 1;
      
      protected var _width:int = 800;
      
      public function §in set finally§()
      {
         var _loc2_:§case const continue§ = null;
         this.tabs = new Array();
         super();
         var _loc1_:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         this.§7"k§ = [_loc1_.getText(TextConst.REFERAL_STATISTICS_HEADER_CALLSIGN),_loc1_.getText(TextConst.REFERAL_STATISTICS_HEADER_INCOME)];
         var _loc3_:int = 0;
         while(_loc3_ < 2)
         {
            _loc2_ = new §case const continue§(_loc3_ == 1);
            _loc2_.label = this.§7"k§[_loc3_];
            _loc2_.height = 18;
            _loc2_.§static use§ = _loc3_;
            addChild(_loc2_);
            _loc2_.addEventListener(MouseEvent.CLICK,this.§8J§);
            _loc3_++;
         }
         this.draw();
      }
      
      protected function draw() : void
      {
         var _loc1_:§case const continue§ = null;
         var _loc3_:int = 0;
         var _loc2_:int = int(this._width - 345);
         this.tabs = [0,this._width - 120,this._width - 1];
         _loc3_ = 0;
         while(_loc3_ < 2)
         {
            _loc1_ = getChildAt(_loc3_) as §case const continue§;
            _loc1_.width = this.tabs[_loc3_ + 1] - this.tabs[_loc3_] - 2;
            _loc1_.x = this.tabs[_loc3_];
            _loc1_.selected = _loc3_ == this.§if for in§;
            _loc3_++;
         }
      }
      
      protected function §8J§(param1:MouseEvent) : void
      {
         var _loc2_:§case const continue§ = param1.currentTarget as §case const continue§;
         this.§if for in§ = _loc2_.§static use§;
         if(this.§if for in§ != this.§finally package implements§)
         {
            this.draw();
            dispatchEvent(new §final package in§(§final package in§.§2!A§,0,0,this.§if for in§));
            this.§finally package implements§ = this.§if for in§;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.draw();
      }
   }
}

