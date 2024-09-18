package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import Renamed349.TargetHitInfo;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class VectorCodecTargetHit implements ICodec
   {
      private var elementCodec:ICodec;
      
      private var Renamed5009:Boolean;
      
      public function VectorCodecTargetHit(param1:CodecRegisterer)
      {
         super();
         this.elementCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecTargetHit");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var len:int = param1.readInt();
         var _loc3_:Vector.<TargetHitInfo> = new Vector.<TargetHitInfo>(len,true);
         var _loc4_:int = 0;
         while(_loc4_ < len)
         {
            _loc3_[_loc4_] = TargetHitInfo(this.elementCodec.decode(param1));
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
         var _loc3_:int = 0;
         var _loc4_:Vector.<TargetHitInfo> = Vector.<TargetHitInfo>(param2);
         var _loc5_:int = int(_loc4_.length);
         param1.writeInt(_loc5_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ += this.elementCodec.encode(param1,_loc4_[_loc6_]);
            _loc6_++;
         }
         return _loc3_ + 4;
      }
   }
}

