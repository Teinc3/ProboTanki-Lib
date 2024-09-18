package alternativa.utils
{
   public final class Long
   {
      private var _low:uint;
      
      private var _high:uint;
      
      public function Long(param1:uint, param2:uint)
      {
         super();
         this._high = param1;
         this._low = param2;
      }
      
      private function get low() : int
      {
         return this._low;
      }
      
      private function get high() : uint
      {
         return this._high;
      }
      
      public function toOct() : String
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:uint = 0;
         var _loc6_:int = 0;
         while(_loc6_ < 5)
         {
            _loc1_ = uint((this.high & 63 << 4 + _loc5_) >>> _loc5_ + 4);
            _loc2_ = uint((this.low & 63 << _loc5_) >>> _loc5_);
            _loc3_ = this._toOct(_loc1_) + _loc3_;
            _loc4_ = this._toOct(_loc2_) + _loc4_;
            _loc5_ += 6;
            _loc6_++;
         }
         var _loc7_:String = _loc3_ + this._toOct(((this.high & uint(15)) << 2) + (this.low >>> 30)) + _loc4_;
         return this.trimLeadingZeros(_loc7_);
      }
      
      private function trimLeadingZeros(param1:String) : String
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length && param1.charAt(_loc2_) == "0")
         {
            _loc2_++;
         }
         return param1.substr(_loc2_);
      }
      
      private function _toOct(param1:uint) : String
      {
         var _loc2_:String = param1.toString(8);
         return (_loc2_.length < 2 ? "0" : "") + _loc2_;
      }
   }
}

