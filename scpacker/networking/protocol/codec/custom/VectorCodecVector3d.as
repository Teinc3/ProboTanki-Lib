package scpacker.networking.protocol.codec.custom
{
   import §;"?§.§#">§;
   import §[" §.§#""§;
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class VectorCodecVector3d extends §#""§ implements ICodec
   {
      private var elementCodec:ICodec;
      
      private var §?"_§:Boolean;
      
      public function VectorCodecVector3d(param1:§?"s§)
      {
         super();
         this.elementCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         if(§each catch else§(param1))
         {
            return null;
         }
         var _loc2_:int = param1.readInt();
         var _loc3_:Vector.<§#">§> = new Vector.<§#">§>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = §#">§(this.elementCodec.decode(param1));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 1;
         if(§%"s§(param1,param2))
         {
            return _loc3_;
         }
         var _loc4_:Vector.<§#">§> = Vector.<§#">§>(param2);
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

