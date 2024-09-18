package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import §catch set default§.§%2§;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class VectorCodecBattleMine implements ICodec
   {
      private var elementCodec:ICodec;
      
      private var §?"_§:Boolean;
      
      public function VectorCodecBattleMine(param1:§?"s§)
      {
         super();
         this.elementCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecBattleMine");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:Vector.<§%2§> = new Vector.<§%2§>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = §%2§(this.elementCodec.decode(param1));
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
         var _loc4_:Vector.<§%2§> = Vector.<§%2§>(param2);
         var _loc5_:int = int(_loc4_.length);
         param1.writeInt(_loc5_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ += this.elementCodec.encode(param1,_loc4_[_loc6_]);
            _loc6_++;
         }
         return _loc3_;
      }
   }
}

