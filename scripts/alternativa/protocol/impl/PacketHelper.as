package alternativa.protocol.impl
{
   import alternativa.protocol.CompressionType;
   import alternativa.protocol.ProtocolBuffer;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class PacketHelper
   {
      private static const ZIP_PACKET_SIZE_DELIMITER:int = 2000;
      
      private static const LONG_SIZE_DELIMITER:int = 16384;
      
      private static const ZIPPED_FLAG:int = 64;
      
      private static const BIG_LENGTH_FLAG:int = 128;
      
      private static const HELPER:ByteArray = new ByteArray();
      
      public function PacketHelper()
      {
         super();
      }
      
      public static function unwrapPacket(param1:IDataInput, param2:ProtocolBuffer, param3:CompressionType) : Boolean
      {
         var _loc4_:* = false;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         if(param1.bytesAvailable < 2)
         {
            return false;
         }
         var _loc10_:int = int(param1.readByte());
         var _loc11_:*;
         if(_loc11_ = (_loc10_ & BIG_LENGTH_FLAG) != 0)
         {
            if(param1.bytesAvailable < 3)
            {
               return false;
            }
            _loc4_ = param3 != CompressionType.NONE;
            _loc6_ = (_loc10_ ^ BIG_LENGTH_FLAG) << 24;
            _loc7_ = (param1.readByte() & 0xFF) << 16;
            _loc8_ = (param1.readByte() & 0xFF) << 8;
            _loc9_ = param1.readByte() & 0xFF;
            _loc5_ = _loc6_ + _loc7_ + _loc8_ + _loc9_;
         }
         else
         {
            _loc4_ = (_loc10_ & ZIPPED_FLAG) != 0;
            _loc6_ = (_loc10_ & 0x3F) << 8;
            _loc8_ = param1.readByte() & 0xFF;
            _loc5_ = _loc6_ + _loc8_;
         }
         if(param1.bytesAvailable < _loc5_)
         {
            return false;
         }
         var _loc12_:ByteArray = new ByteArray();
         if(_loc5_ != 0)
         {
            param1.readBytes(_loc12_,0,_loc5_);
         }
         if(_loc4_)
         {
            _loc12_.uncompress();
         }
         _loc12_.position = 0;
         var _loc13_:ByteArray = ByteArray(param2.reader);
         OptionalMapCodecHelper.decodeNullMap(_loc12_,param2.optionalMap);
         _loc13_.writeBytes(_loc12_,_loc12_.position,_loc12_.length - _loc12_.position);
         _loc13_.position = 0;
         return true;
      }
      
      public static function wrapPacket(param1:IDataOutput, param2:ProtocolBuffer, param3:CompressionType) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         switch(param3)
         {
            case CompressionType.NONE:
               break;
            case CompressionType.DEFLATE:
               _loc7_ = true;
               break;
            case CompressionType.DEFLATE_AUTO:
               _loc7_ = determineZipped(param2.reader);
         }
         HELPER.position = 0;
         HELPER.length = 0;
         OptionalMapCodecHelper.encodeNullMap(param2.optionalMap,HELPER);
         param2.reader.readBytes(HELPER,HELPER.position,param2.reader.bytesAvailable);
         HELPER.position = 0;
         var _loc8_:Boolean = isLongSize(HELPER);
         if(_loc7_)
         {
            HELPER.compress();
         }
         var _loc9_:int = int(HELPER.length);
         if(_loc8_)
         {
            _loc4_ = _loc9_ + (BIG_LENGTH_FLAG << 24);
            param1.writeInt(_loc4_);
         }
         else
         {
            _loc5_ = int(((_loc9_ & 0xFF00) >> 8) + (_loc7_ ? ZIPPED_FLAG : 0));
            _loc6_ = int(_loc9_ & 0xFF);
            param1.writeByte(_loc5_);
            param1.writeByte(_loc6_);
         }
         param1.writeBytes(HELPER,0,_loc9_);
      }
      
      private static function isLongSize(param1:IDataInput) : Boolean
      {
         return param1.bytesAvailable >= LONG_SIZE_DELIMITER || param1.bytesAvailable == -1;
      }
      
      private static function determineZipped(param1:IDataInput) : Boolean
      {
         return param1.bytesAvailable == -1 || param1.bytesAvailable > ZIP_PACKET_SIZE_DELIMITER;
      }
      
      private static function bytesToString(param1:ByteArray, param2:int, param3:int, param4:int) : String
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:* = "";
         var _loc10_:int = int(param1.position);
         param1.position = param2;
         while(param1.bytesAvailable > 0 && _loc7_ < param3)
         {
            _loc7_++;
            _loc8_ = param1.readUnsignedByte().toString(16);
            if(_loc8_.length == 1)
            {
               _loc8_ = "0" + _loc8_;
            }
            _loc9_ += _loc8_;
            _loc6_++;
            if(_loc6_ == 4)
            {
               _loc6_ = 0;
               _loc5_++;
               if(_loc5_ == param4)
               {
                  _loc5_ = 0;
                  _loc9_ += "\n";
               }
               else
               {
                  _loc9_ += "  ";
               }
            }
            else
            {
               _loc9_ += " ";
            }
         }
         if(_loc7_ < param3)
         {
            _loc9_ += "\nOnly " + _loc7_ + " of " + param3 + " bytes have been read";
         }
         param1.position = _loc10_;
         return _loc9_;
      }
   }
}

