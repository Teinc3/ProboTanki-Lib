package alternativa.tanks.gui
{
   import controls.base.LabelBase;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFormatAlign;
   
   public class ItemPropertyIcon extends Sprite
   {
      public var bmp:Bitmap;
      
      private var label:LabelBase;
      
      private const space:int = 2;
      
      public function ItemPropertyIcon(param1:BitmapData)
      {
         super();
         var _loc2_:BitmapData = ItemInfoPanelBitmaps.backIcon;
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc3_.draw(_loc2_);
         _loc3_.draw(param1,new Matrix(1,0,0,1,1,1));
         this.bmp = new Bitmap(_loc3_);
         addChild(this.bmp);
         this.label = new MouseDisabledLabel();
         this.label.size = 10;
         addChild(this.label);
         this.label.color = 59156;
         this.label.align = TextFormatAlign.CENTER;
         this.label.sharpness = -100;
         this.label.thickness = 100;
         this.posLabel();
         this.label.y = this.bmp.height + this.space;
      }
      
      public function setValue(param1:String, param2:uint) : void
      {
         this.label.text = param1;
         this.label.color = param2;
         this.posLabel();
      }
      
      public function getLabel() : DisplayObject
      {
         return this.label;
      }
      
      private function posLabel() : void
      {
         if(this.bmp.width > this.label.textWidth)
         {
            this.label.x = Math.round((this.bmp.width - this.label.textWidth) * 0.5) - 3;
         }
         else if(this.label.textWidth > this.bmp.width)
         {
            this.label.x = -Math.round((this.label.textWidth - this.bmp.width) * 0.5) - 3;
         }
         else
         {
            this.label.x = -3;
         }
      }
      
      public function removeValue() : void
      {
         this.label.text = "";
      }
   }
}

