package Renamed4626
{
   import assets.IconAlarm;
   import controls.Label;
   import controls.statassets.BlackRoundRect;
   import flash.text.TextFieldAutoSize;
   
   public class Renamed5681 extends BlackRoundRect
   {
      private static const Renamed5682:String = "{time}";
      
      private var Renamed5683:Label;
      
      private var Renamed5684:String;
      
      private var _seconds:int;
      
      public function Renamed5681(param1:String, param2:String, param3:String)
      {
         var _loc4_:Label = null;
         super();
         this.Renamed5684 = param3;
         var _loc5_:int = 33;
         var _loc6_:int = 33;
         var _loc7_:int = 5;
         var _loc8_:int = 16;
         var _loc9_:IconAlarm = new IconAlarm();
         addChild(_loc9_);
         _loc9_.y = _loc5_;
         var _loc10_:int = _loc9_.y + _loc9_.height + 2 * _loc7_;
         (_loc4_ = new Label()).size = _loc8_;
         _loc4_.text = param1;
         _loc4_.y = _loc10_;
         addChild(_loc4_);
         width = _loc4_.textWidth;
         _loc10_ += _loc4_.height + _loc7_;
         var _loc11_:Label;
         (_loc11_ = new Label()).size = _loc8_;
         _loc11_.text = param2;
         _loc11_.y = _loc10_;
         addChild(_loc11_);
         if(width < _loc11_.textWidth)
         {
            width = _loc11_.textWidth;
         }
         _loc10_ += _loc11_.height + _loc7_;
         this.Renamed5683 = new Label();
         this.Renamed5683.size = _loc8_;
         this.Renamed5683.autoSize = TextFieldAutoSize.LEFT;
         this.Renamed5683.text = param3 + " 99:99";
         this.Renamed5683.y = _loc10_;
         addChild(this.Renamed5683);
         if(width < this.Renamed5683.textWidth)
         {
            width = this.Renamed5683.textWidth;
         }
         width += 2 * _loc6_;
         _loc9_.x = width - _loc9_.width >> 1;
         _loc4_.x = width - _loc4_.width >> 1;
         _loc11_.x = width - _loc11_.width >> 1;
         height = _loc10_ + this.Renamed5683.height + _loc5_ - 5;
      }
      
      public function set seconds(param1:int) : void
      {
         if(this._seconds == param1)
         {
            return;
         }
         this._seconds = param1;
         var _loc2_:int = this._seconds / 60;
         this._seconds -= _loc2_ * 60;
         var _loc3_:String = this._seconds < 10 ? "0" + this._seconds : this._seconds.toString();
         this.Renamed5683.text = this.Renamed5684.replace(Renamed5682,_loc2_ + ":" + _loc3_);
         this.Renamed5683.x = width - this.Renamed5683.width >> 1;
      }
   }
}

