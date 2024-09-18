package alternativa.tanks.gui
{
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.statassets.Renamed1882;
   import controls.statassets.StatLineBase;
   import controls.statassets.StatLineNormal;
   import controls.statassets.Renamed1883;
   import controls.statassets.Renamed1884;
   import controls.statassets.Renamed1885;
   import controls.statassets.Renamed1886;
   import controls.statassets.Renamed1887;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Timer;
   import forms.ConfigureScroll;
   import forms.events.Renamed1888;
   import Renamed420.Renamed1806;
   
   public class Renamed1835 extends Sprite
   {
      private var header:Renamed1886;
      
      protected var list:List;
      
      protected var dp:DataProvider;
      
      protected var Renamed1889:int = 1;
      
      protected var timer:Timer = null;
      
      private var _height:int = 100;
      
      protected var _width:int = 100;
      
      public function Renamed1835()
      {
         this.header = new Renamed1886();
         this.list = new List();
         this.dp = new DataProvider();
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.ConfigUI);
      }
      
      public static function setBackground(param1:int, param2:int, param3:Boolean) : BitmapData
      {
         var _loc6_:Array = null;
         var _loc4_:StatLineBase = null;
         var _loc5_:Sprite = new Sprite();
         _loc6_ = [0,param1 - 120,param1 - 1];
         var _loc7_:int = 0;
         var _loc8_:BitmapData = new BitmapData(param1,20,true,0);
         _loc7_ = 0;
         while(_loc7_ < 2)
         {
            if(param2 == _loc7_)
            {
               if(param3)
               {
                  _loc4_ = new Renamed1884();
               }
               else
               {
                  _loc4_ = new Renamed1882();
               }
            }
            else if(param3)
            {
               _loc4_ = new Renamed1887();
            }
            else
            {
               _loc4_ = new StatLineNormal();
            }
            _loc4_.width = _loc6_[_loc7_ + 1] - _loc6_[_loc7_] - 2;
            _loc4_.height = 18;
            _loc4_.x = _loc6_[_loc7_];
            _loc5_.addChild(_loc4_);
            _loc7_++;
         }
         _loc8_.draw(_loc5_);
         return _loc8_;
      }
      
      protected function ConfigUI(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.ConfigUI);
         this.Renamed1889 = 1;
         this.list.rowHeight = 20;
         this.list.setStyle("cellRenderer",Renamed1890);
         this.list.dataProvider = this.dp;
         this.list.focusEnabled = false;
         ConfigureScroll.configScrollList(this.list,ScrollArrowDownGreen,ScrollArrowUpGreen,ScrollTrackGreen,ScrollThumbSkinGreen);
         addChild(this.header);
         addChild(this.list);
         this.list.y = 20;
         this.header.addEventListener(Renamed1888.Renamed1891,this.Renamed1892);
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = int(param1);
         this.list.height = this._height - 20;
      }
      
      public function clear() : void
      {
         var _loc1_:Object = new Object();
         var _loc2_:int = 0;
         while(_loc2_ < this.dp.length)
         {
            _loc1_ = this.dp.getItemAt(_loc2_);
            _loc1_.sort = this.Renamed1889;
            this.dp.replaceItemAt(_loc1_,_loc2_);
            _loc2_++;
         }
         this.sort();
      }
      
      public function Renamed1874(param1:Vector.<Renamed1806>) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Renamed1806 = null;
         for each(_loc3_ in param1)
         {
            _loc2_ = new Object();
            _loc2_.userId = _loc3_.user;
            _loc2_.income = _loc3_.income;
            _loc2_.sort = this.Renamed1889;
            this.dp.addItem(_loc2_);
         }
         this.sort();
      }
      
      private function sort() : void
      {
         if(this.Renamed1889 == 0)
         {
            this.dp.sortOn("callsign");
         }
         else
         {
            this.dp.sortOn("income",Array.NUMERIC | Array.DESCENDING);
         }
         this.dp.invalidate();
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         var _loc2_:* = this.list.maxVerticalScrollPosition > 0;
         var _loc3_:int = _loc2_ ? int(this._width + 6) : int(this._width);
         this.list.width = _loc3_;
         this.header.width = _loc2_ ? Number(_loc3_ - 15) : Number(_loc3_);
         Renamed1885.bg = new Bitmap(setBackground(_loc2_ ? int(_loc3_ - 15) : int(_loc3_),this.Renamed1889,false));
         Renamed1883.bg = new Bitmap(setBackground(_loc2_ ? int(_loc3_ - 15) : int(_loc3_),this.Renamed1889,true));
         this.dp.invalidate();
      }
      
      protected function Renamed1892(param1:Renamed1888) : void
      {
         this.Renamed1889 = param1.Renamed1893;
         this.clear();
         this.width = this._width;
      }
   }
}

