package Renamed4626
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
   
   public class Renamed4628 extends BlackRoundRect
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed4729:BattleGUIService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const Renamed5685:Class = Renamed5689;
      
      private static const Renamed5682:String = "{time}";
      
      private var Renamed5687:LabelBase;
      
      private var Renamed5688:String;
      
      private var _seconds:int;
      
      private var _isShow:Boolean;
      
      public function Renamed4628()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         this.Renamed5688 = localeService.getText(TanksLocale.TEXT_REARM_SELFDISTRUCTION);
         var _loc2_:int = 33;
         var _loc3_:int = 33;
         var _loc4_:int = 5;
         var _loc5_:int = 16;
         var _loc6_:Bitmap = new Bitmap(new Renamed5685().bitmapData);
         addChild(_loc6_);
         _loc6_.y = _loc2_ - 5;
         _loc1_ = _loc6_.y + _loc6_.height + 2 * _loc4_;
         this.Renamed5687 = new LabelBase();
         this.Renamed5687.size = _loc5_;
         this.Renamed5687.autoSize = TextFieldAutoSize.LEFT;
         this.Renamed5687.text = this.Renamed5688.replace(Renamed5682," 99:99");
         this.Renamed5687.y = _loc1_;
         addChild(this.Renamed5687);
         if(width < this.Renamed5687.textWidth)
         {
            width = this.Renamed5687.textWidth;
         }
         width += 2 * _loc3_;
         _loc6_.x = width - _loc6_.width >> 1;
         height = _loc1_ + this.Renamed5687.height + _loc2_ - 5;
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
         this.Renamed5687.text = this.Renamed5688.replace(Renamed5682,_loc2_ + ":" + _loc3_);
         this.Renamed5687.x = width - this.Renamed5687.width >> 1;
      }
      
      public function show(param1:int) : void
      {
         if(this._isShow)
         {
            return;
         }
         this._isShow = true;
         this.seconds = param1;
         Renamed4729.Renamed2492().addChild(this);
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
         this.Renamed5687 = null;
      }
   }
}

