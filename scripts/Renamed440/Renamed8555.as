package Renamed440
{
   import Renamed476.Renamed8554;
   import base.DiscreteSprite;
   import controls.TankWindowInner;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.ColorConstants;
   import utils.ScrollStyleUtils;
   import Renamed454.Renamed2268;
   
   public class Renamed8555 extends DiscreteSprite
   {
      private static const Renamed8922:int = 20;
      
      private static const Renamed5292:int = 25;
      
      private static const Renamed5291:int = 5;
      
      private static const Renamed5293:int = 15;
      
      private static const Renamed5294:int = 5;
      
      private static const Renamed5295:int = 3;
      
      private static const Renamed8923:int = 8;
      
      private var scrollPane:ScrollPane;
      
      private var scrollContainer:Sprite;
      
      private var Renamed5296:Sprite;
      
      private var inner:TankWindowInner;
      
      private var categories:Dictionary;
      
      private var Renamed8924:Vector.<Renamed8554>;
      
      private var _width:int;
      
      private var _height:int;
      
      public function Renamed8555()
      {
         super();
         this.categories = new Dictionary();
         this.Renamed8924 = new Vector.<Renamed8554>();
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.inner);
         this.scrollContainer = new Sprite();
         this.Renamed5296 = new Sprite();
         this.scrollContainer.addChild(this.Renamed5296);
         this.scrollPane = new ScrollPane();
         ScrollStyleUtils.setGreenStyle(this.scrollPane);
         this.scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollPane.source = this.scrollContainer;
         this.scrollPane.update();
         this.scrollPane.focusEnabled = false;
         this.scrollPane.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel,true);
         addChild(this.scrollPane);
      }
      
      private function onMouseWheel(param1:MouseEvent) : void
      {
         param1.delta *= Renamed5295;
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Renamed8554 = null;
         this._width = param1;
         this._height = param2;
         this.scrollPane.y = Renamed5291;
         this.scrollPane.setSize(param1 + Renamed5294,param2 - Renamed5291 * 2);
         this.inner.width = param1;
         this.inner.height = param2;
         var _loc4_:int = -12;
         for each(_loc3_ in this.Renamed8924)
         {
            _loc3_.x = Renamed5292;
            _loc3_.render(this._width - Renamed5292 * 2 - (this.scrollPane.verticalScrollBar.width - Renamed5294 - 1));
            _loc3_.y = _loc4_ + Renamed8922;
            _loc4_ = _loc3_.y + _loc3_.height;
         }
         this.Renamed5297(_loc4_);
         this.scrollPane.update();
      }
      
      private function Renamed5297(param1:int) : void
      {
         this.Renamed5296.graphics.lineStyle(1,ColorConstants.WHITE,0);
         this.Renamed5296.graphics.beginFill(ColorConstants.WHITE,0);
         this.Renamed5296.graphics.drawRect(0,0,1,Renamed5293);
         this.Renamed5296.graphics.endFill();
         this.Renamed5296.x = Renamed5292;
         this.Renamed5296.y = param1;
      }
      
      public function Renamed8556(param1:Renamed8554) : void
      {
         this.categories[param1.Renamed8925] = param1;
         this.Renamed8924.push(param1);
         this.scrollContainer.addChild(param1);
      }
      
      public function addItem(param1:String, param2:Renamed2268) : void
      {
         Renamed8554(this.categories[param1]).addItem(param2);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function Renamed8557(param1:String) : void
      {
         this.scrollPane.verticalScrollPosition = this.categories[param1].y - Renamed8923;
      }
      
      public function get scrollPosition() : int
      {
         return this.scrollPane.verticalScrollPosition;
      }
      
      public function set scrollPosition(param1:int) : void
      {
         if(this.scrollPane.stage)
         {
            this.scrollPane.verticalScrollPosition = param1;
            this.scrollPane.update();
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:Renamed8554 = null;
         for each(_loc1_ in this.categories)
         {
            _loc1_.destroy();
         }
         this.categories = null;
         this.Renamed8924 = null;
         this.scrollPane.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel,true);
         this.scrollPane = null;
      }
   }
}

