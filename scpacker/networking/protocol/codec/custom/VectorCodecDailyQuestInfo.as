package scpacker.networking.protocol.codec.custom
{
   import §>#m§.§5!"§;
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class VectorCodecDailyQuestInfo implements ICodec
   {
      private var elementCodec:ICodec;
      
      private var §?"_§:Boolean;
      
      public function VectorCodecDailyQuestInfo(param1:§?"s§)
      {
         super();
         this.elementCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDailyQuestInfo");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:Vector.<§5!"§> = new Vector.<§5!"§>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = §5!"§(this.elementCodec.decode(param1));
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
         var _loc3_:Vector.<§5!"§> = Vector.<§5!"§>(param2);
         var _loc4_:int = int(_loc3_.length);
         param1.writeInt(_loc4_);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ += this.elementCodec.encode(param1,_loc3_[_loc6_]);
            _loc6_++;
         }
         return _loc5_;
      }
   }
}

