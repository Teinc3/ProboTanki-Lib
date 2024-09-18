package §"f§
{
   import alternativa.tanks.gui.settings.SettingsWindow;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import utils.ScrollStyleUtils;
   
   public class §'"[§ extends §with for import§
   {
      public static const §include set const§:int = MARGIN - §?"R§;
      
      private static const §!!W§:int = 25;
      
      private static const §?"R§:int = 5;
      
      private static const §-$$§:int = 15;
      
      private static const §'<§:int = 5;
      
      private static const §case var override§:int = 3;
      
      protected var scrollPane:ScrollPane;
      
      private var scrollContainer:Sprite;
      
      private var §use null§:Sprite;
      
      private var _width:int;
      
      private var _height:int;
      
      private var items:Vector.<DisplayObject>;
      
      public function §'"[§()
      {
         this.items = new Vector.<DisplayObject>();
         super();
         this.scrollContainer = new Sprite();
         this.§use null§ = new Sprite();
         this.scrollContainer.addChild(this.§use null§);
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
         param1.delta *= §case var override§;
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
         this.scrollPane.y = §?"R§;
         this.scrollPane.setSize(param1 + §'<§,param2 - §?"R§ * 2);
         var _loc4_:int = 0;
         for each(_loc3_ in this.items)
         {
            _loc4_ += _loc3_.height;
         }
         this.§]"c§(_loc4_);
         this.scrollPane.update();
      }
      
      override public function show() : void
      {
         this.render(SettingsWindow.§each package null§,SettingsWindow.§7E§);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      private function §]"c§(param1:int) : void
      {
         this.§use null§.graphics.lineStyle(1,ColorConstants.WHITE,0);
         this.§use null§.graphics.beginFill(ColorConstants.WHITE,0);
         this.§use null§.graphics.drawRect(0,0,1,§-$$§);
         this.§use null§.graphics.endFill();
         this.§use null§.x = §!!W§;
         this.§use null§.y = param1;
      }
      
      override public function destroy() : void
      {
         this.scrollPane.removeEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         this.scrollPane = null;
         super.destroy();
      }
   }
}

