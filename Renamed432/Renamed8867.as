package Renamed432
{
   import flash.utils.ByteArray;
   
   public class Renamed8867 implements Renamed8866
   {
      private static var Renamed8868:int = 8;
      
      private var Renamed8869:Vector.<int>;
      
      private var Renamed8870:Vector.<int>;
      
      private var Renamed8871:int = 0;
      
      private var Renamed8872:int = 0;
      
      private var Renamed8873:int;
      
      public function Renamed8867(param1:Vector.<int>)
      {
         this.Renamed8869 = new Vector.<int>(Renamed8868,true);
         this.Renamed8870 = new Vector.<int>(Renamed8868,true);
         super();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.Renamed8873 ^= param1[_loc2_];
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < Renamed8868)
         {
            this.Renamed8870[_loc3_] = this.Renamed8873 ^ _loc3_ << 3;
            this.Renamed8869[_loc3_] = this.Renamed8873 ^ _loc3_ << 3 ^ 0x57;
            _loc3_++;
         }
      }
      
      public function encrypt(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = int(param1[_loc2_]);
            param1[_loc2_] = _loc3_ ^ this.Renamed8869[this.Renamed8871];
            this.Renamed8869[this.Renamed8871] = _loc3_;
            this.Renamed8871 ^= _loc3_ & 7;
            _loc2_++;
         }
      }
      
      public function decrypt(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = int(param1[_loc2_]);
            this.Renamed8870[this.Renamed8872] = _loc3_ ^ this.Renamed8870[this.Renamed8872];
            param1[_loc2_] = this.Renamed8870[this.Renamed8872];
            this.Renamed8872 ^= this.Renamed8870[this.Renamed8872] & 7;
            _loc2_++;
         }
      }
   }
}

