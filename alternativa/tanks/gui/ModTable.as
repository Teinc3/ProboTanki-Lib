package alternativa.tanks.gui
{
   import controls.base.LabelBase;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class ModTable extends Sprite
   {
      private static const upgradeSelectionLeftClass:Class = ModTable_upgradeSelectionLeftClass;
      
      private static const upgradeSelectionCenterClass:Class = ModTable_upgradeSelectionCenterClass;
      
      private var _maxCostWidth:int;
      
      public var constWidth:int;
      
      public var rows:Vector.<ModInfoRow>;
      
      public const vSpace:int = 0;
      
      private var selection:Shape;
      
      private var selectedRowIndex:int = -1;
      
      private var _width:int;
      
      public function ModTable(param1:int)
      {
         var _loc2_:ModInfoRow = null;
         _loc2_ = null;
         this.rows = new Vector.<ModInfoRow>();
         super();
         this._width = param1;
         this.selection = new Shape();
         addChild(this.selection);
         this.selection.x = 3;
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc2_ = new ModInfoRow(_loc3_,this._width);
            addChild(_loc2_);
            _loc2_.y = (_loc2_.h + this.vSpace) * _loc3_;
            this.rows.push(_loc2_);
            _loc3_++;
         }
         this.resizeSelection(this._width);
      }
      
      public function select(param1:int) : void
      {
         var _loc2_:ModInfoRow = null;
         if(this.selectedRowIndex != -1)
         {
            _loc2_ = this.rows[this.selectedRowIndex];
            _loc2_.unselect();
         }
         this.selectedRowIndex = param1;
         this.selection.y = (ModInfoRow(this.rows[0]).h + this.vSpace) * param1;
         _loc2_ = this.rows[this.selectedRowIndex];
         _loc2_.select();
      }
      
      private function resizeSelection(param1:int) : void
      {
         var _loc2_:int = param1 - 6;
         var _loc3_:BitmapData = new upgradeSelectionLeftClass().bitmapData;
         this.selection.graphics.clear();
         this.selection.graphics.beginBitmapFill(_loc3_);
         this.selection.graphics.drawRect(0,0,_loc3_.width,_loc3_.height);
         var _loc4_:BitmapData = new upgradeSelectionCenterClass().bitmapData;
         this.selection.graphics.beginBitmapFill(_loc4_);
         this.selection.graphics.drawRect(_loc3_.width,0,_loc2_ - _loc3_.width * 2,_loc4_.height);
         var _loc5_:Matrix = new Matrix(-1,0,0,1,_loc2_,0);
         this.selection.graphics.beginBitmapFill(_loc3_,_loc5_);
         this.selection.graphics.drawRect(_loc2_ - _loc3_.width,0,_loc3_.width,_loc3_.height);
         this.selection.graphics.endFill();
      }
      
      public function correctNonintegralValues() : void
      {
         var _loc1_:int = 0;
         var _loc2_:LabelBase = null;
         var _loc3_:int = 0;
         var _loc4_:Array = new Array();
         var _loc5_:ModInfoRow = this.rows[0];
         var _loc6_:int = int(_loc5_.labels.length);
         var _loc7_:int = 0;
         while(_loc7_ < 4)
         {
            _loc5_ = this.rows[_loc7_] as ModInfoRow;
            _loc1_ = 0;
            while(_loc1_ < _loc6_)
            {
               _loc2_ = _loc5_.labels[_loc1_] as LabelBase;
               if(_loc2_.text.indexOf(".") != -1)
               {
                  _loc4_.push(_loc1_);
               }
               _loc1_++;
            }
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < 4)
         {
            _loc5_ = this.rows[_loc7_];
            _loc1_ = 0;
            while(_loc1_ < _loc4_.length)
            {
               _loc3_ = int(_loc4_[_loc1_]);
               _loc2_ = _loc5_.labels[_loc3_] as LabelBase;
               if(_loc2_.text.indexOf(".") == -1)
               {
                  _loc2_.text += ".0";
               }
               _loc1_++;
            }
            _loc7_++;
         }
      }
      
      public function set maxCostWidth(param1:int) : void
      {
         this._maxCostWidth = param1;
         var _loc2_:ModInfoRow = this.rows[0];
         this.constWidth = _loc2_.upgradeIndicator.width + _loc2_.rankIcon.width + 3 + _loc2_.crystalIcon.width + this._maxCostWidth + _loc2_.hSpace * 3;
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc2_ = this.rows[_loc3_] as ModInfoRow;
            _loc2_.costWidth = this._maxCostWidth;
            _loc3_++;
         }
      }
   }
}

