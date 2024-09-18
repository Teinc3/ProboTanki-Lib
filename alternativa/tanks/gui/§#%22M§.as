package alternativa.tanks.gui
{
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.statassets.§>!+§;
   import controls.statassets.StatLineBase;
   import controls.statassets.StatLineNormal;
   import controls.statassets.§]!0§;
   import controls.statassets.§const package const§;
   import controls.statassets.§import var extends§;
   import controls.statassets.§in set finally§;
   import controls.statassets.§use catch set§;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Timer;
   import forms.ConfigureScroll;
   import forms.events.§final package in§;
   import §static final§.§continue package do§;
   
   public class §#"M§ extends Sprite
   {
      private var header:§in set finally§;
      
      protected var list:List;
      
      protected var dp:DataProvider;
      
      protected var §false§:int = 1;
      
      protected var timer:Timer = null;
      
      private var _height:int = 100;
      
      protected var _width:int = 100;
      
      public function §#"M§()
      {
         this.header = new §in set finally§();
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
                  _loc4_ = new §const package const§();
               }
               else
               {
                  _loc4_ = new §>!+§();
               }
            }
            else if(param3)
            {
               _loc4_ = new §use catch set§();
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
         this.§false§ = 1;
         this.list.rowHeight = 20;
         this.list.setStyle("cellRenderer",§%#-§);
         this.list.dataProvider = this.dp;
         this.list.focusEnabled = false;
         ConfigureScroll.configScrollList(this.list,ScrollArrowDownGreen,ScrollArrowUpGreen,ScrollTrackGreen,ScrollThumbSkinGreen);
         addChild(this.header);
         addChild(this.list);
         this.list.y = 20;
         this.header.addEventListener(§final package in§.§2!A§,this.§8J§);
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
            _loc1_.sort = this.§false§;
            this.dp.replaceItemAt(_loc1_,_loc2_);
            _loc2_++;
         }
         this.sort();
      }
      
      public function §^"G§(param1:Vector.<§continue package do§>) : void
      {
         var _loc2_:Object = null;
         var _loc3_:§continue package do§ = null;
         for each(_loc3_ in param1)
         {
            _loc2_ = new Object();
            _loc2_.userId = _loc3_.user;
            _loc2_.income = _loc3_.income;
            _loc2_.sort = this.§false§;
            this.dp.addItem(_loc2_);
         }
         this.sort();
      }
      
      private function sort() : void
      {
         if(this.§false§ == 0)
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
         §import var extends§.bg = new Bitmap(setBackground(_loc2_ ? int(_loc3_ - 15) : int(_loc3_),this.§false§,false));
         §]!0§.bg = new Bitmap(setBackground(_loc2_ ? int(_loc3_ - 15) : int(_loc3_),this.§false§,true));
         this.dp.invalidate();
      }
      
      protected function §8J§(param1:§final package in§) : void
      {
         this.§false§ = param1.§const for try§;
         this.clear();
         this.width = this._width;
      }
   }
}

