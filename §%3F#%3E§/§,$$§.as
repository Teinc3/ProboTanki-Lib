package §?#>§
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.utils.removeDisplayObject;
   import controls.base.LabelBase;
   import controls.statassets.BlackRoundRect;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.text.TextFieldAutoSize;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §,$$§ extends BlackRoundRect
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §finally set§:BattleGUIService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const §=W§:Class = §get package implements§;
      
      private static const §include set dynamic§:String = "{time}";
      
      private var §class var switch§:LabelBase;
      
      private var §const set in§:String;
      
      private var _seconds:int;
      
      private var _isShow:Boolean;
      
      public function §,$$§()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         var _loc6_:Bitmap = null;
         _loc1_ = 0;
         this.§const set in§ = localeService.getText(TanksLocale.TEXT_REARM_SELFDISTRUCTION);
         var _loc2_:int = 33;
         var _loc3_:int = 33;
         var _loc4_:int = 5;
         var _loc5_:int = 16;
         _loc6_ = new Bitmap(new §=W§().bitmapData);
         addChild(_loc6_);
         _loc6_.y = _loc2_ - 5;
         _loc1_ = _loc6_.y + _loc6_.height + 2 * _loc4_;
         var _loc7_:LabelBase;
         (_loc7_ = new LabelBase()).size = _loc5_;
         _loc7_.text = localeService.getText(TanksLocale.TEXT_REARM_APPLY);
         _loc7_.y = _loc1_;
         addChild(_loc7_);
         width = _loc7_.textWidth;
         _loc1_ += _loc7_.height;
         this.§class var switch§ = new LabelBase();
         this.§class var switch§.size = _loc5_;
         this.§class var switch§.autoSize = TextFieldAutoSize.LEFT;
         this.§class var switch§.text = this.§const set in§.replace(§include set dynamic§," 99:99");
         this.§class var switch§.y = _loc1_;
         addChild(this.§class var switch§);
         if(width < this.§class var switch§.textWidth)
         {
            width = this.§class var switch§.textWidth;
         }
         width += 2 * _loc3_;
         _loc6_.x = width - _loc6_.width >> 1;
         _loc7_.x = width - _loc7_.width >> 1;
         height = _loc1_ + this.§class var switch§.height + _loc2_ - 5;
      }
      
      public function set seconds(param1:int) : void
      {
         if(this._seconds == param1)
         {
            return;
         }
         this._seconds = param1;
         var _loc2_:int = this._seconds / 60;
         this._seconds -= _loc2_ * 60;
         var _loc3_:String = this._seconds < 10 ? "0" + this._seconds : this._seconds.toString();
         this.§class var switch§.text = this.§const set in§.replace(§include set dynamic§,_loc2_ + ":" + _loc3_);
         this.§class var switch§.x = width - this.§class var switch§.width >> 1;
      }
      
      public function show(param1:int) : void
      {
         if(this._isShow)
         {
            return;
         }
         this._isShow = true;
         this.seconds = param1;
         §finally set§.§native const import§().addChild(this);
         this.onResize();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.x = display.stage.stageWidth - this.width >> 1;
         this.y = display.stage.stageHeight - this.height >> 1;
      }
      
      public function hide() : void
      {
         if(!this._isShow)
         {
            return;
         }
         this._isShow = false;
         removeDisplayObject(this);
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function destroy() : void
      {
         this.hide();
         this.§class var switch§ = null;
      }
   }
}

