package scpacker.networking.protocol.codec.custom
{
   import Renamed4594.Renamed6342;
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class VectorCodecClientAssaultFlag implements ICodec
   {
      private var elementCodec:ICodec;
      
      private var Renamed5009:Boolean;
      
      public function VectorCodecClientAssaultFlag(param1:CodecRegisterer)
      {
         super();
         this.elementCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecClientAssaultFlag");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:Vector.<Renamed6342> = new Vector.<Renamed6342>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = Renamed6342(this.elementCodec.decode(param1));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Vector.<Renamed6342> = Vector.<Renamed6342>(param2);
         var _loc4_:int = int(_loc3_.length);
         param1.writeInt(_loc4_);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            this.elementCodec.encode(param1,_loc3_[_loc5_]);
            _loc5_++;
         }
         return 4;
      }
   }
}

