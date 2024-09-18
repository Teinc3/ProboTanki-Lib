package scpacker.networking.protocol.codec.complex
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   
   public class ByteArrayCodec implements ICodec
   {
      public function ByteArrayCodec()
      {
         super();
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:ByteArray = ByteArray(param2);
         param1.writeInt(_loc3_.length);
         param1.writeBytes(_loc3_);
         return 4 + _loc3_.length;
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:ByteArray = new ByteArray();
         if(_loc2_ > 0)
         {
            param1.readBytes(_loc3_,0,_loc2_);
         }
         return _loc3_;
      }
   }
}

