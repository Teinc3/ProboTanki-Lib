package com.hurlant.util
{
   import flash.utils.ByteArray;
   
   public class Hex
   {
      public function Hex()
      {
         super();
      }
      
      public static function toArray(param1:String) : ByteArray
      {
         param1 = param1.replace(/^0x|\s|:/gm,"");
         var _loc2_:ByteArray = new ByteArray();
         if((param1.length & 1) == 1)
         {
            param1 = "0" + param1;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_[_loc3_ / 2] = parseInt(param1.substr(_loc3_,2),16);
            _loc3_ += 2;
         }
         return _loc2_;
      }
      
      public static function fromArray(param1:ByteArray, param2:Boolean = false) : String
      {
         var _loc3_:* = "";
         var _loc4_:uint = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ += ("0" + param1[_loc4_].toString(16)).substr(-2,2);
            if(param2)
            {
               if(_loc4_ < param1.length - 1)
               {
                  _loc3_ += ":";
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function toString(param1:String, param2:String = "utf-8") : String
      {
         var _loc3_:ByteArray = toArray(param1);
         return _loc3_.readMultiByte(_loc3_.length,param2);
      }
      
      public static function toRawString(param1:String) : String
      {
         return toString(param1,"iso-8859-1");
      }
      
      public static function fromString(param1:String, param2:Boolean = false, param3:String = "utf-8") : String
      {
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeMultiByte(param1,param3);
         return fromArray(_loc4_,param2);
      }
      
      public static function fromRawString(param1:String, param2:Boolean = false) : String
      {
         return fromString(param1,param2,"iso-8859-1");
      }
   }
}

