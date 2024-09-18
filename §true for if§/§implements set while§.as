package §true for if§
{
   import §]!5§.§8"W§;
   import base.DiscreteSprite;
   import controls.TankWindowInner;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.ColorConstants;
   import utils.ScrollStyleUtils;
   import §var package override§.§native for implements§;
   
   public class §implements set while§ extends DiscreteSprite
   {
      private static const §while for var§:int = 20;
      
      private static const §!!W§:int = 25;
      
      private static const §?"R§:int = 5;
      
      private static const §-$$§:int = 15;
      
      private static const §'<§:int = 5;
      
      private static const §case var override§:int = 3;
      
      private static const §import return§:int = 8;
      
      private var scrollPane:ScrollPane;
      
      private var scrollContainer:Sprite;
      
      private var §use null§:Sprite;
      
      private var inner:TankWindowInner;
      
      private var categories:Dictionary;
      
      private var §`"6§:Vector.<§8"W§>;
      
      private var _width:int;
      
      private var _height:int;
      
      public function §implements set while§()
      {
         super();
         this.categories = new Dictionary();
         this.§`"6§ = new Vector.<§8"W§>();
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.inner);
         this.scrollContainer = new Sprite();
         this.§use null§ = new Sprite();
         this.scrollContainer.addChild(this.§use null§);
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
         param1.delta *= §case var override§;
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:§8"W§ = null;
         this._width = param1;
         this._height = param2;
         this.scrollPane.y = §?"R§;
         this.scrollPane.setSize(param1 + §'<§,param2 - §?"R§ * 2);
         this.inner.width = param1;
         this.inner.height = param2;
         var _loc4_:int = -12;
         for each(_loc3_ in this.§`"6§)
         {
            _loc3_.x = §!!W§;
            _loc3_.render(this._width - §!!W§ * 2 - (this.scrollPane.verticalScrollBar.width - §'<§ - 1));
            _loc3_.y = _loc4_ + §while for var§;
            _loc4_ = _loc3_.y + _loc3_.height;
         }
         this.§]"c§(_loc4_);
         this.scrollPane.update();
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
      
      public function §for set class§(param1:§8"W§) : void
      {
         this.categories[param1.§%#^§] = param1;
         this.§`"6§.push(param1);
         this.scrollContainer.addChild(param1);
      }
      
      public function addItem(param1:String, param2:§native for implements§) : void
      {
         §8"W§(this.categories[param1]).addItem(param2);
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function §[$ §(param1:String) : void
      {
         this.scrollPane.verticalScrollPosition = this.categories[param1].y - §import return§;
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
         var _loc1_:§8"W§ = null;
         for each(_loc1_ in this.categories)
         {
            _loc1_.destroy();
         }
         this.categories = null;
         this.§`"6§ = null;
         this.scrollPane.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel,true);
         this.scrollPane = null;
      }
   }
}

