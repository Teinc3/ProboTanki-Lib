package alternativa.protocol.impl
{
   import alternativa.protocol.ProtocolBuffer;
   
   public class LengthCodecHelper
   {
      public function LengthCodecHelper()
      {
         super();
      }
      
      public static function encodeLength(param1:ProtocolBuffer, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(param2 < 0)
         {
            throw new Error("Length is incorrect (" + param2 + ")");
         }
         if(param2 < 128)
         {
            param1.writer.writeByte(int(param2 & 0x7F));
         }
         else if(param2 < 16384)
         {
            _loc3_ = (param2 & 0x3FFF) + 32768;
            param1.writer.writeByte(int((_loc3_ & 0xFF00) >> 8));
            param1.writer.writeByte(int(_loc3_ & 0xFF));
         }
         else
         {
            if(param2 >= 4194304)
            {
               throw new Error("Length is incorrect (" + param2 + ")");
            }
            _loc3_ = (param2 & 0x3FFFFF) + 12582912;
            param1.writer.writeByte(int((_loc3_ & 0xFF0000) >> 16));
            param1.writer.writeByte(int((_loc3_ & 0xFF00) >> 8));
            param1.writer.writeByte(int(_loc3_ & 0xFF));
         }
      }
      
      public static function decodeLength(param1:ProtocolBuffer) : int
      {
         var _loc2_:int = 0;
         var _loc3_:* = false;
         var _loc4_:int = 0;
         var _loc5_:int = int(param1.reader.readByte());
         var _loc6_:*;
         if(_loc6_ = (_loc5_ & 0x80) == 0)
         {
            return _loc5_;
         }
         _loc2_ = int(param1.reader.readByte());
         _loc3_ = (_loc5_ & 0x40) == 0;
         if(_loc3_)
         {
            return ((_loc5_ & 0x3F) << 8) + (_loc2_ & 0xFF);
         }
         _loc4_ = int(param1.reader.readByte());
         return ((_loc5_ & 0x3F) << 16) + ((_loc2_ & 0xFF) << 8) + (_loc4_ & 0xFF);
      }
   }
}

