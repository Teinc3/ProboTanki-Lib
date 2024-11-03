package Renamed360
{
   public class Renamed8157
   {
      private var data:Array;
      
      private var length:int;
      
      private var position:int;
      
      public function Renamed8157(param1:Array, param2:int)
      {
         super();
         this.data = param1;
         this.position = 0;
         this.length = param2 * 8;
      }
      
      public function reset() : void
      {
         this.position = 0;
      }
      
      public function read(param1:int) : int
      {
         if(param1 > 32)
         {
            throw new Error("Cannot read more that 32 bit at once (requested " + param1 + ")");
         }
         if(this.position + param1 > this.length)
         {
            throw new Error("BitArea is out of data: requesed " + param1 + " bits, avaliable:" + (this.length - this.position));
         }
         var _loc2_:int = 0;
         var _loc3_:int = param1 - 1;
         while(_loc3_ >= 0)
         {
            if(this.getBit(this.position))
            {
               _loc2_ += 1 << _loc3_;
            }
            ++this.position;
            _loc3_--;
         }
         return _loc2_;
      }
      
      public function write(param1:int, param2:int) : void
      {
         var _loc3_:* = false;
         if(param1 > 32)
         {
            throw new Error("Cannot write more that 32 bit at once (requested " + param1 + ")");
         }
         if(this.position + param1 > this.length)
         {
            throw new Error("BitArea overflow attempt to write " + param1 + " bits, space avaliable:" + (this.length - this.position));
         }
         var _loc4_:int = param1 - 1;
         while(_loc4_ >= 0)
         {
            _loc3_ = (param2 & 1 << _loc4_) != 0;
            this.setBit(this.position,_loc3_);
            ++this.position;
            _loc4_--;
         }
      }
      
      private function Renamed8158(param1:Array) : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = "";
         var _loc4_:Boolean = true;
         for each(_loc2_ in param1)
         {
            if(!_loc4_)
            {
               _loc3_ += ", ";
            }
            _loc3_ += _loc2_.toString(16);
            _loc4_ = false;
         }
         return _loc3_;
      }
      
      private function getBit(param1:int) : Boolean
      {
         var _loc2_:* = param1 >> 3;
         var _loc3_:* = 7 ^ param1 & 7;
         return (this.data[_loc2_] & 1 << _loc3_) != 0;
      }
      
      private function setBit(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = param1 >> 3;
         var _loc5_:* = 7 ^ param1 & 7;
         if(param2)
         {
            this.data[_loc4_] = int(this.data[_loc4_] | 1 << _loc5_);
         }
         else
         {
            _loc3_ = int(0xFF ^ 1 << _loc5_);
            this.data[_loc4_] = int(this.data[_loc4_] & _loc3_);
         }
      }
      
      public function getLength() : int
      {
         return this.length;
      }
      
      public function getData() : Array
      {
         return this.data;
      }
   }
}

