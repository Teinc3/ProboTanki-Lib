package scpacker.networking.protocol.codec.primitive
{
   import §[" §.§#""§;
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   
   public class StringCodec extends §#""§ implements ICodec
   {
      public function StringCodec()
      {
         super();
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(§%"s§(param1,param2))
         {
            return 1;
         }
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeUTFBytes(String(param2));
         var _loc4_:int = int(_loc3_.length);
         param1.writeInt(_loc4_);
         param1.writeUTFBytes(String(param2));
         return _loc4_ + 5;
      }
      
      public function decode(param1:ByteArray) : Object
      {
         if(§each catch else§(param1))
         {
            return null;
         }
         var _loc2_:int = param1.readInt();
         return param1.readUTFBytes(_loc2_);
      }
   }
}

