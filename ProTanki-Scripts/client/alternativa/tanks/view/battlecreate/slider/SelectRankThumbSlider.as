package alternativa.tanks.view.battlecreate.slider
{
   import controls.slider.SliderThumb;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import forms.ranks.SmallRankIcon;
   
   public class SelectRankThumbSlider extends SliderThumb
   {
      private static const bitmapArrow:Class = SelectRankThumbSlider_bitmapArrow;
      
      private static const arrow:BitmapData = new bitmapArrow().bitmapData;
      
      private var iconMin:SmallRankIcon;
      
      private var iconMax:SmallRankIcon;
      
      private var _minRang:int = 0;
      
      private var _maxRang:int = 0;
      
      public var leftDrag:Sprite;
      
      public var centerDrag:Sprite;
      
      public var rightDrag:Sprite;
      
      public function SelectRankThumbSlider()
      {
         var _loc1_:Graphics = null;
         this.iconMin = new SmallRankIcon();
         this.iconMax = new SmallRankIcon();
         super();
         addChild(this.iconMax);
         addChild(this.iconMin);
         this.iconMax.y = 9;
         this.iconMin.y = 9;
         this.leftDrag = new Sprite();
         _loc1_ = this.leftDrag.graphics;
         _loc1_.beginFill(0,0);
         _loc1_.drawRect(0,0,15,30);
         _loc1_.endFill();
         this.centerDrag = new Sprite();
         this.centerDrag.x = 15;
         this.rightDrag = new Sprite();
         _loc1_ = this.rightDrag.graphics;
         _loc1_.beginFill(0,0);
         _loc1_.drawRect(0,0,15,30);
         _loc1_.endFill();
         addChild(this.leftDrag);
         addChild(this.centerDrag);
         addChild(this.rightDrag);
         this.leftDrag.buttonMode = true;
         this.centerDrag.buttonMode = true;
         this.rightDrag.buttonMode = true;
      }
      
      override protected function draw() : void
      {
         var _loc1_:Graphics = null;
         var _loc2_:Matrix = null;
         super.draw();
         var _loc3_:int = this._maxRang - this._minRang;
         this.iconMin.setDefaultAccount(this._minRang);
         this.iconMax.setDefaultAccount(this._maxRang);
         this.iconMax.visible = _loc3_ > 0;
         if(_loc3_ == 0)
         {
            this.iconMax.x = this.iconMin.x = int((_width - this.iconMin.width) / 2);
         }
         else
         {
            this.iconMin.x = 11;
            this.iconMax.x = _width - this.iconMax.width - 11;
            _loc1_ = this.graphics;
            _loc2_ = new Matrix();
            _loc2_.translate(5,12);
            _loc1_.beginBitmapFill(arrow,_loc2_);
            _loc1_.drawRect(5,12,4,7);
            _loc1_.endFill();
            _loc2_ = new Matrix();
            _loc2_.rotate(Math.PI);
            _loc2_.translate(_width - 9,12);
            _loc1_.beginBitmapFill(arrow,_loc2_);
            _loc1_.drawRect(_width - 9,12,4,7);
            _loc1_.endFill();
         }
         _loc1_ = this.centerDrag.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0);
         _loc1_.drawRect(0,0,_width - 30,30);
         _loc1_.endFill();
         this.rightDrag.x = _width - 15;
      }
      
      public function set minRang(param1:int) : void
      {
         this._minRang = param1;
         this.draw();
      }
      
      public function set maxRang(param1:int) : void
      {
         this._maxRang = param1;
         this.draw();
      }
   }
}

