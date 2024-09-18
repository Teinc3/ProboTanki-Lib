package controls
{
   import assets.windowinner.bitmaps.WindowInnerBGTile;
   import assets.windowinner.bitmaps.WindowInnerBottom;
   import assets.windowinner.bitmaps.WindowInnerLeft;
   import assets.windowinner.bitmaps.WindowInnerRight;
   import assets.windowinner.bitmaps.WindowInnerTop;
   import assets.windowinner.bitmaps.combo_BG;
   import assets.windowinner.elemets.WindowInnerBlink;
   import assets.windowinner.elemets.WindowInnerBottomLeftCorner;
   import assets.windowinner.elemets.WindowInnerBottomRightCorner;
   import assets.windowinner.elemets.WindowInnerTopLeftCorner;
   import assets.windowinner.elemets.WindowInnerTopRightCorner;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol75")]
   public class TankWindowInner extends Sprite
   {
      public static const RED:uint = 4284618496;
      
      public static const BLUE:uint = 4278201433;
      
      public static const GREEN:uint = 4278985229;
      
      public static const TRANSPARENT:uint = 16744512;
      
      private var _width:int;
      
      private var _height:int;
      
      private var tl:WindowInnerTopLeftCorner;
      
      private var tr:WindowInnerTopRightCorner;
      
      private var bl:WindowInnerBottomLeftCorner;
      
      private var br:WindowInnerBottomRightCorner;
      
      private var blink:WindowInnerBlink;
      
      private var bgBMP:BitmapData;
      
      private var topBMP:WindowInnerTop;
      
      private var bottomBMP:WindowInnerBottom;
      
      private var leftBMP:WindowInnerLeft;
      
      private var rightBMP:WindowInnerRight;
      
      private var bg:Sprite;
      
      private var top:Shape;
      
      private var bottom:Shape;
      
      private var left:Shape;
      
      private var right:Shape;
      
      private var _color:uint;
      
      public function TankWindowInner(param1:int = -1, param2:int = -1, param3:uint = 0)
      {
         this.tl = new WindowInnerTopLeftCorner();
         this.tr = new WindowInnerTopRightCorner();
         this.bl = new WindowInnerBottomLeftCorner();
         this.br = new WindowInnerBottomRightCorner();
         this.blink = new WindowInnerBlink();
         this.topBMP = new WindowInnerTop(0,0);
         this.bottomBMP = new WindowInnerBottom(0,0);
         this.leftBMP = new WindowInnerLeft(0,0);
         this.rightBMP = new WindowInnerRight(0,0);
         this.bg = new Sprite();
         this.top = new Shape();
         this.bottom = new Shape();
         this.left = new Shape();
         this.right = new Shape();
         super();
         this._width = param1;
         this._height = param2;
         this.bgBMP = param3 == 0 ? new WindowInnerBGTile(0,0) as BitmapData : new BitmapData(5,5,true,param3);
         this.bgBMP = param3 == 100 ? new combo_BG(0,0) as BitmapData : new BitmapData(5,5,true,param3);
         this.ConfigUI();
         this.draw();
         this._color = param3;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.draw();
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = Math.floor(param1);
         this.draw();
      }
      
      private function ConfigUI() : void
      {
         this._width = this._width == -1 ? int(scaleX * 100) : this._width;
         this._height = this._height == -1 ? int(scaleY * 100) : this._height;
         scaleX = 1;
         scaleY = 1;
         removeChildAt(0);
         addChild(this.bg);
         addChild(this.top);
         addChild(this.bottom);
         addChild(this.left);
         addChild(this.right);
         addChild(this.tl);
         addChild(this.tr);
         addChild(this.bl);
         addChild(this.br);
      }
      
      private function draw() : void
      {
         var _loc1_:Rectangle = new Rectangle(0,0,this._width - 2,this._height - 2);
         this.bg.graphics.clear();
         this.bg.graphics.beginBitmapFill(this.bgBMP);
         this.bg.graphics.drawRect(1,1,this._width - 2,this._height - 2);
         this.bg.graphics.endFill();
         this.top.graphics.clear();
         this.top.graphics.beginBitmapFill(this.topBMP);
         this.top.graphics.drawRect(0,0,this._width - 12,6);
         this.top.graphics.endFill();
         this.top.x = 6;
         this.bottom.graphics.clear();
         this.bottom.graphics.beginBitmapFill(this.bottomBMP);
         this.bottom.graphics.drawRect(0,0,this._width - 12,6);
         this.bottom.graphics.endFill();
         this.bottom.x = 6;
         this.bottom.y = this._height - 6;
         this.left.graphics.clear();
         this.left.graphics.beginBitmapFill(this.leftBMP);
         this.left.graphics.drawRect(0,0,6,this._height - 12);
         this.left.graphics.endFill();
         this.left.x = 0;
         this.left.y = 6;
         this.right.graphics.clear();
         this.right.graphics.beginBitmapFill(this.rightBMP);
         this.right.graphics.drawRect(0,0,6,this._height - 12);
         this.right.graphics.endFill();
         this.right.x = this._width - 6;
         this.right.y = 6;
         this.tl.x = 0;
         this.tl.y = 0;
         this.tr.x = this._width - this.tr.width;
         this.tr.y = 0;
         this.bl.x = 0;
         this.bl.y = this._height - this.bl.height;
         this.br.x = this._width - this.br.width;
         this.br.y = this._height - this.br.height;
         this.blink.width = this._width - 2;
         this.blink.height = 174 * ((this._width - 2) / 310);
         this.bg.scrollRect = _loc1_;
      }
      
      public function set showBlink(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            this.bg.addChild(this.blink);
            this.blink.x = this.blink.y = 1;
            switch(this._color)
            {
               case GREEN:
                  _loc2_ = 1;
                  break;
               case BLUE:
                  _loc2_ = 2;
                  break;
               case RED:
                  _loc2_ = 3;
            }
            this.blink.gotoAndStop(_loc2_);
         }
      }
   }
}

