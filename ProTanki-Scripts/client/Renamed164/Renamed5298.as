package Renamed1959
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import utils.ScrollStyleUtils;
   
   public class Renamed5289 extends Renamed1961
   {
      public static const Renamed5290:int = MARGIN - Renamed5291;
      
      private static const Renamed5292:int = 25;
      
      private static const Renamed5291:int = 5;
      
      private static const Renamed5293:int = 15;
      
      private static const Renamed5294:int = 5;
      
      private static const Renamed5295:int = 3;
      
      protected var scrollPane:ScrollPane;
      
      private var scrollContainer:Sprite;
      
      private var Renamed5296:Sprite;
      
      private var _width:int;
      
      private var _height:int;
      
      private var items:Vector.<DisplayObject>;
      
      public function Renamed5289()
      {
         this.items = new Vector.<DisplayObject>();
         super();
         this.scrollContainer = new Sprite();
         this.Renamed5296 = new Sprite();
         this.scrollContainer.addChild(this.Renamed5296);
         this.scrollPane = new ScrollPane();
         ScrollStyleUtils.setGrayStyle(this.scrollPane);
         this.scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollPane.source = this.scrollContainer;
         this.scrollPane.update();
         this.scrollPane.focusEnabled = false;
         this.scrollPane.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         addChild(this.scrollPane);
      }
      
      private static function onMouseWheel(param1:MouseEvent) : void
      {
         param1.delta *= Renamed5295;
      }
      
      protected function addItem(param1:DisplayObject) : void
      {
         this.items.push(param1);
         this.scrollContainer.addChild(param1);
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:DisplayObject = null;
         this._width = param1;
         this._height = param2;
         this.scrollPane.y = Renamed5291;
         this.scrollPane.setSize(param1 + Renamed5294,param2 - Renamed5291 * 2);
         var _loc4_:int = 0;
         for each(_loc3_ in this.items)
         {
            _loc4_ += _loc3_.height;
         }
         this.Renamed5297(_loc4_);
         this.scrollPane.update();
      }
      
      override public function show() : void
      {
         this.render(SettingsWindow.Renamed1967,SettingsWindow.Renamed1965);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
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
      
      override public function destroy() : void
      {
         this.scrollPane.removeEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         this.scrollPane = null;
         super.destroy();
      }
   }
}

