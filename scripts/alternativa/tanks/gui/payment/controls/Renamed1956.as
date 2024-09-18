package alternativa.tanks.gui.payment.controls
{
   import controls.base.BigButtonBase;
   import flash.display.BitmapData;
   
   public class Renamed1955 extends BigButtonBase
   {
      public function Renamed1955(param1:BitmapData)
      {
         super();
         icon = param1;
         this.width = 155;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         _info.width = _label.width = _width - 4;
         if(_icon != null)
         {
            _icon.x = int(_width / 2 - _icon.width / 2);
            _icon.y = int(25 - _icon.height / 2);
         }
      }
   }
}

